(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibChildWatchFunc :>
  G_LIB_CHILD_WATCH_FUNC
    where type pid_t = GLibPid.t =
  struct
    type pid_t = GLibPid.t
    type func = pid_t * LargeInt.int -> unit
    type t = func

    structure C =
      struct
        structure Pointer = CPointer(GMemory)
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
        type 'a p = 'a Pointer.p
      end

    structure ChildWatchCallbackTable = CallbackTable(type callback = t)

    local
      fun dispatch (pid : GLibPid.FFI.val_, status : GInt32.FFI.val_, id : ChildWatchCallbackTable.id) : unit =
        case ChildWatchCallbackTable.lookup id of
          SOME f => (
            f (GLibPid.FFI.fromVal pid, GInt32.FFI.fromVal status)
              handle
                e => GiraffeLog.critical (exnMessage e)
          )
        | NONE   =>
            GiraffeLog.critical (
              concat [
                "child watch source callback error: source function id ",
                ChildWatchCallbackTable.fmtId id,
                " is invalid (callback does not exist)\n"
              ]
            )
    in
      val _ =
        _export "giraffe_child_watch_dispatch_smlside"
          : (GLibPid.FFI.val_ * GInt32.FFI.val_ * ChildWatchCallbackTable.id -> unit) -> unit;
      dispatch
    end

    val _ = _export "giraffe_child_watch_destroy_smlside" : (ChildWatchCallbackTable.id -> unit) -> unit; 
    ChildWatchCallbackTable.remove

    structure FFI =
      struct
        type opt = C.opt
        type non_opt = C.non_opt
        type 'a p = 'a C.p

        type callback = ChildWatchCallbackTable.id
        fun withCallback f callback =
          let
            val callbackId = ChildWatchCallbackTable.add callback
          in
            f callbackId
              handle
                e => (ChildWatchCallbackTable.remove callbackId; raise e)
          end
        fun withOptCallback f optCallback =
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f ChildWatchCallbackTable.nullId

        fun withPtrToDispatch f () =
          f (_address "giraffe_child_watch_dispatch" : 'a p;)
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f C.Pointer.null

        fun withPtrToDestroy f () =
          f (_address "giraffe_child_watch_destroy" : 'a p;)
        fun withOptPtrToDestroy f =
          fn
            true  => withPtrToDestroy f ()
          | false => f C.Pointer.null
      end
  end
