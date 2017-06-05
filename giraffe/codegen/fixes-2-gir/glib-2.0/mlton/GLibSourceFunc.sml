structure GLibSourceFunc :>
  sig
    include G_LIB_SOURCE_FUNC
  end =
  struct
    type t = unit -> bool

    structure SourceCallback = Callback (type callback = t)

    local
      fun dispatch (id : SourceCallback.id) : bool =
        case SourceCallback.lookup id of
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
                SourceCallback.fmtId id,
                " is invalid (callback does not exist)"
              ]
            );
            true (* return true to prevent an attempt
                  * to remove a non-existent source *)
          )
    in
      val _ = _export "giraffe_source_dispatch_smlside" : (SourceCallback.id -> bool) -> unit;
      dispatch
    end

    val _ = _export "giraffe_source_destroy_smlside" : (SourceCallback.id -> unit) -> unit; 
    SourceCallback.remove

    structure FFI =
      struct
        type callback = SourceCallback.id
        fun withCallback f callback =
          let
            val callbackId = SourceCallback.add callback
          in
            f callbackId
              handle
                e => (SourceCallback.remove callbackId; raise e)
          end
      end
  end
