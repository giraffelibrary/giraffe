(* Copyright (C) 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor SSizeType(
  Memory : C_MEMORY where type Pointer.t = MLton.Pointer.t
) :> C_VALUE_EQ_NULL_TYPE where type t = int =
  struct
    type t = int

    (* MLton does not provide a structure C_SSize for the POSIX C type
     * ssize_t.  We assume that ssize_t has the same size as size_t and use
     * the structure C_Size internally.  It does not matter that C_Size
     * is an unsigned representation because it is hidden.  `fromC` sign
     * extends when converting from the unsigned internal representation
     * giving the appearance of a signed representation.
     *)
    structure Pointer = MLtonWordPointer(C_Size)

    type v = C_Size.t
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = 0
      end

    val isRef = false
    val null = Fn.const 0w0
    val isNull = fn v => v = 0w0
    val size = Fn.const (Word.fromInt Pointer.size div 0w8)

    val toC = C_Size.fromInt
    val updateC = Fn.const Fn.ignore
    val fromC = C_Size.toIntX

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = Pointer.get (p, 0)
    fun set (p, v) = Pointer.set (p, 0, v)

    structure Memory = Memory
  end
