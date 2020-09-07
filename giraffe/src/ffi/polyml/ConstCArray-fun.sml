(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor ConstCArray(CArrayType : C_ARRAY_TYPE where type 'a from_p = 'a) :>
  C_ARRAY
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a update = 'a  (* immutable *)
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type C.ArrayType.e = CArrayType.e
    where type 'a C.ArrayType.p = 'a CArrayType.p
    where type C.ArrayType.opt = CArrayType.opt
    where type C.ArrayType.non_opt = CArrayType.non_opt =
  struct
    structure Common = CArrayCommon(CArrayType)
    open Common

    type 'a update = 'a

    val set =
      fn
        t as CArray a =>
          let
            val n = length t

            fun f (i, elem) j =
              if i = j
              then SOME elem
              else NONE

            val get = Finalizable.withValue (a, C.ArrayType.get)
            fun set p (i, optElem) =
              case optElem of
                NONE      => C.ArrayType.set p (i, get i)
              | SOME elem => C.ArrayType.setElem p (i, elem)
          in
            fn (i, elem) =>
              if 0 <= i andalso i < n
              then FFI.fromPtr ~1 (C.ArrayType.init set (n, f (i, elem)))
              else raise Subscript
          end

    fun update (t, i, e) = set t (i, e)
  end
