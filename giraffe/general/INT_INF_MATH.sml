(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature INT_INF_MATH =
  sig
    type int = IntInf.int

    (* `log10 n` returns the floor of log (to base 10) of `n` if `0 < n`.
     * The exception `Domain` is raised if `n <= 0`.
     *)
    val log10 : int -> int
  end
