(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CPointerCArrayType(
  structure CElemType : C_POINTER_TYPE where type 'a from_p = 'a
  structure Sequence : SEQUENCE
) :>
  C_ARRAY_TYPE
    where type ElemSequence.elem = CElemType.t
    where type ElemSequence.t = CElemType.t Sequence.t
    where type e = CElemType.non_opt CElemType.p
    where type 'a from_p = 'a =
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

    structure Pointer = CTypedPointer(CElemType.Pointer.OptValueType)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p

    type 'a from_p = 'a

    type e = CElemType.non_opt CElemType.p

    structure ElemType =
      struct
        open CElemType
      end

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
        val () = Pointer.set (p, n, CElemType.Pointer.null)
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
          fun setElem (i, e) =
            Pointer.set (p', i, CElemType.Pointer.toOptPtr (CElemType.dup (d - 1) e))
          val () = appi setElem p
        in
          p'
        end
      else
        p

    fun get p i =
      CElemType.Pointer.toNonOptPtr (Pointer.get (p, i))

    fun set p (i, e) =
      Pointer.set (p, i, CElemType.Pointer.toOptPtr (CElemType.dup ~1 e))

    fun getElem p i =
      CElemType.fromC (get p i)

    fun setElem p (i, elem) =
      Pointer.set (p, i, CElemType.Pointer.toOptPtr (CElemType.toC elem))

    fun init set (n, f) =
      let
        val p = new n

        fun step i =
          if i < n
          then (set p (i, f i); step (i + 1))
          else ()
        val () = step 0
      in
        p
      end

    fun toC v =
      let
        val n = Sequence.length v
        val p = new n
        val () = Sequence.appi (setElem p) v
      in
        p
      end

    fun fromC p = Sequence.tabulate (len p, getElem p)
  end
