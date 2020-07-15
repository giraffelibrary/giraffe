(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature MONO_SEQUENCE =
  sig
    type t
    type elem
    val tabulate : int * (int -> elem) -> t
    val get : t -> int -> elem
    val sub : t * int -> elem
    val set : t -> int * elem -> t
    val update : t * int * elem -> t
    val length : t -> int
    val appi : (int * elem -> unit) -> t -> unit

    val fromList : elem list -> t
    val toList : t -> elem list

    structure Vector : MONO_VECTOR where type elem = elem
    val toVector : t -> Vector.vector
    val fromVector : Vector.vector -> t
  end
