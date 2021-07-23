(* Copyright (C) 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GMemory : C_MEMORY =
  struct
    open CMemory

    val malloc = _import "g_malloc" : Size.t -> Pointer.t;
    val malloc0 = _import "g_malloc0" : Size.t -> Pointer.t;
    val free = _import "g_free" : Pointer.t -> unit;
  end
