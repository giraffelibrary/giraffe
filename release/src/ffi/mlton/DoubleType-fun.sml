(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor DoubleType(
  Memory : C_MEMORY where type Pointer.t = MLton.Pointer.t
) :> C_VALUE_TYPE where type t = LargeReal.real =
  struct
    type t = LargeReal.real

    type v = C_Double.real
    type p = MLton.Pointer.t

    structure MLtonVector =
      struct
        val e = 0.0
      end

    val isRef = false
    val null = Fn.const 0.0
    val size = Fn.const 0w8

    val toC = C_Double.fromLarge (IEEEReal.getRoundingMode ())
    val updateC = Fn.const Fn.ignore
    val fromC = C_Double.toLarge

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    fun get p = MLton.Pointer.getReal64 (p, 0)
    fun set (p, v) = MLton.Pointer.setReal64 (p, 0, v)

    structure Memory = Memory
  end
