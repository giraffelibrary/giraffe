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
  end
