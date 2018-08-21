structure GLibChildWatchFunc :>
  sig
    include
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = GLibPid.t
  end =
  struct
    type pid_t = GLibPid.t
    type t = pid_t * LargeInt.int -> unit

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
        type callback = ChildWatchCallbackTable.id
        fun withCallback f callback =
          let
            val callbackId = ChildWatchCallbackTable.add callback
          in
            f callbackId
              handle
                e => (ChildWatchCallbackTable.remove callbackId; raise e)
          end
      end
  end
