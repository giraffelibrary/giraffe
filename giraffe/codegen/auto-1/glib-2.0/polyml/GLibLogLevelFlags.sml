structure GLibLogLevelFlags :>
  sig
    include G_LIB_LOG_LEVEL_FLAGS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val FLAGRECURSION = 0w1
    val FLAGFATAL = 0w2
    val LEVELERROR = 0w4
    val LEVELCRITICAL = 0w8
    val LEVELWARNING = 0w16
    val LEVELMESSAGE = 0w32
    val LEVELINFO = 0w64
    val LEVELDEBUG = 0w128
    val LEVELMASK = 0w4294967292
    val allFlags =
      [
        FLAGRECURSION,
        FLAGFATAL,
        LEVELERROR,
        LEVELCRITICAL,
        LEVELWARNING,
        LEVELMESSAGE,
        LEVELINFO,
        LEVELDEBUG,
        LEVELMASK
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
