(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_VALUE =
  sig
    include C_VALUE

    structure PolyML :
      sig
        val cVal : v PolyMLFFI.conversion
        val cPtr : p PolyMLFFI.conversion
      end
  end
