structure GLibSpawnChildSetupFunc :>
  sig
    include G_LIB_SPAWN_CHILD_SETUP_FUNC
  end =
  struct
    type t = unit -> unit

    structure SpawnChildSetupCallbackTable = CallbackTable(type callback = t)

    local
      fun dispatch (id : SpawnChildSetupCallbackTable.id) : unit =
        case SpawnChildSetupCallbackTable.lookup id of
          SOME f => (
            f ()
              handle
                e => GiraffeLog.critical (exnMessage e)
          )
        | NONE   =>
            GiraffeLog.critical (
              concat [
                "child setup callback error: invalid child setup function id ",
                SpawnChildSetupCallbackTable.fmtId id
              ]
            )
    in
      val _ =
        _export "giraffe_spawn_child_setup_dispatch_smlside"
          : (SpawnChildSetupCallbackTable.id -> unit) -> unit;
      dispatch
    end

    structure FFI =
      struct
        type callback = SpawnChildSetupCallbackTable.id

        fun withCallback f callback =
          let
            val callbackId = SpawnChildSetupCallbackTable.add callback
          in
            f callbackId before SpawnChildSetupCallbackTable.remove callbackId
              handle
                e => (SpawnChildSetupCallbackTable.remove callbackId; raise e)
          end

        fun withOptCallback f optCallback =
          withCallback f (
            case optCallback of
              SOME callback => callback
            | NONE          => fn () => ()
          )
      end
  end
