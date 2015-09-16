structure GIRepositoryRepositoryLoadFlags :>
  sig
    include G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS
  end =
  struct
    val IREPOSITORY_LOAD_FLAG_LAZY = 0w1
    val allFlags = [IREPOSITORY_LOAD_FLAG_LAZY]
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
