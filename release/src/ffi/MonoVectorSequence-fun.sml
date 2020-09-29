(* Copyright (C) 2017-2020 Phil Clayton <phil.clayton@veonix.com>
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
    fun get v i = sub (v, i)
    fun set v (i, e) = update (v, i, e)
    fun toList v = List.tabulate (length v, get v)
    structure Vector = ElemVector
    fun toVector v = v
    fun fromVector v = v
  end
