(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CArrayN(CArrayType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) :>
  C_ARRAY
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type 'a C.p = 'a CArrayType.p
    where type C.notnull = CArrayType.notnull =
  struct
    type elem = CArrayType.elem
    type sequence = CArrayType.t

    structure C =
      struct
        structure Pointer = CArrayType.Pointer
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ArrayType = CArrayType
      end

    (**
     * For MLton, `t`, the representation of an immutable C array, is either
     * a pointer to a C array allocated on the C heap or an SML vector.  A
     * finalizable value is used to free arrays on the C heap when no longer
     * reachable.
     *
     * The SML vector case is included because MLton can pass a pointer to an
     * SML vector value (that points into the SML heap) to a C function,
     * avoiding the need to allocate a copy of the vector on the C heap.
     * MLton requires that vectors allocated in the SML heap are not modified
     * in place.  Consequently, FFI.with[Ref]Ptr should be used only for a
     * C array parameter that is treated as const at every level.  (Note that
     * this is ensured with GIR bindings because FFI.with[Ref]Ptr is used only
     * for a C array parameter whose transfer mode is 'none' and therefore
     * the C function is not allowed to modify the C array because it does not
     * have ownership.)
     *)
    datatype t =
      CArray of C.notnull C.p Finalizable.t * int
    | SMLValue of C.ArrayType.CVector.cvector Finalizable.t

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

        fun fromPtr d p n =
          let
            val t = Finalizable.new p
          in
            Finalizable.addFinalizer (t, free d n);
            CArray (t, n)
          end

        fun fromDupPtr d p n = (
          toSMLValue (CVector.fromPointer n p)
            handle CVector.NoSMLValue => fromPtr ~1 (dup ~1 n p) n
        ) before free d n p

        fun copyPtr tabulate d p n =
          tabulate (len n p, toElem o get n p) before free d n p


        fun fromOptPtr d p n =
          Option.map (fn p => fromPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun fromDupOptPtr d p n =
          Option.map (fn p => fromDupPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtr tabulate d p n =
          Option.map (fn p => copyPtr tabulate d p n) (Pointer.toOpt p)
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
              CArray (a, _) => Finalizable.withValue (a, withPointer f)
            | SMLValue v => Finalizable.withValue (v, f o fromSMLValue)

          fun withDupPtr d f =
            fn
              CArray (a, n) =>
                Finalizable.withValue (a, withDupPointer (free d n) f o dup d n)
            | SMLValue v =>
                Finalizable.withValue
                  (
                    v,
                    fn c =>
                      withDupPointer (free ~1 (CVector.clen c)) f (CVector.toPointer c)
                  )


          fun withOptPtr f =
            fn
              SOME (CArray (a, _)) => Finalizable.withValue (a, withPointer f)
            | SOME (SMLValue v) => Finalizable.withValue (v, f o fromSMLValue)
            | NONE => withPointer f Pointer.null

          fun withDupOptPtr d f =
            fn
              SOME (CArray (a, n)) =>
                Finalizable.withValue
                  (a, withDupPointer (free d n) f o Pointer.toOptNull o dup d n)
            | SOME (SMLValue v) =>
                Finalizable.withValue
                  (
                    v,
                    fn c =>
                      withDupPointer (free ~1 (CVector.clen c)) f
                       (Pointer.toOptNull (CVector.toPointer c))
                  )
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
              CArray (a, _) => Finalizable.withValue (a, withRefPointer (apply f))
            | SMLValue v => Finalizable.withValue (v, apply f o fromSMLValue)

          fun withRefDupPtr d f =
            fn
              CArray (a, n) =>
                Finalizable.withValue
                  (a, withRefDupPointer (free d n) (apply f) o dup d n)
            | SMLValue v =>
                Finalizable.withValue
                  (
                    v,
                    fn c =>
                      withRefDupPointer (free ~1 (CVector.clen c)) (apply f)
                        (CVector.toPointer c)
                  )


          fun withRefOptPtr f =
            fn
              SOME (CArray (a, _)) =>
                Finalizable.withValue (a, withRefPointer (apply f))
            | SOME (SMLValue v) =>
                Finalizable.withValue (v, apply f o fromSMLValue)
            | NONE => withRefPointer (apply f) Pointer.null

          fun withRefDupOptPtr d f =
            fn
              SOME (CArray (a, n)) =>
                Finalizable.withValue
                  (a, withRefDupPointer (free d n) (apply f) o dup d n)
            | SOME (SMLValue v) =>
                Finalizable.withValue
                  (
                    v,
                    fn c =>
                      withRefDupPointer (free ~1 (CVector.clen c)) (apply f)
                        (CVector.toPointer c)
                  )
            | NONE => withRefDupPointer ignore (apply f) Pointer.null
        end
      end

    fun fromSequence v =
      toSMLValue (C.ArrayType.CVector.fromVal v)
        handle C.ArrayType.CVector.NoSMLValue =>
          FFI.fromPtr ~1 (C.ArrayType.toC v) (C.ArrayType.length v)

    val toSequence =
      fn
        CArray (a, n) => Finalizable.withValue (a, C.ArrayType.fromC n)
      | SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.toVal)

    val length =
      fn
        CArray (a, n) => Finalizable.withValue (a, C.ArrayType.len n)
      | SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.clen)

    val sub =
      fn
        CArray (a, n) =>
          let
            val len = length (CArray (a, n))
            val get = Finalizable.withValue (a, C.ArrayType.get n)
          in
            fn i =>
              if 0 <= i andalso i < len
              then C.ArrayType.toElem (get i)
              else raise Subscript
          end
      | SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.csub)

    structure MLton =
      struct
        type p1 = C.ArrayType.CVector.cvector
        type 'a p2 = unit C.Pointer.p

        type r1 = C.ArrayType.CVector.cvector
        type ('a, 'b) r2 = (unit, 'b) C.Pointer.r
      end
  end