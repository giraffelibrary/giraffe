(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

infixr &
infixr &&

datatype ('a, 'b) pair = op & of 'a * 'b

structure Pair =
  struct
    type ('a, 'b) t = ('a, 'b) pair
    fun fst (a & _) = a
    fun snd (_ & b) = b
    fun mapFst f (a & b) = f a & b
    fun mapSnd f (a & b) = a & f b
    fun (f && g) (a & b) = f a & g b
  end

val op && = op Pair.&&
