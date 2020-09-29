(* Copyright (C) 2013, 2016, 2019 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_SCALAR_EQ =
  sig
    include C_SCALAR_EQ

    structure PolyML :
      sig
        val cVal : FFI.val_ PolyMLFFI.conversion
        val cRef : FFI.ref_ PolyMLFFI.conversion
      end
  end
