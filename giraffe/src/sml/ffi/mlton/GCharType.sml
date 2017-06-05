(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GCharType :> C_VALUE_EQ_NULL_TYPE where type t = char =
  struct
    type t = char

    type v = char
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = #"\000"
      end

    val isRef = false
    val null = Fn.const #"\000"
    val isNull = fn v => v = #"\000"
    val size = Fn.const 0w1

    val toC = Fn.id
    val updateC = Fn.const Fn.ignore
    val fromC = Fn.id

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = Byte.byteToChar (MLton.Pointer.getWord8 (p, 0))
    fun set (p, v) = MLton.Pointer.setWord8 (p, 0, Byte.charToByte v)

    val malloc_ = _import "g_malloc" : C_Size.t -> MLton.Pointer.t;
    val free_ = _import "g_free" : MLton.Pointer.t -> unit;
    fun malloc n = malloc_ ((C_Size.fromLarge o Word.toLarge) n)
    val free = free_
  end
