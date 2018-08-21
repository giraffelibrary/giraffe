structure GLibSourceFunc :>
  sig
    include G_LIB_SOURCE_FUNC
  end =
  struct
    type t = unit -> bool

    structure SourceCallbackTable = CallbackTable(type callback = t)

    local
      fun dispatch (id : SourceCallbackTable.id) : bool =
        case SourceCallbackTable.lookup id of
          SOME f => (
            f ()
              handle
                e => (
                  GiraffeLog.critical (exnMessage e);
                  false  (* return false to remove the source *)
                )
          )
        | NONE   => (
            GiraffeLog.critical (
              concat [
                "source callback error: source function id ",
                SourceCallbackTable.fmtId id,
                " is invalid (callback does not exist)"
              ]
            );
            true (* return true to prevent an attempt
                  * to remove a non-existent source *)
          )
    in
      val _ = _export "giraffe_source_dispatch_smlside" : (SourceCallbackTable.id -> bool) -> unit;
      dispatch
    end

    val _ = _export "giraffe_source_destroy_smlside" : (SourceCallbackTable.id -> unit) -> unit; 
    SourceCallbackTable.remove

    structure FFI =
      struct
        type callback = SourceCallbackTable.id
        fun withCallback f callback =
          let
            val callbackId = SourceCallbackTable.add callback
          in
            f callbackId
              handle
                e => (SourceCallbackTable.remove callbackId; raise e)
          end
      end
  end
