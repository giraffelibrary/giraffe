(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

(**
 * DESIGN ISSUE
 *
 * The purpose of this high-level FFI module is to enable a pointer to an SML
 * vector in the ML heap to be supplied for an array argument that is treated
 * as const.  This avoids the need to temporarily copy the array onto the
 * C heap.  However, if a C function is given a pointer into the ML heap, it
 * is possible that the C function returns a pointer into the ML heap to the
 * caller.  GI annotations for such a C function would indicate that the data
 * in the ML heap is not owned, so a copy would be taken.  The copy is made
 * from the SML side using `FFI.[from|copy][Opt]Ptr`.  If a GC occurs after
 * the C function returns but before the copy is made, the pointer to copy
 * from may no longer be valid.  There is no obvious work around for this
 * issue.
 *
 * The instability of addresses in the ML heap also means that the functions
 * `FFI.with[Ref|Dup][Opt]Ptr d` do not support all possible depths `d`.
 *
 * Despite these general issues, many C functions are not affected so the
 * module is retained for experimental purposes and for targeted use but it
 * is not used elsewhere in Giraffe Library.
 *)

functor ConstCArrayN(CArrayType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) :>
  C_ARRAY_N
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a update = 'a  (* immutable *)
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type C.ArrayType.e = CArrayType.e
    where type 'a C.ArrayType.p = 'a CArrayType.p
    where type C.ArrayType.opt = CArrayType.opt
    where type C.ArrayType.non_opt = CArrayType.non_opt =
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
        type 'a from_p = 'a CArrayType.from_p
        type e = CArrayType.e

        structure PointerType = CArrayType
        structure ArrayType = CArrayType
      end

    (**
     * For MLton, `array`, the representation of an immutable C array, is
     * either
     *   - a pointer to a C array allocated on the C heap and the number of
     *     elements for which space was allocated or
     *   - an SML vector.
     * A finalizable value is used to free an array on the C heap when no
     * longer reachable.  An SML vector may contain elements that are
     * allocated on the C heap so a finalizable value is used to free the
     * elements when the vector is no longer reachable.
     *
     * The SML vector case is included because MLton can pass a pointer to an
     * SML vector value (that points into the SML heap) to a C function,
     * avoiding the need to allocate a copy of the vector on the C heap.
     * MLton requires that vectors allocated in the SML heap are not modified
     * in place.  Consequently, `FFI.with[Ref|Dup][Opt]Ptr d` should be used
     * only for a C array parameter that is treated as const from depth `d`
     * and below.
     *)
    datatype array =
      CArray of C.non_opt C.p Finalizable.t * int
    | SMLValue of C.ArrayType.CVector.cvector Finalizable.t

    type t = array * int

    structure C =
      struct
        open C

        fun takePtr p n =
          let
            val a = Finalizable.new p
            val () = Finalizable.addFinalizer (a, PointerType.free ~1 n)
          in
            (CArray (a, n), n)
          end

        fun giveDupPtr f =
          let
            fun check f n p = f n p handle e => (PointerType.free ~1 n p; raise e)
          in
            fn
              (CArray (a, _), n) =>
                Finalizable.withValue (a, check f n o PointerType.dup ~1 n)
            | (SMLValue v, n) =>
                Finalizable.withValue (v, check f n o ArrayType.CVector.toPointer n)
          end

        val touchPtr =
          fn
            (CArray (a, _), _) => Finalizable.touch a
          | _                  => ()
      end

    fun toSMLValue cvector =
      let
        val v = Finalizable.new cvector
      in
        Finalizable.addFinalizer (v, C.ArrayType.CVector.free);
        (SMLValue v, C.ArrayType.CVector.clen cvector)
      end

    structure FFI =
      struct
        open C.ArrayType

        type 'a tabulator = int * (int -> elem) -> 'a
        (* For any `tabulate : 'a tabulator` we require that
         * `tabulate (n, sub)` applies `sub` to values of `i` that satisfy
         * `0 <= i andalso i < n` *)


        val touchPtr = C.touchPtr

        fun touchOptPtr t = Option.app touchPtr t


        (**
         * Return values
         *)
        structure OutPointer = Pointer
        type 'a out_p = 'a OutPointer.p

        local
        in
          fun fromPtr d =
            if d < 0
            then
              (* If `d < 0`, we own everything so just wrap it. *)
              C.takePtr
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
              fn n =>
                (
                  toSMLValue (CVector.fromPointer n p)
                    handle CVector.NoSMLValue => C.takePtr (dup ~1 n p) n
                )
                 before free d n p
        end

        fun copyPtr tabulate d p n =
          tabulate (len n p, getElem n p) before free d n p


        fun fromOptPtr d p n =
          Option.map (fn p => fromPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

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

        val nonNullPointer =
          Pointer.toOptPtr (Pointer.Memory.Pointer.sub (Pointer.null, 0w1))


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
                (CArray (a, _), _) => Finalizable.withValue (a, withPointer ignore f)
              | (SMLValue v, _) => Finalizable.withValue (v, f o fromSMLValue)
            else
            if d < 0
            then
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withPointer (free d n) f o dup d n)
              | (SMLValue v, n) =>
                  Finalizable.withValue
                    (
                      v,
                      fn c =>
                        withPointer (free ~1 n) f (CVector.toPointer n c)
                    )
            else
              raise Fail "ConstCArrayN().FFI.withPtr: transfer depth > 0 not supported"

          fun withDupPtr d =
            if d >= 0
            then
              raise Fail "ConstCArrayN().FFI.withDupPtr: transfer depth >= 0 not supported"
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withDupPointer (free d n) f o dup d n)
              | (SMLValue v, n) =>
                  Finalizable.withValue
                    (
                      v,
                      fn c =>
                        withDupPointer (free ~1 n) f (CVector.toPointer n c)
                    )


          fun withOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withPointer ignore f)
              | SOME (SMLValue v, _) => Finalizable.withValue (v, f o fromSMLValue)
              | NONE => withPointer ignore f Pointer.null
            else
            if d < 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withPointer (free d n) f o Pointer.toOptPtr o dup d n)
              | SOME (SMLValue v, n) =>
                  Finalizable.withValue
                    (
                      v,
                      fn c =>
                        withPointer (free ~1 n) f
                         (Pointer.toOptPtr (CVector.toPointer n c))
                    )
              | NONE => withPointer ignore f Pointer.null
            else
              raise Fail "ConstCArrayN().FFI.withOptPtr: transfer depth > 0 not supported"

          fun withDupOptPtr d =
            if d >= 0
            then
              raise Fail "ConstCArrayN().FFI.withDupOptPtr: transfer depth >= 0 not supported"
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withDupPointer (free d n) f o Pointer.toOptPtr o dup d n)
              | SOME (SMLValue v, n) =>
                  Finalizable.withValue
                    (
                      v,
                      fn c =>
                        withDupPointer (free ~1 n) f
                         (Pointer.toOptPtr (CVector.toPointer n c))
                    )
              | NONE => withDupPointer ignore f Pointer.null


          fun withNewPtr f n =
            withDupPointer (free 1 n) f (new n)
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
                (CArray (a, _), _) => Finalizable.withValue (a, withRefPointer ignore (apply f))
              | (SMLValue v, _) => Finalizable.withValue (v, apply f o fromSMLValue)
            else
            if d < 0
            then
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withRefPointer (free d n) (apply f) o dup d n)
              | (SMLValue v, n) =>
                  Finalizable.withValue
                    (
                      v,
                      fn c =>
                        withRefPointer (free ~1 n) (apply f)
                          (CVector.toPointer n c)
                    )
            else
              raise Fail "ConstCArrayN().FFI.withRefPtr: transfer depth > 0 not supported"


          fun withRefOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withRefPointer ignore (apply f))
              | SOME (SMLValue v, _) =>
                  Finalizable.withValue (v, apply f o fromSMLValue)
              | NONE => withRefPointer ignore (apply f) Pointer.null
            else
            if d < 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withRefPointer (free d n) (apply f) o dup d n)
              | SOME (SMLValue v, n) =>
                  Finalizable.withValue
                    (
                      v,
                      fn c =>
                        withRefPointer (free ~1 n) (apply f)
                          (CVector.toPointer n c)
                    )
              | NONE => withRefPointer ignore (apply f) Pointer.null
            else
              raise Fail "ConstCArrayN().FFI.withRefOptPtr: transfer depth > 0 not supported"
        end
      end

    fun fromSequence v =
      let
        val n = C.ArrayType.ElemSequence.length v
      in
        toSMLValue (C.ArrayType.CVector.fromVal v)
          handle C.ArrayType.CVector.NoSMLValue =>
            FFI.fromPtr ~1 (C.ArrayType.toC n v) n
      end

    val toSequence =
      fn
        (CArray (a, _), n) => Finalizable.withValue (a, C.ArrayType.fromC n)
      | (SMLValue v, _) => Finalizable.withValue (v, C.ArrayType.CVector.toVal)

    fun tabulate (n, f) =
      FFI.fromPtr ~1 (C.ArrayType.init C.ArrayType.setElem (n, f)) n

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
        fun tabulateFromC n p = List.tabulate (len n p, getElem n p)
        fun tabulateFromSML n v = List.tabulate (n, CVector.cget v)
      in
        fn
          (CArray (a, _), n) => Finalizable.withValue (a, tabulateFromC n)
        | (SMLValue v, n) => Finalizable.withValue (v, tabulateFromSML n)
      end

    val length =
      fn
        (CArray (a, _), n) => Finalizable.withValue (a, C.ArrayType.len n)
      | (SMLValue v, n) => Finalizable.withValue (v, fn _ => n)

    val get =
      fn
        (CArray (a, _), n) =>
          let
            val get = Finalizable.withValue (a, C.ArrayType.getElem n)
          in
            fn i =>
              if 0 <= i andalso i < n
              then get i
              else raise Subscript
          end
      | (SMLValue v, _) => Finalizable.withValue (v, C.ArrayType.CVector.cget)

    fun sub (t, i) = get t i

    type 'a update = 'a

    val set =
      fn
        (CArray (a, _), n) =>
          let
            fun f (i, elem) j =
              if i = j
              then SOME elem
              else NONE

            val get = Finalizable.withValue (a, C.ArrayType.get n)
            fun set n p (i, optElem) =
              case optElem of
                NONE      => C.ArrayType.set n p (i, get i)
              | SOME elem => C.ArrayType.setElem n p (i, elem)
          in
            fn (i, elem) =>
              if 0 <= i andalso i < n
              then FFI.fromPtr ~1 (C.ArrayType.init set (n, f (i, elem))) n
              else raise Subscript
          end
      | (SMLValue v, _) =>
          toSMLValue o Finalizable.withValue (v, C.ArrayType.CVector.cset)

    fun update (t, i, e) = set t (i, e)

    val full =
      fn
        (array as CArray (_, len), _) => (array, len)
      | (array as SMLValue v, _) =>
          (array, Finalizable.withValue (v, C.ArrayType.CVector.clen))

    fun subslice (t as (array, _), len) =
      if 0 <= len andalso len <= length t
      then (array, len)
      else raise Subscript

    structure MLton =
      struct
        type p1 = C.ArrayType.CVector.cvector
        type 'a p2 = FFI.opt C.Pointer.p

        type r1 = C.ArrayType.CVector.cvector
        type ('a, 'b) r2 = (FFI.opt, 'b) C.Pointer.r
      end
  end
