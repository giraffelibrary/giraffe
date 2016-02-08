(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature UTF8_VECTOR =
  F_F_I_ARRAY
    where type t = string list
    where
      type 'a C.in_p =
        GCharVecVec.MLton.p1
         * GCharVecVec.MLton.p2
         * 'a GCharVecVec.MLton.p3
    where
      type ('a, 'b) C.r =
        GCharVecVec.MLton.r1
         * GCharVecVec.MLton.r2
         * ('a, 'b) GCharVecVec.MLton.r3
