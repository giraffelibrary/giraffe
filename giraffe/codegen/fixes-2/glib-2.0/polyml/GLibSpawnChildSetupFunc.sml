structure GLibSpawnChildSetupFunc :>
  sig
    include G_LIB_SPAWN_CHILD_SETUP_FUNC

    structure PolyML :
      sig
        val CALLBACK : C.callback CInterface.Conversion
      end
  end =
  struct
    type t = unit -> unit

    structure C =
      struct
        type callback = unit -> unit
        val withCallback = I
      end

    structure PolyML =
      struct
        val CALLBACK = CInterface.FUNCTION1 FFI.PolyML.VOID FFI.PolyML.VOID
      end
  end
