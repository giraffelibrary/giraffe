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
     * For Poly/ML, `array`, the representation of an immutable C array, is a
     * pointer to a C array allocated on the C heap.  A finalizable value
     * is used to free the array on the C heap when no longer reachable.
     *)
    type array = C.non_opt C.p Finalizable.t

    type t = array

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
            t
          end

        fun fromDupPtr d p =
          fromPtr ~1 (dup ~1 p) before free d p

        fun copyPtr tabulate d p =
          tabulate (len p, getElem p) before free d p


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
         * Value parameters
         *)
        type 'a in_p = 'a Pointer.p

        local
          fun withPointer f = Pointer.withVal f

          fun withOptPointer f = Pointer.withOptVal f

          fun withDupPointer free f p =
            withPointer f p handle e => (free p; raise e)

          fun withDupOptPointer free f pOpt =
            withOptPointer f pOpt
              handle e => (Option.app free pOpt; raise e)

          fun withNewDupPointer free f p =
            p & withDupPointer free f p

          fun withNewDupOptPointer free f pOpt =
            Pointer.fromOpt pOpt & withDupOptPointer free f pOpt
        in
          fun withPtr f a = Finalizable.withValue (a, withPointer f)

          fun withDupPtr d f a =
            Finalizable.withValue (a, withDupPointer (free d) f o dup d)

          fun withNewDupPtr d f a =
            Finalizable.withValue (a, withNewDupPointer (free d) f o dup d)


          fun withOptPtr f =
            fn
              SOME a => Finalizable.withValue (a, withOptPointer f o SOME)
            | NONE => withOptPointer f NONE

          fun withDupOptPtr d f =
            fn
              SOME a => Finalizable.withValue (a, withDupOptPointer (free d) f o SOME o dup d)
            | NONE => withDupOptPointer ignore f NONE

          fun withNewDupOptPtr d f =
            fn
              SOME a => Finalizable.withValue (a, withNewDupOptPointer (free d) f o SOME o dup d)
            | NONE => withNewDupOptPointer ignore f NONE
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withRefPointer f = Pointer.withRefVal f

          fun withRefOptPointer f = Pointer.withRefOptVal f

          fun withRefDupPointer free f p =
            withRefPointer f p handle e => (free p; raise e)

          fun withRefDupOptPointer free f pOpt =
            withRefOptPointer f pOpt
              handle e => (Option.app free pOpt; raise e)
        in
          fun withNullRef f = Pointer.withNullRef f


          fun withRefPtr f a = Finalizable.withValue (a, withRefPointer f)

          fun withRefDupPtr d f a =
            Finalizable.withValue (a, withRefDupPointer (free d) f o dup d)


          fun withRefOptPtr f =
            fn
              SOME a => Finalizable.withValue (a, withRefOptPointer f o SOME)
            | NONE => withRefOptPointer f NONE

          fun withRefDupOptPtr d f =
            fn
              SOME a =>
                Finalizable.withValue (a, withRefDupOptPointer (free d) f o SOME o dup d)
            | NONE => withRefDupOptPointer ignore f NONE
        end
      end

    fun fromSequence v =
      FFI.fromPtr ~1 (C.ArrayType.toC v)

    val toSequence =
      fn
        a => Finalizable.withValue (a, C.ArrayType.fromC)

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
      in
        fn
          a => Finalizable.withValue (a, tabulateFromC)
      end

    val length =
      fn
        a => Finalizable.withValue (a, C.ArrayType.len)

    val get =
      fn
        t as a =>
          let
            val n = length t
            val get = Finalizable.withValue (a, C.ArrayType.getElem)
          in
            fn i =>
              if 0 <= i andalso i < n
              then get i
              else raise Subscript
          end

    fun sub (t, i) = get t i

    val set =
      fn
        t as a =>
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

    fun update (t, i, e) = set t (i, e)

    structure PolyML =
      struct
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
