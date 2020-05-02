(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CPointerCArrayType(
  structure CElemType : C_POINTER_TYPE
  structure Sequence : SEQUENCE
) :>
  C_ARRAY_TYPE
    where type elem = CElemType.t
    where type t = CElemType.t Sequence.t
    where type 'a from_p = 'a =
  struct
    type elem = CElemType.t
    type t = CElemType.t Sequence.t

    val length = Sequence.length
    fun sub t i = Sequence.sub (t, i)
    val tabulate = Sequence.tabulate

    open PolyMLFFI

    type 'a from_p = 'a
    structure Pointer = CTypedPointer(CElemType.Pointer.OptNullType)
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    type e = CElemType.notnull CElemType.p

    fun appi f p =
      let
        fun step i =
          let
            val e = Pointer.get (p, i)
          in
            case CElemType.Pointer.toOpt e of
              SOME e' => (f (i, e'); step (i + 1))
            | NONE    => ()
          end
      in
        step 0
      end

    fun get p i =
      CElemType.Pointer.toNotNull (Pointer.get (p, i))
        handle CElemType.Pointer.Null => raise Subscript

    fun set p (i, e) =
      Pointer.set (p, i, CElemType.Pointer.toOptNull e)

    fun len p =
      let
        fun step i =
          if (not o CElemType.Pointer.isNull) (Pointer.get (p, i))
          then step (i + 1)
          else i
      in
        step 0
      end

    fun new n =
      let
        val p = Pointer.new (n + 1)
        val () = set p (n, CElemType.Pointer.null)
      in
        p
      end

    fun free d p =
      if d <> 0
      then
        let
          fun freeElem (_, e) = CElemType.free (d - 1) e
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
          fun updateElem (i, e) = set p' (i, CElemType.dup (d - 1) e)
          val () = appi updateElem p
        in
          p'
        end
      else
        p

    val toElem = CElemType.fromC

    fun updateElem p (i, e) =
      let
        open CElemType
      in
        set p (i, Pointer.toOptNull (toC e))
      end

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
        val n = Sequence.length v
        val p = new n
        val () = Sequence.appi (updateElem p) v
      in
        p
      end

    fun fromC p = Sequence.tabulate (len p, toElem o get p)

(*
    structure Vector =
      struct
        open Sequence
        type elem = CElemType.t
        type t = CElemType.t Sequence.t
      end
*)
  end
