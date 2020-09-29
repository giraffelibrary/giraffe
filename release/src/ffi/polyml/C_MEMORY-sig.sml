(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_MEMORY =
  sig
    include C_MEMORY

    structure PolyML :
      sig
        val symbolAsAddress : PolyMLFFI.symbol -> Pointer.t

        val cPointer : Pointer.t PolyMLFFI.conversion
      end
  end
