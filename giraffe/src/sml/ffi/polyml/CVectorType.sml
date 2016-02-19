(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorType
 (structure CType : C_TYPE
  structure Vector : MONO_VECTOR
  sharing type CType.t = Vector.elem) :>
  C_ARRAY_TYPE
    where type elem = Vector.elem
    where type vector = Vector.vector
    where type 'a C.from_p = 'a =
  struct
    type elem = Vector.elem
    type vector = Vector.vector
    structure Vector = Vector

    structure C =
      struct
        open PolyMLFFI

        type 'a from_p = 'a
        structure Pointer = CTypedPointer (CType)
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type e = Pointer.e

        fun appi f p =
          let
            fun step i =
              let
                val e = Pointer.get (p, i)
              in
                if e <> CType.null
                then (f (i, e); step (i + 1))
                else ()
              end
          in
            step 0
          end

        val new = Pointer.new
        fun free n = if n <> 0 then Pointer.free else ignore

        fun sub p i = Pointer.get (p, i)
        fun update p (i, e) = Pointer.set (p, i, e)

        fun len p =
          let
            fun step i =
              if Pointer.get (p, i) <> CType.null
              then step (i + 1)
              else i
          in
            step 0
          end

        fun dup d p =
          if d <> 0
          then
            let
              val n = len p
              val p' = new (n + 1)
              val updateElem = update p'
              val () = appi updateElem p
              val () = update p' (n, CType.null)
            in
              p'
            end
          else
            p

        val toElem = Fn.id

        fun fromVector v =
          let
            val n = Vector.length v
            val p = new (n + 1)
            val updateElem = update p
            val () = Vector.appi updateElem v
            val () = update p (n, CType.null)
          in
            p
          end

        fun toVector p = Vector.tabulate (len p, toElem o sub p)
      end
  end
