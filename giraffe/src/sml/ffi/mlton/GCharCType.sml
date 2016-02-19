(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharCType :> C_TYPE where type t = char =
  struct
    type t = char
    val null = #"\000"
    val size = 0w1
    type p = MLton.Pointer.t
    val get = Byte.byteToChar o MLton.Pointer.getWord8
    fun set (p, i, c) = MLton.Pointer.setWord8 (p, i, Byte.charToByte c)

    val malloc_ = _import "g_malloc" : C_Size.t -> MLton.Pointer.t;
    val free_ = _import "g_free" : MLton.Pointer.t -> unit;
    fun malloc n = malloc_ (C_Size.fromInt n)
    val free = free_
  end
