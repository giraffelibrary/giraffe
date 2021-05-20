(* Copyright (C) 2016-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CPointerCArrayNType(
  structure CElemType : C_POINTER_TYPE where type 'a from_p = 'a
  structure Sequence : SEQUENCE
) :>
  C_ARRAY_TYPE
    where type ElemSequence.elem = CElemType.t
    where type ElemSequence.t = CElemType.t Sequence.t
    where type Pointer.e = CElemType.non_opt CElemType.p
    where type e = CElemType.non_opt CElemType.p
    where type 'a from_p = int -> 'a =
  struct
    structure ElemSequence =
      struct
        open Sequence
        type elem = CElemType.t
        type t = CElemType.t Sequence.t
        structure Vector =
          struct
            open Vector
            type elem = CElemType.t
            type vector = CElemType.t Vector.vector
          end
      end

    type elem = ElemSequence.elem
    type t = ElemSequence.t

    structure Pointer = CTypedPointer(CElemType.Pointer.ValueType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    type 'a from_p = int -> 'a

    type e = CElemType.non_opt CElemType.p

    structure ElemType =
      struct
        open CElemType
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
          fun freeElem (_, e) = CElemType.free (d - 1) e
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
          fun setElem (i, e) =
            Pointer.set (p', i, CElemType.dup (d - 1) e)
          val () = appi n setElem p
        in
          p'
        end
      else
        p

    fun get _ p i =
      Pointer.get (p, i)

    fun set _ p (i, e) =
      Pointer.set (p, i, CElemType.dup ~1 e)

    fun getElem n p i =
      CElemType.fromC (get n p i)

    fun setElem _ p (i, elem) =
      Pointer.set (p, i, CElemType.toC elem)

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
        val () = Sequence.appi (setElem n p) v
      in
        p
      end

    fun fromC n p = Sequence.tabulate (len n p, getElem n p)
  end
