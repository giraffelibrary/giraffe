(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GUShortType :> C_VALUE_EQ_NULL_TYPE where type t = LargeInt.int =
  struct
    type t = LargeInt.int

    structure Pointer = MLtonWordPointer(C_UShort)

    type v = C_UShort.word
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = 0
      end

    val isRef = false
    val null = Fn.const 0w0
    val isNull = fn v => v = 0w0
    val size = Fn.const (Word.fromInt Pointer.size div 0w8)

    val toC = C_UShort.fromLargeInt
    val updateC = Fn.const Fn.ignore
    val fromC = C_UShort.toLargeIntX

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = Pointer.get (p, 0)
    fun set (p, v) = Pointer.set (p, 0, v)

    val malloc_ = _import "g_malloc" : C_Size.t -> MLton.Pointer.t;
    val free_ = _import "g_free" : MLton.Pointer.t -> unit;
    fun malloc n = malloc_ ((C_Size.fromLarge o Word.toLarge) n)
    val free = free_
  end
