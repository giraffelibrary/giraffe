(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature SEQUENCE =
  sig
    type 'a t
    val tabulate : int * (int -> 'a) -> 'a t
    val sub : 'a t * int -> 'a
    val length : 'a t -> int
    val appi : (int * 'a -> unit) -> 'a t -> unit

    val fromList : 'a list -> 'a t
    val toList : 'a t -> 'a list

    val toVector : 'a t -> 'a vector
    val fromVector : 'a vector -> 'a t
  end
