structure GIRepositoryRepositoryLoadFlags :> G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS =
  struct
    val IREPOSITORY_LOAD_FLAG_LAZY = 0w1
    val allFlags = [IREPOSITORY_LOAD_FLAG_LAZY]
    structure BitFlags =
      Word32BitFlags(
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
  end
