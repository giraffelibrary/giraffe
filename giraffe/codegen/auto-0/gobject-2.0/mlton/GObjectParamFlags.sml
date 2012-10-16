structure GObjectParamFlags :>
  sig
    include G_OBJECT_PARAM_FLAGS
  end =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val CONSTRUCT = 0w4
    val CONSTRUCTONLY = 0w8
    val LAXVALIDATION = 0w16
    val STATICNAME = 0w32
    val PRIVATE = 0w32
    val STATICNICK = 0w64
    val STATICBLURB = 0w128
    val DEPRECATED = 0w2147483648
    val allFlags =
      [
        READABLE,
        WRITABLE,
        CONSTRUCT,
        CONSTRUCTONLY,
        LAXVALIDATION,
        STATICNAME,
        PRIVATE,
        STATICNICK,
        STATICBLURB,
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
        type val_ = FFI.Flags.val_
        type ref_ = FFI.Flags.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.withRef f)
        fun fromVal w = w
      end
  end
