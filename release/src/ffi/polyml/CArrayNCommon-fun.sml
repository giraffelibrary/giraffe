(* Copyright (C) 2016-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CArrayNCommon(CArrayType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) =
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
     * For Poly/ML, `array`, the representation of a mutable C array, is a
     * pointer to a C array allocated on the C heap and the number of
     * elements for which space was allocated.  A finalizable value
     * is used to free the array on the C heap when no longer reachable.
     *)
    datatype array =
      CArray of C.non_opt C.p Finalizable.t * int

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
          end

        val touchPtr =
          fn
            (CArray (a, _), _) => Finalizable.touch a
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

        fun fromPtr d =
          if d < 0
          then
            (* If `d < 0`, we own everything so just take it. *)
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
              C.takePtr (dup ~1 n p) n
               before free d n p

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
         * Value parameters
         *)
        type 'a in_p = 'a Pointer.p

        local
          fun withPointer free f p =
            Pointer.withVal f p handle e => (free p; raise e)

          fun withOptPointer free f optp =
            Pointer.withOptVal f optp
              handle e => (Option.app free optp; raise e)

          fun withDupPointer free f p =
            p & withPointer free f p

          fun withDupOptPointer free f optp =
            Pointer.fromOpt optp & withOptPointer free f optp
        in
          fun withPtr d =
            if d = 0
            then
              fn f =>
              fn
                (CArray (a, _), _) => Finalizable.withValue (a, withPointer ignore f)
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withPointer (free d n) f o dup d n)

          fun withDupPtr d =
            if d = 0
            then
              fn f =>
              fn
                (CArray (a, _), _) => Finalizable.withValue (a, withDupPointer ignore f)
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withDupPointer (free d n) f o dup d n)


          fun withOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withOptPointer ignore f o SOME)
              | NONE => withOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withOptPointer (free d n) f o SOME o dup d n)
              | NONE => withOptPointer ignore f NONE

          fun withDupOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withDupOptPointer ignore f o SOME)
              | NONE => withDupOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withDupOptPointer (free d n) f o SOME o dup d n)
              | NONE => withDupOptPointer ignore f NONE


          fun withNewPtr f n =
            withDupPointer (free 1 n) f (new n)
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withRefPointer free f p =
            Pointer.withRefVal f p handle e => (free p; raise e)

          fun withRefOptPointer free f optp =
            Pointer.withRefOptVal f optp
              handle e => (Option.app free optp; raise e)
        in
          fun withNullRef f = Pointer.withNullRef f


          fun withRefPtr d =
            if d = 0
            then
              fn f =>
              fn
                (CArray (a, _), _) => Finalizable.withValue (a, withRefPointer ignore f)
            else
              fn f =>
              fn
                (CArray (a, _), n) =>
                  Finalizable.withValue (a, withRefPointer (free d n) f o dup d n)


          fun withRefOptPtr d =
            if d = 0
            then
              fn f =>
              fn
                SOME (CArray (a, _), _) =>
                  Finalizable.withValue (a, withRefOptPointer ignore f o SOME)
              | NONE => withRefOptPointer ignore f NONE
            else
              fn f =>
              fn
                SOME (CArray (a, _), n) =>
                  Finalizable.withValue
                    (a, withRefOptPointer (free d n) f o SOME o dup d n)
              | NONE => withRefOptPointer ignore f NONE
        end
      end

    fun fromSequence v =
      let
        val n = C.ArrayType.ElemSequence.length v
      in
        FFI.fromPtr ~1 (C.ArrayType.toC n v) n
      end

    val toSequence =
      fn
        (CArray (a, _), n) => Finalizable.withValue (a, C.ArrayType.fromC n)

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
      in
        fn
          (CArray (a, _), n) => Finalizable.withValue (a, tabulateFromC n)
      end

    val length =
      fn
        (CArray (a, _), n) => Finalizable.withValue (a, C.ArrayType.len n)

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

    fun sub (t, i) = get t i

    val full =
      fn
        (array as CArray (_, len), _) => (array, len)

    fun subslice (t as (array, _), len) =
      if 0 <= len andalso len <= length t
      then (array, len)
      else raise Subscript

    structure PolyML =
      struct
        val cPtr = C.Pointer.PolyML.cVal
        val cOptPtr = C.Pointer.PolyML.cOptVal

        val cInPtr = C.Pointer.PolyML.cVal
        val cInOptPtr = C.Pointer.PolyML.cOptVal

        val cOutPtr = C.Pointer.PolyML.cVal
        val cOutOptPtr = C.Pointer.PolyML.cOptVal

        val cOutRef = C.Pointer.PolyML.cRef
        val cOutOptRef = C.Pointer.PolyML.cOptOutRef
        val cInOutRef = C.Pointer.PolyML.cInRef
        val cInOutOptRef = C.Pointer.PolyML.cOptOutRef
      end
  end
