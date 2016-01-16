structure GLibLogLevelFlags :>
  sig
    include G_LIB_LOG_LEVEL_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val FLAG_RECURSION = 0w1
    val FLAG_FATAL = 0w2
    val LEVEL_ERROR = 0w4
    val LEVEL_CRITICAL = 0w8
    val LEVEL_WARNING = 0w16
    val LEVEL_MESSAGE = 0w32
    val LEVEL_INFO = 0w64
    val LEVEL_DEBUG = 0w128
    val LEVEL_MASK = 0w4294967292
    val allFlags =
      [
        FLAG_RECURSION,
        FLAG_FATAL,
        LEVEL_ERROR,
        LEVEL_CRITICAL,
        LEVEL_WARNING,
        LEVEL_MESSAGE,
        LEVEL_INFO,
        LEVEL_DEBUG,
        LEVEL_MASK
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
