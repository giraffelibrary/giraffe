(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
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
        fun toSysWord p = SysWord.fromLarge (Word.toLarge (diff (p, null)))
        fun fromSysWord w = add (null, Word.fromLarge (SysWord.toLarge w))
        val size = sizeofPointer
      end

    val getPointer = MLton.Pointer.getPointer
    val setPointer = MLton.Pointer.setPointer

    val malloc_ = _import "malloc" : C_Size.t -> Pointer.t;
    val calloc_ = _import "calloc" : C_Size.t * C_Size.t -> Pointer.t;
    val free_ = _import "free" : Pointer.t -> unit;
    fun malloc n = malloc_ (C_Size.fromLargeWord (Word.toLargeWord n))
    fun malloc0 n = calloc_ (C_Size.fromLargeWord (Word.toLargeWord n), 0w1)
    val free = free_
  end
