(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Callback(
  type t
  structure Closure : CLOSURE
  val marshaller : t -> Closure.callback
  type dispatch_args
  val dispatchPtr : (dispatch_args -> Closure.ret) PolyMLFFI.closure
  val dispatchAsyncPtr : (dispatch_args -> Closure.ret) PolyMLFFI.closure
  val destroyNotifyPtr : (Closure.t -> unit) PolyMLFFI.closure
) :>
  CALLBACK
    where type t = t =
  struct
    type t = t

    structure FFI =
      struct
        type opt = unit
        type non_opt = unit
        type 'a p = Closure.t
        type 'a dispatch_p = (dispatch_args -> Closure.ret) PolyMLFFI.closure
        type destroy_notify_p = (Closure.t -> unit) PolyMLFFI.closure

        fun withPtr scopeCall f func =
          let
            val closure = Closure.make (marshaller func)
          in
            f closure before (if scopeCall then Closure.free closure else ())
              handle
                e => (Closure.free closure; raise e)
          end
        fun withOptPtr free f optFunc =
          case optFunc of
            SOME func => withPtr free f func
          | NONE      => f Closure.null

        fun withDispatchPtr scopeAsync f () =
          f (
            if scopeAsync
            then dispatchAsyncPtr
            else dispatchPtr
          )
        fun withOptDispatchPtr scopeAsync f =
          fn
            true  => withDispatchPtr scopeAsync f ()
          | false => f PolyMLFFI.nullClosure

        fun withDestroyNotifyPtr f () = f destroyNotifyPtr
      end

    structure PolyML =
      struct
        val cPtr = Closure.PolyML.cVal
        val cOptPtr = Closure.PolyML.cVal
        val cDispatchPtr = PolyMLFFI.cFunction
        val cOptDispatchPtr = PolyMLFFI.cFunction
        val cDestroyNotifyPtr = PolyMLFFI.cFunction
      end
  end
