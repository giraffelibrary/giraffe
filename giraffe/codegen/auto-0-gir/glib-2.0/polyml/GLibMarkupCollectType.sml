structure GLibMarkupCollectType :>
  sig
    include G_LIB_MARKUP_COLLECT_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
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
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val cVal = FFI.Flags.PolyML.cVal
        val cRef = FFI.Flags.PolyML.cRef
      end
  end
