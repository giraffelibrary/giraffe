(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CPointerCArrayNType(
  structure CElemType : C_POINTER_TYPE
  structure Sequence : SEQUENCE
) :>
  C_ARRAY_TYPE
    where type ElemSequence.elem = CElemType.t
    where type ElemSequence.t = CElemType.t Sequence.t
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

    type 'a from_p = int -> 'a
    structure Pointer = CTypedPointer(CElemType.Pointer.NonOptValueType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type e = CElemType.non_opt CElemType.p

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
          fun updateElem (i, e) = set n p' (i, CElemType.dup (d - 1) e)
          val () = appi n updateElem p
        in
          p'
        end
      else
        p

    val toElem = CElemType.fromC

    structure CVector =
      struct
        type cvector = CElemType.CVector.cvector Vector.vector
        val e = CElemType.CVector.v
        val v = Vector.fromList []
        val v1 = Vector.fromList [e]
        val v2 = Vector.fromList [e, e]
        val v3 = Vector.fromList [e, e, e]

        exception NoSMLValue

        fun free c = Vector.app CElemType.CVector.free c

        val clen = Vector.length
        fun csub c i = CElemType.CVector.toVal (Vector.sub (c, i))

        fun fromPointer n p =
          Vector.tabulate
            (len n p, CElemType.CVector.fromPointer o get n p)

        fun toPointer n v =
          let
            val p = new n
            fun updateElem (i, e) =
              set n p (i, CElemType.CVector.toPointer e)
            val () = Vector.appi updateElem v
          in
            p
          end

        val fromVal =
          Vector.map CElemType.CVector.fromVal o Sequence.toVector

        val toVal =
          Sequence.fromVector o Vector.map CElemType.CVector.toVal
      end

(*
    fun init (n, f) = CVector.toPointer n (Vector.tabulate (n, f))

    fun toC n v = CVector.toPointer n (CVector.fromVal v)

    fun fromC n p = CVector.toVal (CVector.fromPointer n p)
*)

    fun updateElem n p (i, e) =
      set n p (i, CElemType.toC e)

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
        val () = Sequence.appi (updateElem n p) v
      in
        p
      end

    fun fromC n p =
      Sequence.tabulate (len n p, toElem o get n p)
  end
