(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GBoolType :> C_VALUE_EQ_TYPE where type t = bool =
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

    local
      open PolyMLFFI
    in
      val g_malloc_sym = getSymbol "g_malloc"
      val g_free_sym = getSymbol "g_free"
      fun malloc n = call g_malloc_sym (cUlong --> cPointer) (Word.toLargeInt n)
      val free = call g_free_sym (cPointer --> cVoid)
    end
  end
