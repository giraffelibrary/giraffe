(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorVectorNType
 (structure CVectorType : C_ARRAY_TYPE where type 'a C.from_p = 'a) :>
  C_ARRAY_TYPE
    where type elem = CVectorType.vector
    where type vector = CVectorType.vector Vector.vector
    where type 'a C.from_p = int -> 'a =
  struct
    type elem = CVectorType.vector
    type vector = CVectorType.vector Vector.vector

    structure C =
      struct
        open PolyMLFFI

        type 'a from_p = int -> 'a
        structure Pointer =
          CTypedPointer (CVectorType.C.Pointer.NotNullType)
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type e = CVectorType.C.notnull CVectorType.C.p

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
              fun freeElem (_, e) = CVectorType.C.free (d - 1) e
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
              fun updateElem (i, e) = update n p' (i, CVectorType.C.dup (d - 1) e)
              val () = appi n updateElem p
            in
              p'
            end
          else
            p

        val toElem = CVectorType.C.toVector

        fun fromVector v =
          let
            val n = Vector.length v
            val p = new n
            fun updateElem (i, e) =
              update n p (i, CVectorType.C.fromVector e)
            val () = Vector.appi updateElem v
          in
            p
          end

        fun toVector n p = Vector.tabulate (len n p, toElem o sub n p)
      end

    structure Vector =
      struct
        open Vector
        type elem = CVectorType.vector
        type vector = CVectorType.vector Vector.vector
      end
  end
