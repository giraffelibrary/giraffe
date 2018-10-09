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
     * For Poly/ML, `t`, the representation of a C array, is always
     * just a pointer to a C array either allocated on the C heap or
     * in vol array.  A finalizable value is used to free arrays on the
     * C heap when no longer reachable.
     *
     * Although conversion from an SML vector will, therefore, allocate a
     * copy of the array on the C heap, this would have happened anyway
     * before the SML vector was passed to a C function.  Furthermore, by
     * doing the allocation on conversion from an SML vector, multiple copies
     * on the C heap can be avoided by using the same `t` value.
     *)
    type t = C.notnull C.p Finalizable.t

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
        structure OutPointer = C.Pointer
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
         * Value parameters
         *)
        type 'a in_p = 'a Pointer.p

        local
          fun withPointer f = Pointer.withVal f

          fun withOptPointer f = Pointer.withOptVal f

          fun withDupPointer free f p =
            p & withPointer f p handle e => (free p; raise e)

          fun withDupOptPointer free f pOpt =
            Pointer.fromOpt pOpt & withOptPointer f pOpt
              handle e => (Option.app free pOpt; raise e)
        in
          fun withPtr f a = Finalizable.withValue (a, withPointer f)

          fun withDupPtr d f a = Finalizable.withValue (a, withDupPointer (free d) f o dup d)


          fun withOptPtr f =
            fn
              SOME a => Finalizable.withValue (a, withOptPointer f o SOME)
            | NONE => withOptPointer f NONE

          fun withDupOptPtr d f =
            fn
              SOME a => Finalizable.withValue (a, withDupOptPointer (free d) f o SOME o dup d)
            | NONE => withDupOptPointer ignore f NONE
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

    fun fromVector v = FFI.fromPtr ~1 (C.ArrayType.toC v)

    fun toVector a = Finalizable.withValue (a, C.ArrayType.fromC)

    fun length a = Finalizable.withValue (a, C.ArrayType.len)

    fun sub a =
      let
        val len = length a
        val sub = Finalizable.withValue (a, C.ArrayType.sub)
      in
        fn i =>
          if 0 <= i andalso i < len
          then C.ArrayType.toElem (sub i)
          else raise Subscript
      end

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
