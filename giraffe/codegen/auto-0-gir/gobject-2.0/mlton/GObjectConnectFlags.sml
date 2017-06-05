structure GObjectConnectFlags :> G_OBJECT_CONNECT_FLAGS =
  struct
    val AFTER = 0w1
    val SWAPPED = 0w2
    val allFlags = [AFTER, SWAPPED]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
