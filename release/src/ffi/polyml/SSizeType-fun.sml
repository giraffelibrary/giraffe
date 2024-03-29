(* Copyright (C) 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor SSizeType(
  Memory : C_MEMORY where type Pointer.t = PolyMLFFI.Memory.Pointer.t
) :> C_VALUE_EQ_NULL_TYPE where type t = int =
  struct
    type t = int

    type v = int
    type p = PolyMLFFI.Memory.Pointer.t

    structure PolyML =
      struct
        val cVal = PolyMLFFI.cSsize
        val cPtr = PolyMLFFI.cPointer
      end

    val isRef = false
    val null = Fn.const 0
    val isNull = fn v => v = 0
    val {load, store, ctype} = PolyMLFFI.breakConversion PolyML.cVal
    val size = Fn.const (#size ctype)

    val toC = Fn.id
    val updateC = Fn.const Fn.ignore
    val fromC = Fn.id

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    val get = load
    fun set (p, v) = store v p ()

    structure Memory = Memory
  end
