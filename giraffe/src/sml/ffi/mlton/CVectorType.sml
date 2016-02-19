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
      end

    structure CVector =
      struct
        type t = Vector.vector  (* last, and only last, char is null *)
        val e = CType.null
        val v1 = Vector.fromList [e]
        val v2 = Vector.fromList [e, e]
        val v3 = Vector.fromList [e, e, e]

        exception NoSMLValue

        fun len t = Vector.length t - 1
        fun sub t i =
          if i < len t
          then Vector.sub (t, i)
          else raise Subscript

        fun fromVector v =
          case Vector.findi (fn (_, e) => e = CType.null) v of
            SOME (n, _) =>
              if n + 1 = Vector.length v
              then v
              else Vector.tabulate (n + 1, fn i => Vector.sub (v, i))
          | NONE        => Vector.concat [v, Vector.fromList [CType.null]]

        fun toVector t = Vector.tabulate (len t, sub t)

        fun fromPointer p =
          fromVector
            (Vector.tabulate (C.len p + 1, C.toElem o C.sub p))
            (* Note that `C.len p + 1` includes the null terminator in the
             * string, so `fromVector` simply validates a `vector` as null-
             * terminated rather than create a new vector. *)

        fun toPointer t =
          let
            val n = Vector.length t  (* `t` includes null terminator *)
            val p = C.new n
            val updateElem = C.update p
            val () = Vector.appi updateElem t
          in
            p
          end
      end

    structure C =
      struct
        open C

        fun fromVector v = CVector.toPointer (CVector.fromVector v)
        fun toVector p = CVector.toVector (CVector.fromPointer p)
        (* For `toVector`, conversion via a `CVector.t`, rather than
         * directly to a `vector`, is deliberate.  This should ensure that
         * the SML vector representation is null-terminated internally
         * allowing MLton to efficiently derive a null-terminated variant of
         * the SML vector, if required subsequently. *)
      end
  end
