(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GInt8Type :> C_VALUE_EQ_NULL_TYPE where type t = LargeInt.int =
  struct
    type t = LargeInt.int

    type v = LargeInt.int
    type p = PolyMLFFI.Memory.Pointer.t

    structure PolyML =
      struct
        val cVal = PolyMLFFI.cInt8
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

    local
      open PolyMLFFI
    in
      val g_malloc_sym = getSymbol "g_malloc"
      val g_free_sym = getSymbol "g_free"
      fun malloc n = call g_malloc_sym (cUlong --> cPointer) (Word.toLargeInt n)
      val free = call g_free_sym (cPointer --> cVoid)
    end
  end
