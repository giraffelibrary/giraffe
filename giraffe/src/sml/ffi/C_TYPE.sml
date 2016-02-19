(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature C_TYPE =
  sig
    eqtype t
    val null : t
    val size : word
    type p
    val get : p * int -> t
    val set : p * int * t -> unit
    val malloc : int -> p
    val free : p -> unit
  end
