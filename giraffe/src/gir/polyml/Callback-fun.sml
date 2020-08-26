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
  structure Pointer : C_POINTER
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
        type non_opt = Pointer.non_opt
        type opt = Pointer.opt

        type 'a closure = Closure.t
        type 'a dispatch = 'a Pointer.p
        type destroy_notify = Pointer.t

        fun withClosure scopeCall f func =
          let
            val closure = Closure.make (marshaller func)
          in
            f closure before (if scopeCall then Closure.free closure else ())
              handle
                e => (Closure.free closure; raise e)
          end
        fun withOptClosure free f optFunc =
          case optFunc of
            SOME func => withClosure free f func
          | NONE      => f Closure.null

        fun withDispatch scopeAsync f () =
          f (
            if scopeAsync
            then dispatchAsyncPtr ()
            else dispatchPtr ()
          )

        fun withOptDispatch scopeAsync f =
          fn
            true  => withDispatch scopeAsync (f o Pointer.toOptPtr) ()
          | false => f Pointer.null

        fun withDestroyNotify f () = f (destroyNotifyPtr ())
      end

    structure PolyML =
      struct
        val cClosure = Closure.PolyML.cFunction
        val cOptClosure = Closure.PolyML.cFunction
        val cDispatch = Pointer.PolyML.cVal
        val cOptDispatch = Pointer.PolyML.cOptVal
        val cDestroyNotify = Pointer.PolyML.cVal
      end
  end
