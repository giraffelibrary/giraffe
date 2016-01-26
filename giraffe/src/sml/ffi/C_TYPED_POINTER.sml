(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_TYPED_POINTER =
  sig
    include C_POINTER

    (**
     * The type `e` is the type of the element the is pointed to by `'a p`.
     *)
    type e

    (**
     * `offset (p, n)` returns a pointer offset by `n` elements from `p`.
     *)
    val offset : t * int -> t

    (**
     * `get (p, n)` gets the element offset by `n` elements from `p`.
     * `set (p, n, v)` sets the element offset by `n` elements from `p` to `v`.
     *)
    val get : t * int -> e
    val set : t * int * e -> unit
  end
