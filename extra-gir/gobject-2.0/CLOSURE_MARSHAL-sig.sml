(* Copyright (C) 2012, 2016, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

infixr &&&

signature CLOSURE_MARSHAL =
  sig
    type 'a accessor


    structure C :
      sig
        type value_v
        type value_array_v
      end

    type ('r, 'w) arg
    type ('r, 'w) res
    type ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller =
      {
        getArg   : C.value_array_v -> 'arg_r,
        setArg   : C.value_array_v -> 'arg_w -> unit,
        getRes   : C.value_array_v * C.value_v -> 'res_r,
        setRes   : C.value_array_v * C.value_v -> 'res_w -> unit,
        initPars : (C.value_v -> unit) vector,
        initRet  : C.value_v -> unit
      }

    val &&&> :
      ('a_r, 'a_w) arg * ('b_r, 'b_w) arg
       -> (('a_r, 'b_r) pair, ('a_w, 'b_w) pair) arg

    val &&& :
      ('a_r, 'a_w) res * ('b_r, 'b_w) res
       -> (('a_r, 'b_r) pair , ('a_w, 'b_w) pair) res

    val ---> :
      ('arg_r, 'arg_w) arg * ('res_r, 'res_w) res
       -> ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller

    val parInst :        'a accessor -> ('a,   'a) arg
    val parIn   : int -> 'a accessor -> ('a,   'a) arg
    val parOut  : int -> 'a accessor -> ('a,   'a)   res
    val ret     :        'a accessor -> ('a,   'a)   res
    val retVoid :                       (unit, unit) res

    val map :
      ('arg1_r -> 'arg2_r)
       * ('arg2_w -> 'arg1_w)
       * ('res1_r -> 'res2_r)
       * ('res2_w -> 'res1_w)
       -> ('arg1_r, 'arg1_w, 'res1_r, 'res1_w) marshaller
       -> ('arg2_r, 'arg2_w, 'res2_r, 'res2_w) marshaller

    type callback
    val makeCallback :
      ('arg_r, 'arg_w, 'res_r, 'res_w) marshaller * ('arg_r -> 'res_w)
       -> callback

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
