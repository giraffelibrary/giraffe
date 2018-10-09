(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_VALUE =
  sig
    include C_VALUE where type p = MLton.Pointer.t

    structure MLtonVector :
      sig
        (**
         * `e` is a dummy value to enable vectors to be created with a
         * particular length.  When `isPointer` is true, `e` is referenced
         * but its value is not read because the function `toC` just returns
         * the null pointer as it does not need to be implemented.
         *)
        val e : t
      end
  end
