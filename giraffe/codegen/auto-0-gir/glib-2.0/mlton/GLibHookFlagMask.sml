structure GLibHookFlagMask :>
  sig
    include G_LIB_HOOK_FLAG_MASK
  end =
  struct
    val ACTIVE = 0w1
    val IN_CALL = 0w2
    val MASK = 0w15
    val allFlags =
      [
        ACTIVE,
        IN_CALL,
        MASK
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
  end
