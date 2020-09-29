(* Copyright (C) 2019 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_ARRAY =
  sig
    include C_ARRAY
    type ('a, 'b) value_accessor_t
    val t : (t FFI.from_p, unit) value_accessor_t
    val tOpt : (t option FFI.from_p, unit) value_accessor_t
  end
