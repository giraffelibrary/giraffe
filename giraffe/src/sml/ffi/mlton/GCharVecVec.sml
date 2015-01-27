(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharVecVec :>
  sig
    include
      C_ARRAY
        where type elem = string
        where type vector = string Vector.vector

    structure MLton :
      sig
        val fromPointer : MLton.Pointer.t -> C.notnull C.out_p
        val fromOptPointer : MLton.Pointer.t -> unit C.out_p
      end
  end
    (* It is necessary to expose the following type representations because
     * the tuple elements must occur as individual elements in the tuple
     * argument of the imported C function. *)
    where
      type 'a C.in_p = cstring vector * unit GCharVec.C.out_p array * unit CPointer.t
    where
      type ('a, 'b) C.r =
        cstring vector * unit GCharVec.C.out_p array * unit CPointer.t ref =
  struct
    structure Finalizable = MLton.Finalizable

    (**
     * For `SMLArray (v, a)`, `v` is a vector of `cstring` values, i.e.
     * null-terminated SML string values.  It is not possible to create an
     * SML value that makes `v` null-terminated on the C side.  Therefore, it
     * it is necessary to construct a null-terminated string array on the
     * C side.  Note that this can reference the `cstring` values so requires
     * only the array of C string pointers to be copied.  To avoid memory
     * allocation on each call, a mutable SML array of C pointers, `a`, is
     * created for each `v` that provides a temporary area to copy the elements
     * of `v` to on the C side.  Although `v` must be copied to `a` for each
     * foreign function call, the overhead is very low, requiring only a
     * single call to  the C function memcpy.  `a` contains one more element
     * than `v` for the null terminator.  The last element of `a` is always
     * null, so the C side does not need to write to it (and must not write
     * any other value to it).  Note that `a` must be a mutable array because
     * MLton allows foreign functions to write to the elements but does not
     * for a non-mutable vector.
     *
     * For `CArray arr`, `arr` is a finalizable pointer to memory allocated
     * from C whose finalizer frees the memory.
     *
     * explain CArray issues
     *   - array of strings allocated/freed at once; although separation of the
     *     memory management of the array and individual strings could have
     *     benefits (for example, this would allow a C string to be returned
     *     when subscripting a C string array) it is not possible because
     *     C functions that manipulate C string arrays (necessarily) allocate
     *     and free strings within the array.
     *     For example, a C function that removes strings from a string array
     *     must free them because, in C, there would be no reference to the
     *     removed strings that allows them to be freed at a later point.
     *)
    datatype t =
      SMLArray of cstring vector * unit GCharVec.C.out_p array
    | CArray   of CPointer.notnull CPointer.t Finalizable.t


    fun makeSMLArray (v : string Vector.vector) : t =
      SMLArray (
        Vector.map CString.fromString v,
        Array.array (Vector.length v + 1, GCharVec.C.OutPointer.null)
      )

    type vector = string Vector.vector
    type elem = string

    structure C =
      struct
        structure Pointer = CPointer
        type 'a p = 'a Pointer.t
        type notnull = Pointer.notnull

        val dupSMLValue_ =
          _import "g_string_vector_sml_dup"
            : cstring Vector.vector * unit GCharVec.C.out_p array -> notnull p;
        val dupPointer_ = _import "g_strdupv" : notnull p -> notnull p;
        val free_ = _import "g_strfreev" : notnull p -> unit;
        val len_ = _import "g_strv_length" : notnull p -> int;
        val sub_ : notnull p * int -> GCharVec.C.notnull GCharVec.C.out_p =
          GCharVec.MLton.fromPointer o Pointer.MLton.getPointer

        val len = len_
        fun sub p i = sub_ (p, i)

        type 'a tabulator = int * (int -> elem) -> 'a


        (**
         * Conversion functions from C arrays
         *)
        fun toSMLValue (tabulate : 'a tabulator) (p : notnull p) : 'a =
          tabulate (len p, GCharVec.C.copyPtrToVector o sub p)


        (**
         * Return values
         *)

        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.t

        fun fromPtr (p : notnull out_p) : t =
          CArray (Finalizable.new p)

        fun fromNewPtr (p : notnull out_p) : t =
          let
            val arr = Finalizable.new p
          in
            Finalizable.addFinalizer (arr, free_);
            CArray arr
          end

        fun copyPtr (p : notnull out_p) : t =
          makeSMLArray (toSMLValue Vector.tabulate p)

        fun copyNewPtr (p : notnull out_p) : t =
          copyPtr p before free_ p

        fun copyPtrToVector (p : notnull out_p) : vector =
          toSMLValue Vector.tabulate p

        fun copyNewPtrToVector (p : notnull out_p) : vector =
          copyPtrToVector p before free_ p

        fun copyPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          toSMLValue tabulate p

        fun copyNewPtrToTabulated
          (tabulate : 'a tabulator) (p : notnull out_p) : 'a =
          copyPtrToTabulated tabulate p before free_ p


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

        fun copyOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyPtrToVector (Pointer.toOpt p)

        fun copyNewOptPtrToVector (p : 'a out_p) : vector option =
          Option.map copyNewPtrToVector (Pointer.toOpt p)

        fun copyOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyPtrToTabulated tabulate) (Pointer.toOpt p)

        fun copyNewOptPtrToTabulated
          (tabulate : 'b tabulator) (p : 'a out_p) : 'b option =
          Option.map (copyNewPtrToTabulated tabulate) (Pointer.toOpt p)


        (**
         * Support for value and reference parameter encoding
         *
         * There are many possible values that can be used to represent the
         * null pointer across the FFI because many possible values exist for
         * the non-null pointers used in the encoding.  `nonNullElem` and
         * `nonNull` are the representative non-null pointers.
         *)

        val nullElem = GCharVec.C.OutPointer.null
        val nonNullElem = GCharVec.C.OutPointer.sub (nullElem, 0w1)

        val nonNull = Pointer.sub (Pointer.null, 0w1)

        val toCStringVector = Vector.fromList o map CString.fromString
        val toArray = Array.fromList


        (**
         * Value parameters
         *
         * The C interface uses three parameters, sml_vec, sml_arr and c_arr,
         * with a C-side transformation that derives a single pointer arr from
         * sml_vec, sml_arr and c_arr according to the following table:
         *
         *               unit                            |
         *   cstring      GCharVec.C.out_p   unit p      |
         *    vector      array                          |
         *                                               |
         *   gchar **    gchar **            gchar **    | gchar **
         *   sml_vec     sml_arr             c_arr       | arr
         *   --------------------------------------------+---------
         *   {...}       {...}               NULL        | sml_arr [1]
         *   {...}       {NULL}              non-NULL    | NULL
         *   {...}       {non-NULL, ...}     non-NULL    | c_arr
         *
         *   [1] sml_arr[i] := sml_vec[i] for 0 <= i < length sml_vec
         *
         *   Note
         *     {...}           is any array
         *     {NULL}          is the empty array
         *     {non-NULL, ...} is an array of length 1 or more
         *
         * The local functions `fromPointer` and `fromSMLValue` construct the
         * SML-side values for sml_vec, sml_arr and c_arr.
         *)
        type 'a in_p = cstring Vector.vector * unit GCharVec.C.out_p array * unit p

        local
          fun fromPointer (p : 'a p) : 'b in_p =
            if Pointer.isNull p
            then (toCStringVector [], toArray [nullElem],    nonNull)
            else (toCStringVector [], toArray [nullElem,
                                               nonNullElem], Pointer.toOptNull p)

          fun fromSMLValue
            (v : cstring Vector.vector, a : unit GCharVec.C.out_p array) : 'a in_p =
            (v, a, Pointer.null)

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
              SMLArray x => f (fromSMLValue x)
            | CArray arr => Finalizable.withValue (arr, withPointer f)

          fun withDupPtr f =
            fn
              SMLArray x => withDupPointer f (dupSMLValue_ x) 
            | CArray arr =>
                Finalizable.withValue (arr, withDupPointer f o dupPointer_)


          fun withOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withConstOptPtr f =
            fn
              SOME (SMLArray x) => f (fromSMLValue x)
            | SOME (CArray arr) => Finalizable.withValue (arr, withPointer f)
            | NONE              => withPointer f Pointer.null

          fun withDupOptPtr f =
            fn
              SOME (SMLArray x) =>
                withDupPointer f (Pointer.toOptNull (dupSMLValue_ x) )
            | SOME (CArray arr) =>
                Finalizable.withValue
                  (arr, withDupPointer f o Pointer.toOptNull o dupPointer_)
            | NONE              => withDupPointer f Pointer.null
        end


        (**
         * Reference parameters
         *
         * The C interface uses three parameters, sml_vec, sml_arr and
         * c_arr_ptr, with a C-side transformation that derives a single
         * pointer arr_ptr from sml_vec, sml_arr and c_arr_ptr according to
         * the following table:
         *
         *               unit                                    |
         *   cstring      GCharVec.C.out_p   unit p ref          |
         *    vector      array                                  |
         *                                                       |
         *   gchar **    gchar **            gchar ***           | gchar **
         *   sml_vec     sml_arr             c_arr_ptr           | arr_ptr
         *   ----------------------------------------------------+---------
         *   {...}       {...}               pointer to NULL     | c_arr_ptr [1, 2]
         *   {...}       {NULL}              pointer to non-NULL | NULL
         *   {...}       {non-NULL, NULL}    pointer to non-NULL | pointer to NULL
         *   {...}       {non-NULL,          pointer to non-NULL | c_arr_ptr
         *                non-NULL, ...}
         *
         *   [1] sml_arr[i] := sml_vec[i] for 0 <= i < length sml_vec
         *   [2] *c_arr_ptr := sml_arr
         *
         *   Note
         *     {...}                     is any array
         *     {NULL}                    is the empty array
         *     {non-NULL, NULL}          is an array of length 1
         *     {non-NULL, non-NULL, ...} is an array of length 2 or more
         *
         * The local functions `null`, `fromPointer` and `fromSMLValue`
         * construct the SML-side values for sml_vec, sml_arr and c_arr_ptr.
         *)
        type ('a, 'b) r =
          cstring Vector.vector * unit GCharVec.C.out_p array * unit p ref

        local
          val null : ('a, 'b) r =
                 (toCStringVector [], toArray [nullElem],    ref nonNull)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (toCStringVector [], toArray [nullElem,
                                               nonNullElem], ref nonNull)
            else (toCStringVector [], toArray [nullElem,
                                               nullElem,
                                               nonNullElem], ref (Pointer.toOptNull p))

          fun fromSMLValue
            (v : cstring Vector.vector, a : unit GCharVec.C.out_p array) :
              ('a, 'b) r =
                 (v,                  a,                     ref Pointer.null)

          fun apply f (x as (_, _, e)) =
            let val y = f x in ! (Pointer.MLton.unsafeRefConv e) & y end
            (* must evaluate `f x` before `! (...)` *)

          fun withPointer f p =
            let val q & y = f (fromPointer p) in q & y end

          fun withDupPointer f p =
            let val q & y = f (fromPointer p) in q & y end
              handle
                e => (
                  (* free new pointer `p` if `f p` raises an exception *)
                  Option.app free_ (Pointer.toOpt p);
                  raise e
                )
        in
          fun withNullRef f () = f null


          fun withRefPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstPtr f =
            fn
              SMLArray x => apply f (fromSMLValue x)
            | CArray arr => Finalizable.withValue (arr, withPointer (apply f))

          fun withRefDupPtr f =
            fn
              SMLArray x => withDupPointer (apply f) (dupSMLValue_ x)
            | CArray arr =>
                Finalizable.withValue
                  (arr, withDupPointer (apply f) o dupPointer_)


          fun withRefOptPtr _ = raise Fail "mutable arguments are not supported"

          fun withRefConstOptPtr f =
            fn
              SOME (SMLArray x) => apply f (fromSMLValue x)
            | SOME (CArray arr) =>
                Finalizable.withValue (arr, withPointer (apply f))
            | NONE              => withPointer (apply f) Pointer.null

          fun withRefDupOptPtr f =
            fn
              SOME (SMLArray x) => withDupPointer (apply f) (dupSMLValue_ x)
            | SOME (CArray arr) =>
                Finalizable.withValue
                  (arr, withDupPointer (apply f) o dupPointer_)
            | NONE              => withDupPointer (apply f) Pointer.null
        end
      end


    fun fromVector v = makeSMLArray v

    val toVector =
      fn
        SMLArray (v, _) => Vector.map CString.toString v
      | CArray arr      => Finalizable.withValue (arr, C.copyPtrToVector)

    val length =
      fn
        SMLArray (v, _) => Vector.length v
      | CArray arr      => Finalizable.withValue (arr, C.len)

    val sub =
      fn
        SMLArray (v, _) => (
          fn i => CString.toString (Vector.sub (v, i))
        )
      | CArray arr      =>
          let
            val len = length (CArray arr)
            val sub = Finalizable.withValue (arr, C.sub)
          in
            fn i =>
              if 0 <= i andalso i < len
              then GCharVec.C.copyPtrToVector (sub i)
              else raise Subscript
          end


    structure MLton =
      struct
        val fromPointer = C.Pointer.MLton.fromPointer
        val fromOptPointer = C.Pointer.MLton.fromOptPointer
      end
  end
