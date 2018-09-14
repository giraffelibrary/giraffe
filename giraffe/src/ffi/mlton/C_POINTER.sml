(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_POINTER =
  sig
    include C_POINTER

    structure MLton :
      sig
        val toRef : 'a p -> ('a, 'b) r
        val fromRef : ('a, 'b) r -> 'b p
      end
  end
