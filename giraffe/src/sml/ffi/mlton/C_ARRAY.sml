(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_ARRAY =
  sig
    structure MLton :
      sig
        type p1 and 'a p2
        type r1 and ('a, 'b) r2
      end

    include
      C_ARRAY
        (* It is necessary to expose the following type representations because
         * the tuple elements must occur as individual elements in the tuple
         * argument of the imported C function. *)
        where type 'a C.in_p = MLton.p1 * 'a MLton.p2
        where type ('a, 'b) C.r = MLton.r1 * ('a, 'b) MLton.r2
  end
