structure GIRepositoryFieldInfoFlags :>
  sig
    include G_I_REPOSITORY_FIELD_INFO_FLAGS
  end =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val allFlags = [READABLE, WRITABLE]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
  end
