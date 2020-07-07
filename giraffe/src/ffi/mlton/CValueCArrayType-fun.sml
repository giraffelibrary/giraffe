(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CValueCArrayType(
  structure CElemType : C_VALUE_NULL_TYPE
  structure ElemSequence : MONO_SEQUENCE
  sharing type CElemType.t = ElemSequence.elem
) :>
  C_ARRAY_TYPE
    where type elem = ElemSequence.elem
    where type t = ElemSequence.t
    where type 'a from_p = 'a =
  struct
    structure ElemSequence = ElemSequence

    type elem = ElemSequence.elem
    type t = ElemSequence.t

    type 'a from_p = 'a
    structure Pointer = CTypedPointer(CElemType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type e = Pointer.e

    fun appi f p =
      let
        fun step i =
          let
            val e = Pointer.get (p, i)
          in
            if CElemType.isNull e
            then (f (i, e); step (i + 1))
            else ()
          end
      in
        step 0
      end

    fun get p i = Pointer.get (p, i)

    fun set p (i, e) = Pointer.set (p, i, e)

    fun len p =
      let
        fun step i =
          if (not o CElemType.isNull) (Pointer.get (p, i))
          then step (i + 1)
          else i
      in
        step 0
      end

    fun new n =
      let
        val p = Pointer.new (n + 1)
        val () = set p (n, CElemType.null ())
      in
        p
      end

    fun free d p =
      if d <> 0
      then
        let
          fun freeElem (_, e) = CElemType.clear e
          val () = appi freeElem p
          val () = Pointer.free p
        in
          ()
        end
      else ()

    fun dup d p =
      if d <> 0
      then
        let
          val n = len p
          val p' = new n
          val updateElem = set p'
          val () = appi updateElem p
        in
          p'
        end
      else
        p

    val toElem = CElemType.fromC

    fun updateElem p (i, e) =
      if CElemType.isRef
      then CElemType.updateC e (get p i)
      else set p (i, CElemType.toC e)

    fun init (n, f) =
      let
        val p = new n

        fun step i =
          if i < n
          then (updateElem p (i, f i); step (i + 1))
          else ()
        val () = step 0
      in
        p
      end

    fun toC v =
      let
        val n = ElemSequence.length v
        val p = new n
        val () = ElemSequence.appi (updateElem p) v
      in
        p
      end

    fun fromC p = ElemSequence.tabulate (len p, toElem o get p)

    structure CVector =
      struct
        structure Vector = ElemSequence.Vector

        (**
         * MLton allows SML vector types to be used in the FFI allowing
         * C code to read arrays directly from the SML heap.  This avoids
         * copying elements of an SML vector into a C array when the array is
         * only read by C code, reducing the FFI overhead.  The type
         * `cvector` is the SML vector type used in the FFI.
         *
         * `cvector` can be used in the FFI only if the type `CElemType.v` is
         * an SML type that corresponds to the C type of an array element.
         * This is not the case when `CElemType.v` is a C pointer, so if
         * `CElemType.isRef` is true, the conversion functions raise the
         * exception NoSMLValue to prevent implementations of C_ARRAY from
         * using `cvector` in the FFI.
         *)
        type cvector = Vector.vector  (* last, and only last, element is null *)

        (**
         * When `CElemType.v` is a C pointer (CElemType.isRef = true)
         * `cvector` cannot be used in the FFI but the vectors `v1`, `v2` and
         * `v3` are still required for the calling mechanism.  In this case
         * `e` is never read and the vectors contain only null pointers.
         * This is not obviously the case because the functor parameter
         * `structure ElemSequence` will be constructed using CValueVector so
         * `ElemSequence.fromList [e, ...]` will apply `CElemType.toC` to `e`.
         * However, in the case `CElemType.v` is a C pointer, `CElemType.toC`
         * is not required to be implemented, so its implementation returns a
         * null pointer without reading its argument.  Thus `e` is never read.
         *)
        val e = CElemType.MLtonVector.e
        val v = Vector.fromList []
        val v1 = Vector.fromList [e]
        val v2 = Vector.fromList [e, e]
        val v3 = Vector.fromList [e, e, e]

        exception NoSMLValue

        val free = ignore

        fun clen c = Vector.length c - 1
        fun csub c =
          let
            val n = clen c
          in
            fn i =>
              if i < n
              then Vector.sub (c, i)
              else raise Subscript
          end

        val fromVal =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else
            fn v =>
              let
                val c = ElemSequence.toVector v
              in
                case Vector.findi (fn (_, e) => CElemType.isNull (CElemType.toC e)) c of
                  SOME (n, _) =>
                    if n + 1 = Vector.length c
                    then c
                    else Vector.tabulate (n + 1, fn i => Vector.sub (c, i))
                | NONE        =>
                    Vector.concat [c, Vector.fromList [CElemType.fromC (CElemType.null ())]]
              end

        val toVal =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else fn c => ElemSequence.tabulate (clen c, csub c)

        val fromPointer =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else
            fn p => fromVal (ElemSequence.tabulate (len p + 1, CElemType.fromC o get p))
            (* Note that `len p + 1` includes the null terminator in the
             * string, so `fromVal` simply validates a `vector` as null-
             * terminated rather than create a new vector. *)

        val toPointer =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else
            fn c =>
              let
                val n = Vector.length c  (* `c` includes null terminator *)
                val p = Pointer.new n
                fun updateElem (i, e) = set p (i, CElemType.toC e)
                val () = Vector.appi updateElem c
              in
                p
              end
      end
  end
