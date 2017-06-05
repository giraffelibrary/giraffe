(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor MonoVectorSequence(ElemVector : MONO_VECTOR) :>
  MONO_SEQUENCE
    where type t = ElemVector.vector
    where type elem = ElemVector.elem =
  struct
    type t = ElemVector.vector
    open ElemVector
    fun take (v, n) = tabulate (n, fn i => sub (v, i))
    structure Vector = ElemVector
    fun toVector v = v
    fun fromVector v = v
  end
