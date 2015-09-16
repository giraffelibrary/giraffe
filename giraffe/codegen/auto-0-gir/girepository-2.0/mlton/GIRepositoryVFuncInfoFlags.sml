structure GIRepositoryVFuncInfoFlags :>
  sig
    include G_I_REPOSITORY_V_FUNC_INFO_FLAGS
  end =
  struct
    val CHAIN_UP = 0w1
    val OVERRIDE = 0w2
    val NOT_OVERRIDE = 0w4
    val allFlags =
      [
        CHAIN_UP,
        OVERRIDE,
        NOT_OVERRIDE
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
