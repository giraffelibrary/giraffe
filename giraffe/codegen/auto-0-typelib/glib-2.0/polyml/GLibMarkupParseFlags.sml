structure GLibMarkupParseFlags :>
  sig
    include G_LIB_MARKUP_PARSE_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 0w1
    val TREAT_CDATA_AS_TEXT = 0w2
    val PREFIX_ERROR_POSITION = 0w4
    val allFlags =
      [
        DO_NOT_USE_THIS_UNSUPPORTED_FLAG,
        TREAT_CDATA_AS_TEXT,
        PREFIX_ERROR_POSITION
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
