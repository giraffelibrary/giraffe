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
        type 'a p              (* closure pointer *)
        type 'a dispatch_p     (* dispatch function pointer *)
        type destroy_notify_p  (* destroy notify function pointer *)

        val withPtr    : bool -> (non_opt p -> 'a) -> t        -> 'a
        val withOptPtr : bool -> (opt     p -> 'a) -> t option -> 'a

        val withDispatchPtr    : bool -> (non_opt dispatch_p -> 'a) -> unit -> 'a
        val withOptDispatchPtr : bool -> (opt     dispatch_p -> 'a) -> bool -> 'a

        val withDestroyNotifyPtr : (destroy_notify_p -> 'a) -> unit -> 'a
      end
  end
