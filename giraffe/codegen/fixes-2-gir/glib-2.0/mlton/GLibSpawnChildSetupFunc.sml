structure GLibSpawnChildSetupFunc :> G_LIB_SPAWN_CHILD_SETUP_FUNC =
  struct
    type func = unit -> unit
    type t = func

    structure C =
      struct
        structure Pointer = CPointerInternal
        type notnull = Pointer.notnull
        type 'a p = 'a Pointer.p
      end

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
        type notnull = C.notnull
        type 'a p = 'a C.p

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
          case optCallback of
            SOME callback => withCallback f callback
          | NONE          => f SpawnChildSetupCallbackTable.nullId

        fun withPtrToDispatch f () = f (_address "giraffe_spawn_child_setup_dispatch" : MLton.Pointer.t;)
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f MLton.Pointer.null
      end
  end
