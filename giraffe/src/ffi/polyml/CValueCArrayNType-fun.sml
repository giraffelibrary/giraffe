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
    structure ElemSequence = ElemSequence

    type elem = ElemSequence.elem
    type t = ElemSequence.t

    type 'a from_p = int -> 'a
    structure Pointer = CTypedPointer(CElemType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
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
  end
