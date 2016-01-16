structure GLibSpawnChildSetupFunc :>
  sig
    include G_LIB_SPAWN_CHILD_SETUP_FUNC

    structure PolyML :
      sig
        val CALLBACK : C.callback PolyMLFFI.conversion
      end
  end =
  struct
    type t = unit -> unit

    structure C =
      struct
        type callback = unit -> unit

        val withCallback = I

        fun withOptCallback f optCallback =
          withCallback f (
            case optCallback of
              SOME callback => callback
            | NONE          => fn () => ()
          )
      end

    structure PolyML =
      struct
        val CALLBACK = CInterface.FUNCTION1 FFI.PolyML.VOID FFI.PolyML.VOID
      end
  end
