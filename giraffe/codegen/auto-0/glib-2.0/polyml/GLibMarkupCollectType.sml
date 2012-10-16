structure GLibMarkupCollectType :>
  sig
    include G_LIB_MARKUP_COLLECT_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val INVALID = 0w0
    val STRING = 0w1
    val STRDUP = 0w2
    val BOOLEAN = 0w3
    val TRISTATE = 0w4
    val OPTIONAL = 0w65536
    val allFlags =
      [
        INVALID,
        STRING,
        STRDUP,
        BOOLEAN,
        TRISTATE,
        OPTIONAL
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
