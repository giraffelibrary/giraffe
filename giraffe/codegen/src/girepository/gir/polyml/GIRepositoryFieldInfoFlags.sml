structure GIRepositoryFieldInfoFlags :> G_I_REPOSITORY_FIELD_INFO_FLAGS =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val allFlags = [READABLE, WRITABLE]
    structure BitFlags =
      Word32BitFlags(
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
  end
