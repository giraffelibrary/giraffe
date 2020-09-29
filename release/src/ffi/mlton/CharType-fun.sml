(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CharType(
  Memory : C_MEMORY where type Pointer.t = MLton.Pointer.t
) :> C_VALUE_EQ_NULL_TYPE where type t = char =
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

    structure Memory = Memory
  end
