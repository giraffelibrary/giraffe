(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CValueCVectorType(
  structure CElemType : C_VALUE_NULL_TYPE
  structure ElemSequence : MONO_SEQUENCE
  sharing type CElemType.t = ElemSequence.elem
) :>
  C_ARRAY_TYPE
    where type elem = ElemSequence.elem
    where type t = ElemSequence.t
    where type 'a from_p = 'a =
  struct
    type elem = ElemSequence.elem
    type t = ElemSequence.t

    val length = ElemSequence.length
    val tabulate = ElemSequence.tabulate

    open PolyMLFFI

    type 'a from_p = 'a
    structure Pointer = CTypedPointer(CElemType)
    type notnull = Pointer.notnull
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

    val new = Pointer.new

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

    fun sub p i = Pointer.get (p, i)

    fun update p (i, e) = Pointer.set (p, i, e)

    fun len p =
      let
        fun step i =
          if (not o CElemType.isNull) (Pointer.get (p, i))
          then step (i + 1)
          else i
      in
        step 0
      end

    fun dup d p =
      if d <> 0
      then
        let
          val n = len p
          val p' = new (n + 1)
          val updateElem = update p'
          val () = appi updateElem p
          val () = update p' (n, CElemType.null ())
        in
          p'
        end
      else
        p

    val toElem = CElemType.fromC

    fun toC v =
      let
        val n = ElemSequence.length v
        val p = new (n + 1)
        fun updateElem (i, e) =
          if CElemType.isRef
          then CElemType.updateC e (sub p i)
          else update p (i, CElemType.toC e)

        val () = ElemSequence.appi updateElem v
        val () = update p (n, CElemType.null ())
      in
        p
      end

    fun fromC p = ElemSequence.tabulate (len p, CElemType.fromC o sub p)
  end
