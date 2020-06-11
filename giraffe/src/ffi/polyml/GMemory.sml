(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GMemory : C_MEMORY =
  struct
    open PolyMLFFI
    open CMemory

    val g_malloc_sym = getSymbol "g_malloc"
    val g_malloc0_sym = getSymbol "g_malloc0"
    val g_free_sym = getSymbol "g_free"
    fun malloc n = call g_malloc_sym (cUlong --> cPointer) (Word.toInt n)
    fun malloc0 n = call g_malloc0_sym (cUlong --> cPointer) (Word.toInt n)
    val free = call g_free_sym (cPointer --> cVoid)
  end
