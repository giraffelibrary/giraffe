(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

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
    structure MLton :
      sig
        type p1 and 'a p2
        type r1 and ('a, 'b) r2
      end

    include
      C_ARRAY
        where type elem = char
        where type vector = string

        (* It is necessary to expose the following type representations because
         * the tuple elements must occur as individual elements in the tuple
         * argument of the imported C function. *)
        where type 'a C.in_p = MLton.p1 * 'a MLton.p2
        where type ('a, 'b) C.r = MLton.r1 * ('a, 'b) MLton.r2
  end =
  struct
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
    structure ElemType = GCharCType
    structure Pointer = CTypedPointer (ElemType)
    datatype t =
      SMLString of cstring
    | CString   of Pointer.t Finalizable.t

    type vector = string
    type elem = char

    structure C =
      struct
        type 'a p = 'a Pointer.p
        type notnull = Pointer.notnull

        val dupSMLValue_ = _import "g_strdup" : cstring -> notnull p;
        val dupPointer_ = _import "g_strdup" : notnull p -> notnull p;
        val free_ = _import "g_free" : notnull p -> unit;
        val len_ = _import "strlen" : notnull p -> int;

        val free = free_
        val len = len_
        fun sub p i = Pointer.get (p, i)
        (* For `sub p i` we must ensure `0 <= i andalso i < len p` *)


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
        type 'a out_p = 'a OutPointer.p

        fun fromPtr (p : notnull out_p) : t =
          CString (Finalizable.new p)

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val str = Finalizable.new p
          in
            Finalizable.addFinalizer (str, free);
            CString str
          end

        fun copyPtr (p : notnull out_p) : t =
          SMLString (toSMLValue p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          tabulate (len p, sub p)

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free p

        (* For `copyToVector p`, conversion via a `cstring`, rather than
         * directly to a `string`, is deliberate.  This should ensure that
         * the SML string representation is null-terminated internally
         * allowing MLton to efficiently derive a null-terminated variant of
         * the SML string, if required subsequently. *)
        fun copyPtrToVector (p : notnull out_p) : vector =
          CString.toString (toSMLValue p)

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free p


        fun fromOptPtr (p : 'a out_p) : t option =
          Option.map fromPtr (Pointer.toOpt p)

        fun fromNewOptPtr (p : 'a out_p) : t option =
          Option.map fromNewPtr (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun copyOptPtr (p : 'a out_p) : t option =
          Option.map copyPtr (Pointer.toOpt p)

        fun copyNewOptPtr (p : 'a out_p) : t option =
          Option.map copyNewPtr (Pointer.toOpt p)

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)


        fun fromVector v = dupSMLValue_ (CString.fromString v)


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
            p & withPointer f p handle e => (Pointer.appOpt free p; raise e)
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
        type ('a, 'b) r = cstring * (unit, 'b) Pointer.r

        fun toRef x = Pointer.MLton.toRef x
        fun fromRef x = Pointer.MLton.fromRef x

        local
          (* `null` needs to be a function to work around the value restriction *)
          fun null () : ('a, 'b) r =
                 (toCString "",         toRef nonNull)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (toCString "\255",     toRef nonNull)
            else (toCString "\255\255", toRef (Pointer.toOptNull p))

          fun fromSMLValue (s : cstring) : ('a, 'b) r =
                 (s,                    toRef Pointer.null)

          fun apply f (x as (_, e)) =
            let val y = f x in fromRef e & y end
            (* must evaluate `f x` before `! (...)` *)

          fun withRefPointer f p =
            apply f (fromPointer p)

          fun withRefDupPointer f p =
            withRefPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withNullRef f () = f (null ())


          fun withRefPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstPtr f =
            fn
              SMLString s => apply f (fromSMLValue s)
            | CString str => Finalizable.withValue (str, withRefPointer f)

          fun withRefDupPtr f =
            fn
              SMLString s => withRefDupPointer f (dupSMLValue_ s)
            | CString str =>
                Finalizable.withValue (str, withRefDupPointer f o dupPointer_)


          fun withRefOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstOptPtr f =
            fn
              SOME (SMLString s) => apply f (fromSMLValue s)
            | SOME (CString str) => Finalizable.withValue (str, withRefPointer f)
            | NONE               => withRefPointer f Pointer.null

          fun withRefDupOptPtr f =
            fn
              SOME (SMLString s) => withRefDupPointer f (dupSMLValue_ s)
            | SOME (CString str) =>
                Finalizable.withValue (str, withRefDupPointer f o dupPointer_)
            | NONE               => withRefDupPointer f Pointer.null
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
        type p1 = cstring
        type 'a p2 = unit Pointer.p

        type r1 = cstring
        type ('a, 'b) r2 = (unit, 'b) Pointer.r
      end
  end
