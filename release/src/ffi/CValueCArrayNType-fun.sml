(* Copyright (C) 2016-2021 Phil Clayton <phil.clayton@veonix.com>
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
    where type Pointer.e = CElemType.v
    where type e = CElemType.v
    where type 'a from_p = int -> 'a =
  struct
    structure ElemSequence = ElemSequence

    type elem = ElemSequence.elem
    type t = ElemSequence.t

    structure Pointer = CTypedPointer(CElemType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    type 'a from_p = int -> 'a

    type e = Pointer.e

    structure ElemType =
      struct
        fun free d = if d <> 0 then CElemType.clear else ignore
        val toC = CElemType.toC
        val fromC = CElemType.fromC
      end

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
          fun setElem (i, e) = Pointer.set (p', i, e)
          val () = appi n setElem p
        in
          p'
        end
      else
        p

    fun get _ p i = Pointer.get (p, i)

    fun set _ p (i, e) = Pointer.set (p, i, e)

    fun getElem _ p i = CElemType.fromC (Pointer.get (p, i))

    fun setElem _ p (i, elem) =
      if CElemType.isRef
      then CElemType.updateC elem (Pointer.get (p, i))
      else Pointer.set (p, i, CElemType.toC elem)

    fun init set (n, f) =
      let
        val p = new n

        fun step i =
          if i < n
          then (set n p (i, f i); step (i + 1))
          else ()
        val () = step 0
      in
        p
      end

    fun toC n v =
      let
        val p = new n
        val () = ElemSequence.appi (setElem n p) v
      in
        p
      end

    fun fromC n p = ElemSequence.tabulate (len n p, getElem n p)
  end
