structure GObjectTypeDebugFlags :> G_OBJECT_TYPE_DEBUG_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val OBJECTS = 0w1
    val SIGNALS = 0w2
    val MASK = 0w3
    val allFlags =
      [
        NONE,
        OBJECTS,
        SIGNALS,
        MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
