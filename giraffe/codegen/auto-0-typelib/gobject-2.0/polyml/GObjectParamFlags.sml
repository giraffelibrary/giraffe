structure GObjectParamFlags :>
  sig
    include G_OBJECT_PARAM_FLAGS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val CONSTRUCT = 0w4
    val CONSTRUCT_ONLY = 0w8
    val LAX_VALIDATION = 0w16
    val STATIC_NAME = 0w32
    val PRIVATE = 0w32
    val STATIC_NICK = 0w64
    val STATIC_BLURB = 0w128
    val DEPRECATED = 0w2147483648
    val allFlags =
      [
        READABLE,
        WRITABLE,
        CONSTRUCT,
        CONSTRUCT_ONLY,
        LAX_VALIDATION,
        STATIC_NAME,
        PRIVATE,
        STATIC_NICK,
        STATIC_BLURB,
        DEPRECATED
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
