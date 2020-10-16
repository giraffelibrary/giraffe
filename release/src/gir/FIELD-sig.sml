(* Copyright (C) 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature FIELD =
  sig
    type t
    type container_t

    val get : container_t -> t
    val set : t -> container_t -> unit

    structure C :
      sig
        type container_p

        val get : container_p -> t
        val set : t -> container_p -> unit
      end
  end
