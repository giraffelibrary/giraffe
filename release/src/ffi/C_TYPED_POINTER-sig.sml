(* Copyright (C) 2016, 2020 Phil Clayton <phil.clayton@veonix.com>
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
     * `offset (p, i)` returns a pointer offset by `i` elements from `p`.
     *)
    val offset : t * int -> t

    (**
     * `get (p, i)` gets the element offset by `i` elements from `p`.
     * `set (p, i, v)` sets the element offset by `i` elements from `p` to `v`.
     *)
    val get : t * int -> e
    val set : t * int * e -> unit

    (**
     * `new n` allocates an array of `n` elements and returns a pointer to
     * the array.  `free p` frees the array pointed to by `p`.
     *)
    val new : int -> t
    val free : t -> unit
  end
