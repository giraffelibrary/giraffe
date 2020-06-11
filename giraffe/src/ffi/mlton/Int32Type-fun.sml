(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Int32Type(
  Memory : C_MEMORY where type Pointer.t = MLton.Pointer.t
) :> C_VALUE_EQ_NULL_TYPE where type t = LargeInt.int =
  struct
    type t = LargeInt.int

    structure Pointer = MLtonIntPointer(Int32)

    type v = Int32.int
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = 0
      end

    val isRef = false
    val null = Fn.const 0
    val isNull = fn v => v = 0
    val size = Fn.const (Word.fromInt Pointer.size div 0w8)

    val toC = Int32.fromLarge
    val updateC = Fn.const Fn.ignore
    val fromC = Int32.toLarge

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = Pointer.get (p, 0)
    fun set (p, v) = Pointer.set (p, 0, v)

    structure Memory = Memory
  end
