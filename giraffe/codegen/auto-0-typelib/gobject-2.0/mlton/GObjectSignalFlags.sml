structure GObjectSignalFlags :> G_OBJECT_SIGNAL_FLAGS =
  struct
    val RUN_FIRST = 0w1
    val RUN_LAST = 0w2
    val RUN_CLEANUP = 0w4
    val NO_RECURSE = 0w8
    val DETAILED = 0w16
    val ACTION = 0w32
    val NO_HOOKS = 0w64
    val MUST_COLLECT = 0w128
    val DEPRECATED = 0w256
    val allFlags =
      [
        RUN_FIRST,
        RUN_LAST,
        RUN_CLEANUP,
        NO_RECURSE,
        DETAILED,
        ACTION,
        NO_HOOKS,
        MUST_COLLECT,
        DEPRECATED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
