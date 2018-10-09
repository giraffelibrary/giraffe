(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
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
    val length : t -> int
    val appi : (int * elem -> unit) -> t -> unit
    val findi : (int * elem -> bool) -> t -> (int * elem) option
    val take : t * int -> t

    structure Vector : MONO_VECTOR where type elem = elem
    val toVector : t -> Vector.vector
    val fromVector : Vector.vector -> t
(*
    type vector
    val toVector : t -> vector
    val sub : vector * int -> elem
    val findi : (int * elem -> bool) -> vector -> (int * elem) option
    val concat : vector list -> t
    val fromList : elem list -> vector
*)
  end
