(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor UInt8Type(
  Memory : C_MEMORY where type Pointer.t = MLton.Pointer.t
) :> C_VALUE_EQ_NULL_TYPE where type t = Word8.word =
  struct
    type t = Word8.word

    type v = Word8.word
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = 0w0
      end

    val isRef = false
    val null = Fn.const 0w0
    val isNull = fn v => v = 0w0
    val size = Fn.const (Word.fromInt Word8.wordSize div 0w8)

    val toC = Fn.id
    val updateC = Fn.const Fn.ignore
    val fromC = Fn.id

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = MLton.Pointer.getWord8 (p, 0)
    fun set (p, v) = MLton.Pointer.setWord8 (p, 0, v)

    structure Memory = Memory
  end
