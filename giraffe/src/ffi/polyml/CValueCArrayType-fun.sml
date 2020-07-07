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
  end
