structure GObjectSignalFlags :>
  sig
    include G_OBJECT_SIGNAL_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
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
    structure C =
      struct
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Flags.VAL
        val REF = FFI.PolyML.Flags.REF
      end
  end
