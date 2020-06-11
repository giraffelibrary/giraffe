(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CTypedPointer(CValueType : C_VALUE_TYPE) :>
  C_TYPED_POINTER
    where type e = CValueType.v =
  struct
    structure Pointer = CPointerInternal(CValueType.Memory)
    open Pointer

    type e = CValueType.v

    fun offset (p, i) = add (Word.fromInt i * CValueType.size ()) p

    fun set (p, i, x) = CValueType.set (offset (p, i), x)
    fun get (p, i) = CValueType.get (offset (p, i))

    fun new n = malloc0 (Word.fromInt n * CValueType.size ())
  end
