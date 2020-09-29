(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_VALUE_NULL_TYPE =
  sig
    include C_VALUE_TYPE

    (**
     * `null ()` is a C value that is used to terminate null-terminated
     * arrays.  `isNull v` indicates whether `v` is a C value used to
     * terminate null-terminated arrays.
     *)
    val null : unit -> v
    val isNull : v -> bool
  end
