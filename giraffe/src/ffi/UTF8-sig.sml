(* Copyright (C) 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature UTF8 =
  C_ARRAY
    where type elem = char
    where type t = string
    where type C.ArrayType.elem = char
    where type C.ArrayType.t = string
    where type 'a C.ArrayType.from_p = 'a
