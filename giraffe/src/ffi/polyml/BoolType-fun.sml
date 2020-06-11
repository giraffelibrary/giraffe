(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor BoolType(
  Memory : C_MEMORY where type Pointer.t = PolyMLFFI.Memory.Pointer.t
) :> C_VALUE_EQ_TYPE where type t = bool =
  struct
    type t = bool

    type v = int
    type p = PolyMLFFI.Memory.Pointer.t

    structure PolyML =
      struct
        val cVal = PolyMLFFI.cBool
        val cPtr = PolyMLFFI.cPointer
      end

    val isRef = false
    val null = Fn.const 0
    val {load, store, ctype} = PolyMLFFI.breakConversion PolyML.cVal
    val size = Fn.const (#size ctype)

    val toC = fn true => 1 | false => 0
    val updateC = Fn.const Fn.ignore
    val fromC = fn n => n <> 0

    val new = null
    val delete = Fn.ignore
    val clear = Fn.ignore

    val get = load
    fun set (p, v) = store v p ()

    structure Memory = Memory
  end
