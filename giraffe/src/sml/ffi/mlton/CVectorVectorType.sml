(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorVectorType
 (structure CVectorType : C_ARRAY_TYPE where type 'a C.from_p = 'a) :>
  C_ARRAY_TYPE
    where type elem = CVectorType.vector
    where type vector = CVectorType.vector Vector.vector
    where type 'a C.from_p = 'a =
  struct
    type elem = CVectorType.vector
    type vector = CVectorType.vector Vector.vector

    structure C =
      struct
        type 'a from_p = 'a
        structure Pointer =
          CTypedPointer (CVectorType.C.Pointer.OptNullType)
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
        type e = CVectorType.C.notnull CVectorType.C.p

        fun appi f p =
          let
            fun step i =
              let
                val e = Pointer.get (p, i)
              in
                case CVectorType.C.Pointer.toOpt e of
                  SOME e' => (f (i, e'); step (i + 1))
                | NONE    => ()
              end
          in
            step 0
          end

        val new = Pointer.new
        fun free d p =
          if d <> 0
          then
            let
              fun freeElem (_, e) = CVectorType.C.free (d - 1) e
              val () = appi freeElem p
              val () = Pointer.free p
            in
              ()
            end
          else ()

        fun sub p i =
          CVectorType.C.Pointer.toNotNull (Pointer.get (p, i))
            handle CVectorType.C.Pointer.Null => raise Subscript
        fun update p (i, e) =
          Pointer.set (p, i, CVectorType.C.Pointer.toOptNull e)

        fun len p =
          let
            fun step i =
              if (not o CVectorType.C.Pointer.isNull) (Pointer.get (p, i))
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
              fun updateElem (i, e) = update p' (i, CVectorType.C.dup (d - 1) e)
              val () = appi updateElem p
              val () = update p' (n, CVectorType.C.Pointer.null)
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

        fun len _ = raise NoSMLValue
        fun sub _ _ = raise NoSMLValue

        fun fromPointer _ = raise NoSMLValue
        fun toPointer _ = raise NoSMLValue
        fun fromVector _ = raise NoSMLValue
        fun toVector _ = raise NoSMLValue
      end

    structure C =
      struct
        open C

        fun fromVector v =
          let
            val n = Vector.length v
            val p = new (n + 1)
            fun updateElem (i, e) =
              let
                open CVectorType.C
              in
                update p (i, Pointer.toOptNull (fromVector e))
              end
            val () = Vector.appi updateElem v
            val () = update p (n, CVectorType.C.Pointer.null)
          in
            p
          end

        fun toVector p = Vector.tabulate (len p, toElem o sub p)
      end

    structure Vector =
      struct
        open Vector
        type elem = CVectorType.vector
        type vector = CVectorType.vector Vector.vector
      end
  end
