(* Copyright (C) 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CMemory : C_MEMORY =
  struct
    open PolyMLFFI

    structure Pointer =
      struct
        open Memory.Pointer
        val toPointer = Fn.id
        val fromPointer = Fn.id
      end

    val getPointer = Memory.getPointer
    val setPointer = Memory.setPointer

    structure Size =
      struct
        open Word
        type t = word
      end

    val malloc = Memory.malloc
    fun malloc0 n =
      let
        val p = Memory.malloc n
        val () = Memory.init (p, 0w0, n)
      in
        p
      end
    val free = Memory.free

    structure PolyML =
      struct
        val symbolAsAddress = symbolAsAddress
        val cPointer = cPointer
      end
  end
