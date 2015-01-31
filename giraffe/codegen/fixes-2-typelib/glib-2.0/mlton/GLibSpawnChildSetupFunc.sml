structure GLibSpawnChildSetupFunc :>
  sig
    include G_LIB_SPAWN_CHILD_SETUP_FUNC
  end =
  struct
    type t = unit -> unit

    structure SpawnChildSetupCallback = Callback (type callback = t)

    local
      fun dispatch (id : SpawnChildSetupCallback.id) : unit =
        case SpawnChildSetupCallback.lookup id of
          SOME f => (
            f ()
              handle
                e => GiraffeLog.critical (exnMessage e)
          )
        | NONE   =>
            GiraffeLog.critical (
              concat [
                "child setup callback error: invalid child setup function id ",
                SpawnChildSetupCallback.fmtId id
              ]
            )
    in
      val _ =
        _export "giraffe_spawn_child_setup_dispatch_smlside"
          : (SpawnChildSetupCallback.id -> unit) -> unit;
      dispatch
    end

    structure C =
      struct
        type callback = SpawnChildSetupCallback.id

        fun withCallback f callback =
          let
            val callbackId = SpawnChildSetupCallback.add callback
          in
            f callbackId before SpawnChildSetupCallback.remove callbackId
              handle
                e => (SpawnChildSetupCallback.remove callbackId; raise e)
          end

        fun withOptCallback f optCallback =
          withCallback f (
            case optCallback of
              SOME callback => callback
            | NONE          => fn () => ()
          )
      end
  end
