structure GObjectTypeDebugFlags :> G_OBJECT_TYPE_DEBUG_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val OBJECTS = 0w1
    val SIGNALS = 0w2
    val INSTANCE_COUNT = 0w4
    val MASK = 0w7
    val allFlags =
      [
        NONE,
        OBJECTS,
        SIGNALS,
        INSTANCE_COUNT,
        MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
