(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorN (CVectorType : C_ARRAY_TYPE where type 'a C.from_p = int -> 'a) :>
  C_ARRAY
    where type elem = CVectorType.elem
    where type vector = CVectorType.vector
    where type 'a C.from_p = 'a CVectorType.C.from_p
    where type 'a C.OutPointer.p = 'a CVectorType.C.Pointer.p
    where type C.OutPointer.notnull = CVectorType.C.Pointer.notnull =
  struct
    open CVectorType

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
    type t = C.notnull C.p Finalizable.t * int

    structure C =
      struct
        open C  (* C sub-structure from CVectorType above *)

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
            (t, n)
          end

        fun copyPtr d p n =
          fromPtr ~1 (dup ~1 n p) n before free d n p

        fun copyPtrToVector d p n =
          toVector n p before free d n p

        fun copyPtrWithTabulator tabulate d p n =
          tabulate (len n p, toElem o sub n p) before free d n p


        fun fromOptPtr d p n =
          Option.map (fn p => fromPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer.  Although g_free can be
           * called with a null pointer, adding unnecessary finalizers is
           * less efficient. *)

        fun copyOptPtr d p n =
          Option.map (fn p => copyPtr d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtrToVector d p n =
          Option.map (fn p => copyPtrToVector d p n) (Pointer.toOpt p)
          (* No finalizer added for null pointer. *)

        fun copyOptPtrWithTabulator tabulate d p n =
          Option.map (fn p => copyPtrWithTabulator tabulate d p n) (Pointer.toOpt p)
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
          fun withPtr f (t, _) = Finalizable.withValue (t, withPointer f)

          fun withDupPtr d f (t, n) =
            Finalizable.withValue (t, withDupPointer (free d n) f o dup d n)


          fun withOptPtr f =
            fn
              SOME (t, _) => Finalizable.withValue (t, withOptPointer f o SOME)
            | NONE => withOptPointer f NONE

          fun withDupOptPtr d f =
            fn
              SOME (t, n) =>
                Finalizable.withValue
                  (t, withDupOptPointer (free d n) f o SOME o dup d n)
            | NONE => withDupOptPointer ignore f NONE
        end


        (**
         * Reference parameters
         *)
        type ('a, 'b) r = ('a, 'b) Pointer.r

        local
          fun withRefPointer f p = Pointer.withRefVal f p

          fun withRefOptPointer f p = Pointer.withRefOptVal f p

          fun withRefDupPointer free f p =
            withRefPointer f p handle e => (Pointer.appOpt free p; raise e)

          fun withRefDupOptPointer free f pOpt =
            withRefOptPointer f pOpt handle e => (Option.app free pOpt; raise e)
        in
          fun withNullRef f = Pointer.withNullRef f


          fun withRefPtr f (t, _) = Finalizable.withValue (t, withRefPointer f)

          fun withRefDupPtr d f (t, n) =
            Finalizable.withValue (t, withRefDupPointer (free d n) f o dup d n)


          fun withRefOptPtr f =
            fn
              SOME (t, _) => Finalizable.withValue (t, withRefOptPointer f o SOME)
            | NONE => withRefOptPointer f NONE

          fun withRefDupOptPtr d f =
            fn
              SOME (t, n) =>
                Finalizable.withValue
                  (t, withRefDupOptPointer (free d n) f o SOME o dup d n)
            | NONE => withRefDupOptPointer ignore f NONE
        end
      end

    fun fromVector v = C.fromPtr ~1 (C.fromVector v) (Vector.length v)

    fun toVector (t, n) = Finalizable.withValue (t, C.toVector n)

    fun length (t, n) = Finalizable.withValue (t, C.len n)

    fun sub (t, n) =
      let
        val len = length (t, n)
        val sub = Finalizable.withValue (t, C.sub n)
      in
        fn i =>
          if 0 <= i andalso i < len
          then C.toElem (sub i)
          else raise Subscript
      end

    structure PolyML =
      struct
        val cOutPtr = C.Pointer.PolyML.cVal
        val cOptOutPtr = C.Pointer.PolyML.cOptVal

        val cInPtr = C.Pointer.PolyML.cVal
        val cOptInPtr = C.Pointer.PolyML.cOptVal

        val cOptOutRef = C.Pointer.PolyML.cOptOutRef
        val cInOptOutRef = C.Pointer.PolyML.cInOptOutRef
        val cRef = C.Pointer.PolyML.cRef
        val cInRef = C.Pointer.PolyML.cInRef
      end
  end
