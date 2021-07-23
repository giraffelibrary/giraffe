(* Copyright (C) 2016-2021 Phil Clayton <phil.clayton@veonix.com>
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

    fun offset (p, i) =
      Memory.Pointer.add (p, Word.fromInt i * CValueType.size ())

    fun set (p, i, x) = CValueType.set (offset (p, i), x)
    fun get (p, i) = CValueType.get (offset (p, i))

    fun new n =
      let
        val size = Word.fromInt n * CValueType.size ()
      in
        Memory.malloc0 (Memory.Size.fromLarge (Word.toLarge size))
      end
    val free = Memory.free
  end
