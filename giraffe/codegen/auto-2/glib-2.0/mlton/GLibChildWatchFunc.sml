structure GLibChildWatchFunc :>
  sig
    include G_LIB_CHILD_WATCH_FUNC
  end =
  struct
    type t = Pid.t * LargeInt.int -> unit

    structure ChildWatchCallback = Callback (type callback = t)

    local
      fun dispatch (pid : Pid.C.val_, status : FFI.Int32.val_, id : ChildWatchCallback.id) : unit =
        case ChildWatchCallback.lookup id of
          SOME f => (
            f (Pid.C.fromVal pid, FFI.Int32.fromVal status)
              handle
                e => GiraffeLog.critical (exnMessage e)
          )
        | NONE   =>
            GiraffeLog.critical (
              concat [
                "child watch source callback error: source function id ",
                ChildWatchCallback.fmtId id,
                " is invalid (callback does not exist)\n"
              ]
            )
    in
      val _ =
        _export "giraffe_child_watch_dispatch_smlside"
          : (Pid.C.val_ * FFI.Int32.val_ * ChildWatchCallback.id -> unit) -> unit;
      dispatch
    end

    val _ = _export "giraffe_child_watch_destroy_smlside" : (ChildWatchCallback.id -> unit) -> unit; 
    ChildWatchCallback.remove

    structure C =
      struct
        type callback = ChildWatchCallback.id
        fun withCallback f callback =
          let
            val callbackId = ChildWatchCallback.add callback
          in
            f callbackId
              handle
                e => (ChildWatchCallback.remove callbackId; raise e)
          end
      end
  end
