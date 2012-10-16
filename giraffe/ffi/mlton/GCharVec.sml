(**
 * Structure `GCharVec` is GLib-specific (hence its prefix) because it uses
 * GLib library functions g_strdup and g_free.  Calls to g_new/g_malloc and
 * variants such as g_strdup must be matched with calls to g_free and calls
 * to malloc and variants must be matched with calls to free.  Therefore,
 * this structure is easily adapted for use with plain C by substituting
 * strdup for g_strdup and free for g_free.
 *)
structure GCharVec :>
  sig
    include
      C_ARRAY
        where type elem = char
        where type vector = string

    structure MLton :
      sig
        val fromPointer : MLton.Pointer.t -> C.notnull C.out_p
        val fromOptPointer : MLton.Pointer.t -> unit C.out_p
      end
  end
    (* It is necessary to expose the following type representations because
     * the tuple elements must occur as individual elements in the tuple
     * argument of the imported C function. *)
    where type 'a C.in_p = cstring * unit CPointer.t
    where type ('a, 'b) C.r = cstring * unit CPointer.t ref =
  struct
    structure Finalizable = MLton.Finalizable

    (**
     * For MLton, `t`, the representation of a C string, is either an
     * SML string or a C string allocated on the C heap.  The SML string case
     * is included because MLton can pass a pointer to an SML string (that
     * points into the SML heap) to a C function, avoiding the need to
     * allocate a copy of the string on the C heap.  However, MLton requires
     * that strings allocated in the SML heap must not be modified in place.
     * Consequently, the operations `C.with[Ref][Opt]Ptr` are not supported
     * in this implementation, so type `t` cannot be used in a mutable way.
     * (For C functions that modify strings in-place, the corresponding
     * operations `C.with[Ref]Dup[Opt]Ptr` must be used instead.)  Mutable
     * behaviour could, perhaps, be supported by changing type `cstring` for
     * one that uses a `CharArray.array` rather than a `CharVector.vector`
     * (i.e. `string`) as MLton allows foreign functions to update elements
     * of arrays.
     *)
    datatype t =
      SMLString of cstring
    | CString   of CPointer.notnull CPointer.t Finalizable.t

    type vector = string
    type elem = char

    structure C =
      struct
        structure Pointer = CPointer
        type 'a p = 'a Pointer.t
        type notnull = Pointer.notnull

        val dupSMLValue_ = _import "g_strdup" : cstring -> notnull p;
        val dupPointer_ = _import "g_strdup" : notnull p -> notnull p;
        val free_ = _import "g_free" : notnull p -> unit;
        val len_ = _import "strlen" : notnull p -> int;
        val sub_ : notnull p * int -> char =
          Byte.byteToChar o Pointer.MLton.getWord8

        val len = len_
        fun sub p i = sub_ (p, i)


        (**
         * Conversion functions from C arrays
         *)
        fun toSMLValue (p : notnull p) : cstring =
          CString.fromString
            (CharVector.tabulate (len p + 1, sub p))
            (* Note that `len p + 1` includes the null terminator in the
             * string, so `CString.fromString` simply validates a `string`
             * as a `cstring` rather than create a new string. *)

        type 'a tabulator = int * (int -> elem) -> 'a


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.t

        fun fromPtr (p : notnull out_p) : t =
          CString (Finalizable.new p)

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val str = Finalizable.new p
          in
            Finalizable.addFinalizer (str, free_);
            CString str
          end

        fun copyPtr (p : notnull out_p) : t = SMLString (toSMLValue p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free_ p

        (* For `copyToVector p`, conversion via a `cstring`, rather than
         * directly to a `string`, is deliberate.  This should ensure that
         * the SML string representation is null-terminated internally
         * allowing MLton to efficiently derive a null-terminated variant of
         * the SML string, if required subsequently. *)
        fun copyPtrToVector (p : notnull out_p) : vector =
          CString.toString (toSMLValue p)

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free_ p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          tabulate (len p, sub p)

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free_ p


        fun fromOptPtr (p : 'a out_p) : t option =
          Option.map fromPtr (Pointer.toOpt p)

        fun fromNewOptPtr (p : 'a out_p) : t option =
          Option.map fromNewPtr (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtr (p : 'a out_p) : t option =
          Option.map copyPtr (Pointer.toOpt p)

        fun copyNewOptPtr (p : 'a out_p) : t option =
          Option.map copyNewPtr (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)


        (**
         * Support for value and reference parameter encoding
         *
         * There are many possible values that can be used to represent the
         * null pointer across the FFI because many possible values exist for
         * the non-null pointer used in the encoding.  `nonNull` is the
         * representative non-null pointer.
         *)

        val nonNull = Pointer.sub (Pointer.null, 0w1)

        val toCString = CString.fromString


        (**
         * Value parameters
         *
         * The C interface uses two parameters, sml_str and c_str, with a
         * C-side transformation that derives a single pointer str from
         * sml_str and c_str according to the following table:
         *
         *   cstring             unit p      |
         *                                   |
         *   gchar *             gchar *     | gchar *
         *   sml_str             c_str       | str
         *   --------------------------------+---------
         *   {...}               NULL        | sml_str
         *   {NULL}              non-NULL    | NULL
         *   {non-NULL, ...}     non-NULL    | c_str
         *
         *   Note
         *     {...}           is any string
         *     {NULL}          is the empty string
         *     {non-NULL, ...} is a string of length 1 or more
         *
         * The local functions `fromPointer` and `fromSMLValue` construct the
         * SML-side values for sml_str and c_str.
         *)
        type 'a in_p = cstring * unit p

        local
          fun fromPointer (p : 'a p) : 'b in_p =
            if Pointer.isNull p
            then (toCString "",     nonNull)
            else (toCString "\255", Pointer.toOptNull p)

          fun fromSMLValue (s : cstring) : 'a in_p = (s, Pointer.null)

          fun withPointer f p = f (fromPointer p)

          fun withDupPointer f p =
            p & f (fromPointer p)
              handle
                e => (
                  (* free new pointer `p` if `f (fromPointer p)`
                   * raises an exception *)
                  Option.app free_ (Pointer.toOpt p);
                  raise e
                )
        in
          fun withPtr _ = raise Fail "mutable arguments are not supported"

          fun withConstPtr f =
            fn
              SMLString s => f (fromSMLValue s)
            | CString str => Finalizable.withValue (str, withPointer f)

          fun withDupPtr f =
            fn
              SMLString s => withDupPointer f (dupSMLValue_ s)
            | CString str =>
                Finalizable.withValue (str, withDupPointer f o dupPointer_)


          fun withOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withConstOptPtr f =
            fn
              SOME (SMLString s) => f (fromSMLValue s)
            | SOME (CString str) => Finalizable.withValue (str, withPointer f)
            | NONE               => withPointer f Pointer.null

          fun withDupOptPtr f =
            fn
              SOME (SMLString s) =>
                withDupPointer f (Pointer.toOptNull (dupSMLValue_ s))
            | SOME (CString str) =>
                Finalizable.withValue
                  (str, withDupPointer f o Pointer.toOptNull o dupPointer_)
            | NONE               => withDupPointer f Pointer.null
        end


        (**
         * Reference parameters
         *
         * The C interface uses two parameters, sml_str and c_str_ptr, with
         * a C-side transformation that derives a single pointer str_ptr from
         * sml_str and c_str_ptr according to the following table:
         *
         *   cstring     unit p                       |
         *                                            |
         *   gchar *             gchar **             | gchar **
         *   sml_str             c_str_ptr            | str_ptr
         *   -----------------------------------------+---------
         *   {...}               pointer to NULL      | c_str_ptr [1]
         *   {NULL}              pointer to non-NULL  | NULL
         *   {non-NULL, NULL}    pointer to non-NULL  | pointer to NULL
         *   {non-NULL,          pointer to non-NULL  | c_str_ptr
         *    non-NULL, ...}
         *
         *   [1] *c_str_ptr := sml_str
         *
         *   Note
         *     {...}                     is any string
         *     {NULL}                    is the empty string
         *     {non-NULL, NULL}          is a string of length 1
         *     {non-NULL, non-NULL, ...} is a string of length 2 or more
         *
         * The local functions `null`, `fromPointer` and `fromSMLValue`
         * construct the SML-side values for sml_str and c_str_ptr.
         *)
        type ('a, 'b) r = cstring * unit p ref

        local
          val null : ('a, 'b) r =
                 (toCString "",         ref nonNull)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (toCString "\255",     ref nonNull)
            else (toCString "\255\255", ref (Pointer.toOptNull p))

          fun fromSMLValue (s : cstring) : ('a, 'b) r =
                 (s,                    ref Pointer.null)

          fun apply f (x as (_, e)) =
            let val y = f x in ! (Pointer.MLton.unsafeRefConv e) & y end
            (* must evaluate `f x` before `! (...)` *)

          fun withPointer f p =
            let val q & y = f (fromPointer p) in q & y end

          fun withDupPointer f p =
            let val q & y = f (fromPointer p) in q & y end
              handle
                e => (
                  (* free new pointer `p` if `f (fromPointer p)`
                   * raises an exception *)
                  Option.app free_ (Pointer.toOpt p);
                  raise e
                )
        in
          fun withNullRef f () = f null


          fun withRefPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstPtr f =
            fn
              SMLString s => apply f (fromSMLValue s)
            | CString str => Finalizable.withValue (str, withPointer (apply f))

          fun withRefDupPtr f =
            fn
              SMLString s => withDupPointer (apply f) (dupSMLValue_ s)
            | CString str =>
                Finalizable.withValue
                  (str, withDupPointer (apply f) o dupPointer_)


          fun withRefOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstOptPtr f =
            fn
              SOME (SMLString s) => apply f (fromSMLValue s)
            | SOME (CString str) =>
                Finalizable.withValue (str, withPointer (apply f))
            | NONE               => withPointer (apply f) Pointer.null

          fun withRefDupOptPtr f =
            fn
              SOME (SMLString s) => withDupPointer (apply f) (dupSMLValue_ s)
            | SOME (CString str) =>
                Finalizable.withValue
                  (str, withDupPointer (apply f) o dupPointer_)
            | NONE               => withDupPointer (apply f) Pointer.null
        end
      end


    fun fromVector s = SMLString (CString.fromString s)

    val toVector =
      fn
        SMLString s => CString.toString s
      | CString str => Finalizable.withValue (str, C.copyPtrToVector)

    val length =
      fn
        SMLString s => CString.size s
      | CString str => Finalizable.withValue (str, C.len)

    val sub =
      fn
        SMLString s => (fn i => CString.sub (s, i))
      | CString str =>
          let
            val len = length (CString str)
            val sub = Finalizable.withValue (str, C.sub)
          in
            fn i =>
              if 0 <= i andalso i < len
              then sub i
              else raise Subscript
          end


    structure MLton =
      struct
        val fromPointer = C.Pointer.MLton.fromPointer
        val fromOptPointer = C.Pointer.MLton.fromOptPointer
      end
  end
