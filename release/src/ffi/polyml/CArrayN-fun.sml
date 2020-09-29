(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CArrayN(CArrayType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) :>
  C_ARRAY_N
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a update = unit  (* mutable *)
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type C.ArrayType.e = CArrayType.e
    where type 'a C.ArrayType.p = 'a CArrayType.p
    where type C.ArrayType.opt = CArrayType.opt
    where type C.ArrayType.non_opt = CArrayType.non_opt =
  struct
    structure Common = CArrayNCommon(CArrayType)
    open Common

    type 'a update = unit

    val set =
      fn
        (CArray (a, _), n) =>
          let
            fun update p (i, elem) =
              let
                open C.ArrayType
                val () = ElemType.free ~1 (get n p i)
                val () = setElem n p (i, elem)
              in
                ()
              end
            val updateArray = Finalizable.withValue (a, update)
          in
            fn (i, elem) =>
              if 0 <= i andalso i < n
              then updateArray (i, elem)
              else raise Subscript
          end

    fun update (t, i, e) = set t (i, e)
  end
