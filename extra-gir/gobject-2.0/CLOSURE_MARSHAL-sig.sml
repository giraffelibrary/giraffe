(* Copyright (C) 2012, 2016, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLOSURE_MARSHAL =
  sig
    type ('a, 'b) accessor


    type 'a get
    val &&&> : 'a get * 'b get -> ('a, 'b) pair get

    type 'a set
    type 'a ret
    val && : 'a set * 'b ret -> ('a, 'b) pair ret

    type 'a marshaller
    val ---> : 'a get * 'b ret -> ('a -> 'b) marshaller


    val get : word -> ('a, 'b) accessor -> 'a get
    val set : word -> ('a, 'b) accessor -> 'b set
    val ret : ('a, 'b) accessor -> 'b ret

    val void : unit get
    val ret_void : unit ret


    type callback
    val makeCallback : ('a -> 'b) marshaller * ('a -> 'b) -> callback


    structure C :
      sig
        type value_v

        val get : word -> (value_v -> 'a) -> 'a get
        val set : word -> (value_v -> 'a -> unit) -> 'a set
        val ret : (value_v -> 'a -> unit) -> 'a ret
      end


    structure FFI :
      sig
        type opt
        type non_opt
        type 'a p              (* closure pointer *)
        type 'a dispatch_p     (* dispatch function pointer *)
        type destroy_notify_p  (* destroy notify function pointer *)

        val withPtr    : (non_opt p -> 'a) -> callback        -> 'a
        val withOptPtr : (opt     p -> 'a) -> callback option -> 'a

        val withDispatchPtr    : (non_opt dispatch_p -> 'a) -> unit -> 'a
        val withOptDispatchPtr : (opt     dispatch_p -> 'a) -> bool -> 'a

        val withDestroyNotifyPtr : (destroy_notify_p -> 'a) -> unit -> 'a
      end
  end
