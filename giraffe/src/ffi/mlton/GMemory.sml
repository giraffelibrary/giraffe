(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GMemory : C_MEMORY =
  struct
    open CMemory

    val malloc_ = _import "g_malloc" : C_Size.t -> Pointer.t;
    val malloc0_ = _import "g_malloc0" : C_Size.t -> Pointer.t;
    val free_ = _import "g_free" : Pointer.t -> unit;
    fun malloc n = malloc_ (C_Size.fromLargeWord (Word.toLargeWord n))
    fun malloc0 n = malloc0_ (C_Size.fromLargeWord (Word.toLargeWord n))
    val free = free_
  end
