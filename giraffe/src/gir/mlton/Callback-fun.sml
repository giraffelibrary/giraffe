(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor Callback(
  type t
  structure Pointer : C_POINTER
  structure Closure : CLOSURE
  val marshaller : t -> Closure.callback
  val dispatchPtr : unit -> Pointer.t
  val dispatchAsyncPtr : unit -> Pointer.t
  val destroyNotifyPtr : unit -> Pointer.t
) :>
  CALLBACK
    where type t = t =
  struct
    type t = t

    structure FFI =
      struct
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = Closure.t
        type 'a dispatch_p = 'a Pointer.p
        type destroy_notify_p = Pointer.t

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
            then dispatchAsyncPtr ()
            else dispatchPtr ()
          )
        fun withOptDispatchPtr scopeAsync f =
          fn
            true  => withDispatchPtr scopeAsync (f o Pointer.toOptPtr) ()
          | false => f Pointer.null

        fun withDestroyNotifyPtr f () = f (destroyNotifyPtr ())
      end
  end
