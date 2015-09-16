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
    val RUN_FIRST = 0w1
    val RUN_LAST = 0w2
    val RUN_CLEANUP = 0w4
    val NO_RECURSE = 0w8
    val DETAILED = 0w16
    val ACTION = 0w32
    val NO_HOOKS = 0w64
    val MUST_COLLECT = 0w128
    val allFlags =
      [
        RUN_FIRST,
        RUN_LAST,
        RUN_CLEANUP,
        NO_RECURSE,
        DETAILED,
        ACTION,
        NO_HOOKS,
        MUST_COLLECT
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.Flags.PolyML.VAL
        val REF = FFI.Flags.PolyML.REF
      end
  end
