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
        type non_opt
        type opt

        type 'a closure
        val withClosure : bool -> (non_opt closure -> 'a) -> t -> 'a
        val withOptClosure : bool -> (opt closure -> 'a) -> t option -> 'a

        type 'a dispatch
        val withDispatch : bool -> (non_opt dispatch -> 'a) -> unit -> 'a
        val withOptDispatch : bool -> (opt dispatch -> 'a) -> bool -> 'a

        type destroy_notify
        val withDestroyNotify : (destroy_notify -> 'a) -> unit -> 'a
      end
  end
