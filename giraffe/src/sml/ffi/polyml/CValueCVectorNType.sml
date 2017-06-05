(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CValueCVectorNType(
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
    val tabulate = ElemSequence.tabulate

    open PolyMLFFI

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

    fun sub _ p i = Pointer.get (p, i)

    fun update _ p (i, e) = Pointer.set (p, i, e)

    fun len n _ = n

    fun dup d n p =
      if d <> 0
      then
        let
          val p' = new n
          val updateElem = update n p'
          val () = appi n updateElem p
        in
          p'
        end
      else
        p

    val toElem = CElemType.fromC

    fun toC v =
      let
        val n = ElemSequence.length v
        val p = new n
        fun updateElem (i, e) =
          if CElemType.isRef
          then CElemType.updateC e (sub n p i)
          else update n p (i, CElemType.toC e)

        val () = ElemSequence.appi updateElem v
      in
        p
      end

    fun fromC n p = ElemSequence.tabulate (len n p, CElemType.fromC o sub n p)
  end
