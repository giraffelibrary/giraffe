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
    where type elem = CElemType.t
    where type t = CElemType.t Sequence.t
    where type 'a from_p = int -> 'a =
  struct
    type elem = CElemType.t
    type t = CElemType.t Sequence.t

    val length = Sequence.length
    fun sub t i = Sequence.sub (t, i)
    val tabulate = Sequence.tabulate

    open PolyMLFFI

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

    fun get _ p i = Pointer.get (p, i)
    fun set _ p (i, e) = Pointer.set (p, i, e)

    fun len n _ = n

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

    fun toC n v =
      let
        val p = new n
        fun updateElem (i, e) =
          set n p (i, CElemType.toC e)
        val () = Sequence.appi updateElem v
      in
        p
      end

    fun fromC n p =
      Sequence.tabulate (len n p, toElem o get n p)

(*
    structure Vector =
      struct
        open Sequence
        type elem = CElemType.t
        type t = CElemType.t Sequence.t
      end
*)
  end
