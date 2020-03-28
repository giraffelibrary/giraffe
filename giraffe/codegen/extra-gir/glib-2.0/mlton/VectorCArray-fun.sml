(* Copyright (C) 2019 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor VectorCArray(
  CArray :
    C_ARRAY
      where type 'a C.ArrayType.from_p = 'a
      where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
) :>
  C_ARRAY
    where type t = CArray.sequence
    where type elem = CArray.elem
    where type sequence = CArray.sequence
    where type 'a C.ArrayType.from_p = 'a CArray.C.ArrayType.from_p
    where type 'a C.p = 'a CArray.C.p
    where type C.notnull = CArray.C.notnull
    where type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t =
  struct
    structure Array = VectorCArray(CArray)
    open Array

    type ('a, 'b) value_accessor_t = ('a, 'b) ValueAccessor.t
    val t = ValueAccessor.map (CArray.toSequence, Fn.id) CArray.t
    val tOpt = ValueAccessor.map (Option.map CArray.toSequence, Fn.id) CArray.tOpt
  end
