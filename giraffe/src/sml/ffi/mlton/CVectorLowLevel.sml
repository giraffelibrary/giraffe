(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorLowLevel(CVectorType : C_ARRAY_TYPE where type 'a from_p = 'a) :>
  C_ARRAY_LOW_LEVEL
    where type elem = CVectorType.elem
    where type vector = CVectorType.t
    where type C.ArrayType.elem = CVectorType.elem
    where type C.ArrayType.t = CVectorType.t
    where type 'a C.ArrayType.from_p = 'a CVectorType.from_p
    where type 'a C.p = 'a CVectorType.p
    where type C.notnull = CVectorType.notnull =
  struct
    type elem = CVectorType.elem
    type vector = CVectorType.t

    structure C =
      struct
        structure Pointer = CVectorType.Pointer
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ArrayType = CVectorType
      end

    (**
     * For MLton, `t`, the representation of a C array, is either an
     * SML vector or a C array allocated on the C heap.  A finalizable value
     * is used to free arrays on the C heap when no longer reachable.
     *
     * The SML vector case is included because MLton can pass a pointer to an
     * SML vector value (that points into the SML heap) to a C function,
     * avoiding the need to allocate a copy of the array on the C heap.
     * However, MLton requires that vectors allocated in the SML heap are not
     * modified in place.  Consequently, the operations
     * `FFI.with[Ref][Opt]Ptr` are not supported in this implementation, so
     * type `t` cannot be used in a mutable way.  (For C functions that
     * modify vectors in-place, the corresponding operations
     * `FFI.with[Ref]Dup[Opt]Ptr` must be used instead.)  Mutable behaviour
     * could, perhaps, be supported by changing type
     * `C.ArrayType.CVector.cvector` for one based on an array rather than a
     * vector as MLton allows foreign functions to update elements of arrays.
     *)
    datatype t =
      SMLValue of C.ArrayType.CVector.cvector Finalizable.t
    | CArray   of C.notnull C.p Finalizable.t

    fun toSMLValue cvector =
      let
        val v = Finalizable.new cvector
      in
        Finalizable.addFinalizer (v, C.ArrayType.CVector.free);
        SMLValue v
      end

    structure FFI =
      struct
        open C.ArrayType

        type 'a tabulator = int * (int -> elem) -> 'a
        (* For any `tabulate : 'a tabulator` we require that
         * `tabulate (n, sub)` applies `sub` to values of `i` that satisfy
         * `0 <= i andalso i < n` *)


        (**
         * Return values
         *)
        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.p

        fun fromPtr d p =
          let
            val t = Finalizable.new p
          in
            Finalizable.addFinalizer (t, free d);
            CArray t
          end

        fun fromDupPtr d p = (
          toSMLValue (CVector.fromPointer p)
            handle CVector.NoSMLValue => fromPtr ~1 (dup ~1 p)
        ) before free d p

        fun copyPtr tabulate d p =
          tabulate (len p, toElem o sub p) before free d p


        fun fromOptPtr d p =
          Option.map (fromPtr d) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun fromDupOptPtr d p =
          Option.map (fromDupPtr d) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtr tabulate d p =
          Option.map (copyPtr tabulate d) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)


        (**
         * Support for value and reference parameter encoding
         *
         * There are many possible values that can be used to represent the
         * null pointer across the FFI because many possible values exist for
         * the non-null pointer used in the encoding.  `nonNullPointer` is the
         * representative non-null pointer.
         *)

        val nonNullPointer = Pointer.sub (Pointer.null, 0w1)


        (**
         * Value parameters
         *
         * The C interface uses two parameters, sml_str and c_str, with a
         * C-side transformation that derives a single pointer str from
         * sml_str and c_str according to the following table:
         *
         *   CVector.cvector     unit p      |
         *                                   |
         *   gchar *             gchar *     | gchar *
         *   sml_str             c_str       | str
         *   --------------------------------+---------
         *   {...}               NULL        | sml_str
         *   {_}                 non-NULL    | NULL
         *   {_, _, ...}         non-NULL    | c_str
         *
         *   Note
         *     {...}           is a vector of any length
         *     {_}             is a vector of length 1
         *     {_, _, ...}     is a vector of length 2 or more
         *
         * The local functions `fromPointer` and `fromSMLValue` construct the
         * SML-side values for sml_str and c_str.
         *)
        type 'a in_p = CVector.cvector * unit p

        local
          fun fromPointer (p : 'a p) : 'b in_p =
            if Pointer.isNull p
            then (CVector.v1, nonNullPointer)
            else (CVector.v2, Pointer.toOptNull p)

          fun fromSMLValue (v : CVector.cvector) : 'a in_p = (v, Pointer.null)

          fun withPointer f p = f (fromPointer p)

          fun withDupPointer free f p =
            p & withPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withPtr f =
            fn
              SMLValue v => Finalizable.withValue (v, f o fromSMLValue)
            | CArray a => Finalizable.withValue (a, withPointer f)

          fun withDupPtr d f =
            fn
              SMLValue v =>
                Finalizable.withValue
                  (v, withDupPointer (free ~1) f o CVector.toPointer)
            | CArray a =>
                Finalizable.withValue (a, withDupPointer (free d) f o dup d)


          fun withOptPtr f =
            fn
              SOME (SMLValue v) => Finalizable.withValue (v, f o fromSMLValue)
            | SOME (CArray a) => Finalizable.withValue (a, withPointer f)
            | NONE => withPointer f Pointer.null

          fun withDupOptPtr d f =
            fn
              SOME (SMLValue v) =>
                Finalizable.withValue
                  (v, withDupPointer (free ~1) f o Pointer.toOptNull o CVector.toPointer)
            | SOME (CArray a) =>
                Finalizable.withValue
                  (a, withDupPointer (free d) f o Pointer.toOptNull o dup d)
            | NONE => withDupPointer ignore f Pointer.null
        end


        (**
         * Reference parameters
         *
         * The C interface uses two parameters, sml_str and c_str_ptr, with
         * a C-side transformation that derives a single pointer str_ptr from
         * sml_str and c_str_ptr according to the following table:
         *
         *   CVector.cvector     unit p               |
         *                                            |
         *   gchar *             gchar **             | gchar **
         *   sml_str             c_str_ptr            | str_ptr
         *   -----------------------------------------+---------
         *   {...}               pointer to NULL      | & sml_str
         *   {_}                 pointer to non-NULL  | NULL
         *   {_, _}              pointer to non-NULL  | pointer to NULL
         *   {_, _, _, ...}      pointer to non-NULL  | c_str_ptr
         *
         *   Note
         *     {...}           is a vector of any length
         *     {_}             is a vector of length 1
         *     {_, _}          is a vector of length 2
         *     {_, _, _, ...}  is a vector of length 3 or more
         *
         * The local functions `null`, `fromPointer` and `fromSMLValue`
         * construct the SML-side values for sml_str and c_str_ptr.
         *)
        type ('a, 'b) r = CVector.cvector * (unit, 'b) Pointer.r

        fun toRef x = Pointer.MLton.toRef x
        fun fromRef x = Pointer.MLton.fromRef x

        local
          (* `null` needs to be a function to work around the value restriction *)
          fun null () : ('a, 'b) r =
                 (CVector.v1, toRef nonNullPointer)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (CVector.v2, toRef nonNullPointer)
            else (CVector.v3, toRef (Pointer.toOptNull p))

          fun fromSMLValue (v : CVector.cvector) : ('a, 'b) r =
                 (v,          toRef Pointer.null)

          fun apply f (x as (_, e)) =
            let val y = f x in fromRef e & y end
            (* must evaluate `f x` before `fromRef e` *)

          fun withRefPointer f p =
            let val q & y = f (fromPointer p) in q & y end

          fun withRefDupPointer free f p =
            withRefPointer f p handle e => (Pointer.appOpt free p; raise e)
        in
          fun withNullRef f () = f (null ())


          fun withRefPtr f =
            fn
              SMLValue v => Finalizable.withValue (v, apply f o fromSMLValue)
            | CArray a => Finalizable.withValue (a, withRefPointer (apply f))

          fun withRefDupPtr d f =
            fn
              SMLValue v =>
                Finalizable.withValue
                  (v, withRefDupPointer (free ~1) (apply f) o CVector.toPointer)
            | CArray a =>
                Finalizable.withValue
                  (a, withRefDupPointer (free d) (apply f) o dup d)


          fun withRefOptPtr f =
            fn
              SOME (SMLValue v) =>
                Finalizable.withValue (v, apply f o fromSMLValue)
            | SOME (CArray a) =>
                Finalizable.withValue (a, withRefPointer (apply f))
            | NONE => withRefPointer (apply f) Pointer.null

          fun withRefDupOptPtr d f =
            fn
              SOME (SMLValue v) =>
                Finalizable.withValue
                  (v, withRefDupPointer (free ~1) (apply f) o CVector.toPointer)
            | SOME (CArray a) =>
                Finalizable.withValue
                  (a, withRefDupPointer (free d) (apply f) o dup d)
            | NONE => withRefDupPointer ignore (apply f) Pointer.null
        end
      end

    fun fromVector v =
      toSMLValue (C.ArrayType.CVector.fromVal v)
        handle C.ArrayType.CVector.NoSMLValue =>
          FFI.fromPtr ~1 (C.ArrayType.toC v)

    val toVector =
      fn
        SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.toVal)
      | CArray a => Finalizable.withValue (a, C.ArrayType.fromC)

    val length =
      fn
        SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.clen)
      | CArray a => Finalizable.withValue (a, C.ArrayType.len)

    val sub =
      fn
        SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.csub)
      | CArray a =>
          let
            val len = length (CArray a)
            val sub = Finalizable.withValue (a, C.ArrayType.sub)
          in
            fn i =>
              if 0 <= i andalso i < len
              then C.ArrayType.toElem (sub i)
              else raise Subscript
          end

    structure MLton =
      struct
        type p1 = C.ArrayType.CVector.cvector
        type 'a p2 = unit C.Pointer.p

        type r1 = C.ArrayType.CVector.cvector
        type ('a, 'b) r2 = (unit, 'b) C.Pointer.r
      end
  end
