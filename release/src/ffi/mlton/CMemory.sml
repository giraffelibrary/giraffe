(* Copyright (C) 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CMemory : C_MEMORY =
  struct
    structure Pointer =
      struct
        open MLton.Pointer
        fun toSysWord p = SysWord.fromLargeInt (C_Ptrdiff.toLarge (C_Pointer.diff (p, null)))
        fun fromSysWord w = C_Pointer.add (null, C_Ptrdiff.fromLarge (SysWord.toLargeIntX w))
        val toPointer = Fn.id
        val fromPointer = Fn.id
        val size = sizeofPointer
      end

    val getPointer = MLton.Pointer.getPointer
    val setPointer = MLton.Pointer.setPointer

    structure Size =
      struct
        open C_Size
      end

    val malloc_ = _import "malloc" : Size.t -> Pointer.t;
    val calloc_ = _import "calloc" : Size.t * Size.t -> Pointer.t;
    val free_ = _import "free" : Pointer.t -> unit;
    val malloc = malloc_
    fun malloc0 n = calloc_ (n, 0w1)
    val free = free_
  end
