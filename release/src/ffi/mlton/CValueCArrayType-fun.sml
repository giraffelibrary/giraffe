(* Copyright (C) 2016-2021 Phil Clayton <phil.clayton@veonix.com>
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
    where type Pointer.e = CElemType.v
    where type e = CElemType.v
    where type 'a from_p = 'a =
  struct
    structure ElemSequence = ElemSequence

    type elem = ElemSequence.elem
    type t = ElemSequence.t

    structure Pointer = CTypedPointer(CElemType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    type 'a from_p = 'a

    type e = Pointer.e

    structure ElemType =
      struct
        fun free d = if d <> 0 then CElemType.clear else ignore
        val toC = CElemType.toC
        val fromC = CElemType.fromC
      end

    fun appi f p =
      let
        fun step i =
          let
            val e = Pointer.get (p, i)
          in
            if not (CElemType.isNull e)
            then (f (i, e); step (i + 1))
            else ()
          end
      in
        step 0
      end

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
        val () = Pointer.set (p, n, CElemType.null ())
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
          fun setElem (i, e) = Pointer.set (p', i, e)
          val () = appi setElem p
        in
          p'
        end
      else
        p

    fun get p i = Pointer.get (p, i)

    fun set p (i, e) = Pointer.set (p, i, e)

    fun getElem p i = CElemType.fromC (Pointer.get (p, i))

    fun setElem p (i, elem) =
      if CElemType.isRef
      then CElemType.updateC elem (Pointer.get (p, i))
      else Pointer.set (p, i, CElemType.toC elem)

    fun init set (n, f) =
      let
        val p = new n

        fun step i =
          if i < n
          then (set p (i, f i); step (i + 1))
          else ()
        val () = step 0
      in
        p
      end

    fun toC v =
      let
        val n = ElemSequence.length v
        val p = new n
        val () = ElemSequence.appi (setElem p) v
      in
        p
      end

    fun fromC p = ElemSequence.tabulate (len p, getElem p)

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
        fun cget c =
          let
            val n = clen c
          in
            fn i =>
              if i < n
              then Vector.sub (c, i)
              else raise Subscript
          end
        fun cset c =
          let
            val n = clen c
          in
            fn (i, e) =>
              if i < n
              then Vector.update (c, i, e)
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
          else fn c => ElemSequence.tabulate (clen c, cget c)

        val fromPointer =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else
            fn p => fromVal (ElemSequence.tabulate (len p + 1, getElem p))
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
                fun setElem (i, e) = Pointer.set (p, i, CElemType.toC e)
                val () = Vector.appi setElem c
              in
                p
              end
      end
  end
