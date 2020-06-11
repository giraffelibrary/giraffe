(* Copyright (C) 2013-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GLibSpawnChildSetupFunc :> G_LIB_SPAWN_CHILD_SETUP_FUNC =
  struct
    type func = unit -> unit
    type t = func

    structure C =
      struct
        structure Pointer = CPointer(GMemory)
        type opt = Pointer.opt
        type non_opt = Pointer.non_opt
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
        type opt = C.opt
        type non_opt = C.non_opt
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

        fun withPtrToDispatch f () =
          f (_address "giraffe_spawn_child_setup_dispatch" : 'a p;)
        fun withOptPtrToDispatch f =
          fn
            true  => withPtrToDispatch f ()
          | false => f C.Pointer.null
      end
  end
