(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CPointerCVectorNType(
  structure CElemType : C_POINTER_TYPE
  structure Sequence : SEQUENCE
) :>
  C_ARRAY_TYPE
    where type elem = CElemType.t
    where type t = CElemType.t Sequence.t
    where type 'a from_p = int -> 'a =
  struct
    type elem = CElemType.t
    type t = CElemType.t Sequence.t

    val length = Sequence.length
    val tabulate = Sequence.tabulate

    type 'a from_p = int -> 'a
    structure Pointer = CTypedPointer(CElemType.Pointer.NotNullType)
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    type e = CElemType.notnull CElemType.p

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
          fun freeElem (_, e) = CElemType.free (d - 1) e
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
          fun updateElem (i, e) = update n p' (i, CElemType.dup (d - 1) e)
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
            (len n p, CElemType.CVector.fromPointer o sub n p)

        fun toPointer v =
          let
            val n = Vector.length v
            val p = new n
            fun updateElem (i, e) =
              update n p (i, CElemType.CVector.toPointer e)
            val () = Vector.appi updateElem v
          in
            p
          end

        val fromVal =
          Vector.map CElemType.CVector.fromVal o Sequence.toVector

        val toVal =
          Sequence.fromVector o Vector.map CElemType.CVector.toVal
      end

    fun toC v = CVector.toPointer (CVector.fromVal v)

    fun fromC n p = CVector.toVal (CVector.fromPointer n p)

(*
    structure Vector =
      struct
        open Sequence
        type elem = CElemType.t
        type t = CElemType.t Sequence.t
      end
*)
  end
