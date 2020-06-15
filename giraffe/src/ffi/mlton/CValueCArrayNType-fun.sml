(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CValueCArrayNType(
  structure CElemType : C_VALUE_TYPE
  structure ElemSequence : MONO_SEQUENCE
  sharing type CElemType.t = ElemSequence.elem
) :>
  C_ARRAY_TYPE
    where type elem = ElemSequence.elem
    where type t = ElemSequence.t
    where type 'a from_p = int -> 'a =
  struct
    type elem = ElemSequence.elem
    type t = ElemSequence.t

    val length = ElemSequence.length
    fun sub t i = ElemSequence.sub (t, i)
    val tabulate = ElemSequence.tabulate

    val fromList = ElemSequence.fromList
    val toList = ElemSequence.toList

    type 'a from_p = int -> 'a
    structure Pointer = CTypedPointer(CElemType)
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    type e = Pointer.e

    fun appi n f p =
      let
        fun step i =
          if i < n
          then
            let
              val e = Pointer.get (p, i)
            in
              f (i, e); step (i + 1)
            end
          else ()
      in
        step 0
      end

    fun get _ p i = Pointer.get (p, i)

    fun set _ p (i, e) = Pointer.set (p, i, e)

    fun len n _ = n

    val new = Pointer.new

    fun free d n p =
      if d <> 0
      then
        let
          fun freeElem (_, e) = CElemType.clear e
          val () = appi n freeElem p
          val () = Pointer.free p
        in
          ()
        end
      else ()

    fun dup d n p =
      if d <> 0
      then
        let
          val p' = new n
          val updateElem = set n p'
          val () = appi n updateElem p
        in
          p'
        end
      else
        p

    val toElem = CElemType.fromC

    fun updateElem n p (i, e) =
      if CElemType.isRef
      then CElemType.updateC e (get n p i)
      else set n p (i, CElemType.toC e)

    fun init (n, f) =
      let
        val p = new n

        fun step i =
          if i < n
          then (updateElem n p (i, f i); step (i + 1))
          else ()
        val () = step 0
      in
        p
      end

    fun toC n v =
      let
        val p = new n
        val () = ElemSequence.appi (updateElem n p) v
      in
        p
      end

    fun fromC n p = ElemSequence.tabulate (len n p, toElem o get n p)

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
        type cvector = Vector.vector  (* no null terminator *)

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

        fun clen c = Vector.length c
        fun csub c i = Vector.sub (c, i)

        val fromVal =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else ElemSequence.toVector

        val toVal =
          if CElemType.isRef
          then fn _ => raise NoSMLValue
          else ElemSequence.fromVector

        val fromPointer =
          if CElemType.isRef
          then fn _ => fn _ => raise NoSMLValue
          else
            fn n => fn p => Vector.tabulate (len n p, CElemType.fromC o get n p)

        val toPointer =
          if CElemType.isRef
          then fn _ => fn _ => raise NoSMLValue
          else fn n => fn v =>
            let
              val p = Pointer.new n
              fun updateElem (i, e) = set n p (i, CElemType.toC e)

              val () = Vector.appi updateElem v
            in
              p
            end
      end
  end
