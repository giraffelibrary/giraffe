structure GIRepositoryVFuncInfoFlags :>
  sig
    include G_I_REPOSITORY_V_FUNC_INFO_FLAGS
  end =
  struct
    val CHAINUP = 0w1
    val OVERRIDE = 0w2
    val NOTOVERRIDE = 0w4
    val allFlags =
      [
        CHAINUP,
        OVERRIDE,
        NOTOVERRIDE
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
