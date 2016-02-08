(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature UTF8 =
  F_F_I_ARRAY
    where type t = string
    where type 'a C.in_p = GCharVec.MLton.p1 * 'a GCharVec.MLton.p2
    where type ('a, 'b) C.r = GCharVec.MLton.r1 * ('a, 'b) GCharVec.MLton.r2
