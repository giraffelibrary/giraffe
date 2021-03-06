(* Copyright (C) 2019-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor VectorCArrayN(
  CArray :
    C_ARRAY
      where type 'a C.ArrayType.from_p = int -> 'a
      where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
) :>
  C_ARRAY
    where type t = CArray.sequence
    where type elem = CArray.elem
    where type sequence = CArray.sequence
    where type 'a C.ArrayType.from_p = 'a CArray.C.ArrayType.from_p
    where type C.e = CArray.C.e
    where type C.opt = CArray.C.opt
    where type C.non_opt = CArray.C.non_opt
    where type 'a C.p = 'a CArray.C.p
    where type ('a, 'b) C.r = ('a, 'b) CArray.C.r
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t =
  struct
    structure Array = VectorCArrayN(CArray)
    open Array

    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    val t = ValueAccessor.map (fn f => CArray.toSequence o f, Fn.id) CArray.t
    val tOpt = ValueAccessor.map (fn f => Option.map CArray.toSequence o f, Fn.id) CArray.tOpt
  end
