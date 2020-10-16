(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature FIELD_TYPE =
  sig
    type t
    eqtype p  (* pointer to the field *)
    structure Memory : C_MEMORY where type Pointer.t = p

    type 'a from_p

    val free : (p -> unit) from_p
    val get : (p -> t) from_p
    val set : unit from_p -> p -> t -> unit
  end
