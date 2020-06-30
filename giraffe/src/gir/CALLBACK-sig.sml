(* Copyright (C) 2018-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CALLBACK =
  sig
    type t

    structure FFI :
      sig
        type opt
        type non_opt
        type 'a p

        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
        val withOptCallback : (callback -> 'a) -> t option -> 'a

        val withPtrToDispatch : (non_opt p -> 'a) -> unit -> 'a
        val withOptPtrToDispatch : (opt p -> 'a) -> bool -> 'a
      end
  end
