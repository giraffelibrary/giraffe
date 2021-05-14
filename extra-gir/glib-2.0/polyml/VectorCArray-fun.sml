(* Copyright (C) 2019-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor VectorCArray(
  CArray :
    C_ARRAY
      where type 'a C.ArrayType.from_p = 'a
      where type 'a value_accessor_t = 'a ValueAccessor.t
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
    where type 'a value_accessor_t = 'a ValueAccessor.t =
  struct
    structure Array = VectorCArray(CArray)
    open Array

    type 'a value_accessor_t = 'a ValueAccessor.t
    val t = ValueAccessor.map (CArray.toSequence, CArray.fromSequence) CArray.t
    val tOpt = ValueAccessor.map (Option.map CArray.toSequence, Option.map CArray.fromSequence) CArray.tOpt
  end
