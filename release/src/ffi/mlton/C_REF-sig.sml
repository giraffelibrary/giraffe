(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_REF =
  sig
    include C_REF

    structure MLton :
      sig
        val toRef : v -> r
        val fromRef : r -> v
      end
  end
