structure GIRepositoryRepositoryLoadFlags :>
  sig
    include G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS
  end =
  struct
    val IREPOSITORYLOADFLAGLAZY = 0w1
    val allFlags = [IREPOSITORYLOADFLAGLAZY]
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
