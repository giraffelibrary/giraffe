(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CArray(CArrayType : C_ARRAY_TYPE where type 'a from_p = 'a) :>
  C_ARRAY
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type 'a C.p = 'a CArrayType.p
    where type C.opt = CArrayType.opt
    where type C.non_opt = CArrayType.non_opt =
  struct
    type elem = CArrayType.elem
    type sequence = CArrayType.t

    structure C =
      struct
        structure Pointer = CArrayType.Pointer
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
        type ('a, 'b) r = ('a, 'b) Pointer.r

        structure ArrayType = CArrayType
      end

    (**
     * For MLton, `array`, the representation of an immutable C array, is
     * either
     *   - a pointer to a C array allocated on the C heap or
     *   - an SML vector.
     * A finalizable value is used to free an array on the C heap when no
     * longer reachable.
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
    datatype array =
      CArray of C.non_opt C.p Finalizable.t
    | SMLValue of C.ArrayType.CVector.cvector Finalizable.t

    type t = array

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

        local
          fun wrap d p =
            let
              val a = Finalizable.new p
            in
              Finalizable.addFinalizer (a, free d);
              CArray a
            end
        in
          fun fromPtr d =
            if d < 0
            then
              (* If `d < 0`, we own everything so just wrap it. *)
              wrap ~1
            else
              (* If `d = 0`, we own nothing so a full copy is required.
               *
               * If `d > 0`, we own `d` initial levels but need ownership of
               * the deeper levels.  The implementation here is potentially
               * inefficient in this case because it makes a full copy and
               * frees the initial levels that we owned.  This is especially
               * inefficient if the unowned elements are reference counted
               * because the initial level could have been used.
               * If this leads to a performance issue, consideration
               * could be given to improving this case by copying the
               * deeper levels and updating the initial levels that
               * we own. *)
              fn p =>
                (
                  toSMLValue (CVector.fromPointer p)
                    handle CVector.NoSMLValue => wrap ~1 (dup ~1 p)
                )
                 before free d p
        end

        fun copyPtr tabulate d p =
          tabulate (len p, getElem p) before free d p


        fun fromOptPtr d p =
          Option.map (fromPtr d) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

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

        val nonNullPointer = Pointer.toOptPtr (Pointer.sub 0w1 Pointer.null)


        (**
         * Value parameters
         *
         * The C interface uses two parameters, sml_str and c_str, with a
         * C-side transformation that derives a single pointer str from
         * sml_str and c_str according to the following table:
         *
         *   CVector.cvector     opt p       |
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
        type 'a in_p = CVector.cvector * opt p

        local
          fun fromPointer (p : 'a p) : 'b in_p =
            if Pointer.isNull p
            then (CVector.v1, nonNullPointer)
            else (CVector.v2, Pointer.toOptPtr p)

          fun fromSMLValue (v : CVector.cvector) : 'a in_p = (v, Pointer.null)

          fun withPointer free f p =
            f (fromPointer p) handle e => (Pointer.appNonNullPtr free p; raise e)

          fun withDupPointer free f p =
            p & withPointer free f p
        in
          fun withPtr d =
            if d = 0
            then
              fn f =>
              fn
                CArray a => Finalizable.withValue (a, withPointer ignore f)
              | SMLValue v => Finalizable.withValue (v, f o fromSMLValue)
            else
              fn f =>
              fn
                CArray a =>
                  Finalizable.withValue (a, withPointer (free d) f o dup d)
              | SMLValue v =>
                  Finalizable.withValue
                    (v, withPointer (free ~1) f o CVector.toPointer)

          fun withDupPtr d f =
            fn
              CArray a =>
                Finalizable.withValue (a, withDupPointer (free d) f o dup d)
            | SMLValue v =>
                Finalizable.withValue
                  (v, withDupPointer (free ~1) f o CVector.toPointer)


          fun withOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray a) => Finalizable.withValue (a, withPointer ignore f)
              | SOME (SMLValue v) => Finalizable.withValue (v, f o fromSMLValue)
              | NONE => withPointer ignore f Pointer.null
            else
              fn f =>
              fn
                SOME (CArray a) =>
                  Finalizable.withValue
                    (a, withPointer (free d) f o Pointer.toOptPtr o dup d)
              | SOME (SMLValue v) =>
                  Finalizable.withValue
                    (v, withPointer (free ~1) f o Pointer.toOptPtr o CVector.toPointer)
              | NONE => withPointer ignore f Pointer.null

          fun withDupOptPtr d f =
            fn
              SOME (CArray a) =>
                Finalizable.withValue
                  (a, withDupPointer (free d) f o Pointer.toOptPtr o dup d)
            | SOME (SMLValue v) =>
                Finalizable.withValue
                  (v, withDupPointer (free ~1) f o Pointer.toOptPtr o CVector.toPointer)
            | NONE => withDupPointer ignore f Pointer.null
        end


        (**
         * Reference parameters
         *
         * The C interface uses two parameters, sml_str and c_str_ptr, with
         * a C-side transformation that derives a single pointer str_ptr from
         * sml_str and c_str_ptr according to the following table:
         *
         *   CVector.cvector     opt p                |
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
        type ('a, 'b) r = CVector.cvector * (opt, 'b) Pointer.r

        fun toRef x = Pointer.MLton.toRef x
        fun fromRef x = Pointer.MLton.fromRef x

        local
          (* `null` needs to be a function to work around the value restriction *)
          fun null () : ('a, 'b) r =
                 (CVector.v1, toRef nonNullPointer)

          fun fromPointer (p : 'a p) : ('b, 'c) r =
            if Pointer.isNull p
            then (CVector.v2, toRef nonNullPointer)
            else (CVector.v3, toRef (Pointer.toOptPtr p))

          fun fromSMLValue (v : CVector.cvector) : ('a, 'b) r =
                 (v,          toRef Pointer.null)

          fun apply f (x as (_, e)) =
            let val y = f x in fromRef e & y end
            (* must evaluate `f x` before `fromRef e` *)

          fun withRefPointer free f p =
            f (fromPointer p) handle e => (free p; raise e)
        in
          fun withNullRef f () = f (null ())


          fun withRefPtr d =
            if d = 0
            then
              fn f =>
              fn
                CArray a => Finalizable.withValue (a, withRefPointer ignore (apply f))
              | SMLValue v => Finalizable.withValue (v, apply f o fromSMLValue)
            else
              fn f =>
              fn
                CArray a =>
                  Finalizable.withValue
                    (a, withRefPointer (free d) (apply f) o dup d)
              | SMLValue v =>
                  Finalizable.withValue
                    (v, withRefPointer (free ~1) (apply f) o CVector.toPointer)


          fun withRefOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray a) =>
                  Finalizable.withValue (a, withRefPointer ignore (apply f))
              | SOME (SMLValue v) =>
                  Finalizable.withValue (v, apply f o fromSMLValue)
              | NONE => withRefPointer ignore (apply f) Pointer.null
            else
              fn f =>
              fn
                SOME (CArray a) =>
                  Finalizable.withValue
                    (a, withRefPointer (free d) (apply f) o dup d)
              | SOME (SMLValue v) =>
                  Finalizable.withValue
                    (v, withRefPointer (free ~1) (apply f) o CVector.toPointer)
              | NONE => withRefPointer ignore (apply f) Pointer.null
        end
      end

    fun fromSequence v =
      toSMLValue (C.ArrayType.CVector.fromVal v)
        handle C.ArrayType.CVector.NoSMLValue =>
          FFI.fromPtr ~1 (C.ArrayType.toC v)

    val toSequence =
      fn
        CArray a => Finalizable.withValue (a, C.ArrayType.fromC)
      | SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.toVal)

    fun tabulate (n, f) =
      FFI.fromPtr ~1 (C.ArrayType.init C.ArrayType.setElem (n, f))

    fun fromList es =
      let
        val n = List.length es
        val r = ref es
        fun f _ =
          case ! r of
            e :: es' => (r := es'; e)
          | []       => raise Fail "CArray().fromList: unreachable case"
      in
        tabulate (n, f)
      end

    val toList =
      let
        open C.ArrayType
        fun tabulateFromC p = List.tabulate (len p, getElem p)
        fun tabulateFromSML v = List.tabulate (CVector.clen v, CVector.cget v)
      in
        fn
          CArray a => Finalizable.withValue (a, tabulateFromC)
        | SMLValue v => Finalizable.withValue (v, tabulateFromSML)
      end

    val length =
      fn
        CArray a => Finalizable.withValue (a, C.ArrayType.len)
      | SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.clen)

    val get =
      fn
        t as CArray a =>
          let
            val n = length t
            val get = Finalizable.withValue (a, C.ArrayType.getElem)
          in
            fn i =>
              if 0 <= i andalso i < n
              then get i
              else raise Subscript
          end
      | SMLValue v => Finalizable.withValue (v, C.ArrayType.CVector.cget)

    fun sub (t, i) = get t i

    val set =
      fn
        t as CArray a =>
          let
            val n = length t

            fun f (i, elem) j =
              if i = j
              then SOME elem
              else NONE

            val get = Finalizable.withValue (a, C.ArrayType.get)
            fun set p (i, optElem) =
              case optElem of
                NONE      => C.ArrayType.set p (i, get i)
              | SOME elem => C.ArrayType.setElem p (i, elem)
          in
            fn (i, elem) =>
              if 0 <= i andalso i < n
              then FFI.fromPtr ~1 (C.ArrayType.init set (n, f (i, elem)))
              else raise Subscript
          end
      | SMLValue v =>
          toSMLValue o Finalizable.withValue (v, C.ArrayType.CVector.cset)

    fun update (t, i, e) = set t (i, e)

    structure MLton =
      struct
        type p1 = C.ArrayType.CVector.cvector
        type 'a p2 = FFI.opt C.Pointer.p

        type r1 = C.ArrayType.CVector.cvector
        type ('a, 'b) r2 = (FFI.opt, 'b) C.Pointer.r
      end
  end
