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
      end

    structure CVector =
      struct
        type t = CVectorType.CVector.t Vector.vector
        val e = CVectorType.CVector.v1
        val v1 = Vector.fromList [e]
        val v2 = Vector.fromList [e, e]
        val v3 = Vector.fromList [e, e, e]

        exception NoSMLValue

        val len = Vector.length
        fun sub v i = CVectorType.CVector.toVector (Vector.sub (v, i))

        fun fromPointer n p =
          Vector.tabulate (C.len n p, CVectorType.CVector.fromPointer o C.sub n p)

        fun toPointer v =
          let
            val n = Vector.length v
            val p = C.new n
            fun updateElem (i, e) =
              C.update n p (i, CVectorType.CVector.toPointer e)
            val () = Vector.appi updateElem v
          in
            p
          end

        val fromVector = Vector.map CVectorType.CVector.fromVector
        val toVector = Vector.map CVectorType.CVector.toVector
      end

    structure C =
      struct
        open C

        fun fromVector v = CVector.toPointer (CVector.fromVector v)
        fun toVector n p = CVector.toVector (CVector.fromPointer n p)
        (* For `toVector`, conversion via a `CVector.t`, rather than
         * directly to a `vector`, is deliberate.  This should ensure that
         * the SML vector representation is null-terminated internally
         * allowing MLton to efficiently derive a null-terminated variant of
         * the SML vector, if required subsequently. *)
      end

    structure Vector =
      struct
        open Vector
        type elem = CVectorType.vector
        type vector = CVectorType.vector Vector.vector
      end
  end
