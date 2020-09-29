(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure CMemory : C_MEMORY =
  struct
    open PolyMLFFI
    open Memory

    fun malloc0 n =
      let
        val p = malloc n
        val () = init (p, 0w0, n)
      in
        p
      end

    structure PolyML =
      struct
        val symbolAsAddress = symbolAsAddress
        val cPointer = cPointer
      end
  end
