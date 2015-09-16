structure GObjectTypeFlags :>
  sig
    include G_OBJECT_TYPE_FLAGS
  end =
  struct
    val ABSTRACT = 0w16
    val VALUE_ABSTRACT = 0w32
    val allFlags = [ABSTRACT, VALUE_ABSTRACT]
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
  end
