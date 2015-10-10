structure GObjectSignalFlags :>
  sig
    include G_OBJECT_SIGNAL_FLAGS
  end =
  struct
    val RUNFIRST = 0w1
    val RUNLAST = 0w2
    val RUNCLEANUP = 0w4
    val NORECURSE = 0w8
    val DETAILED = 0w16
    val ACTION = 0w32
    val NOHOOKS = 0w64
    val MUSTCOLLECT = 0w128
    val allFlags =
      [
        RUNFIRST,
        RUNLAST,
        RUNCLEANUP,
        NORECURSE,
        DETAILED,
        ACTION,
        NOHOOKS,
        MUSTCOLLECT
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
  end
