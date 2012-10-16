structure GObjectTypeFundamentalFlags :>
  sig
    include G_OBJECT_TYPE_FUNDAMENTAL_FLAGS
  end =
  struct
    val CLASSED = 0w1
    val INSTANTIATABLE = 0w2
    val DERIVABLE = 0w4
    val DEEPDERIVABLE = 0w8
    val allFlags =
      [
        CLASSED,
        INSTANTIATABLE,
        DERIVABLE,
        DEEPDERIVABLE
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
