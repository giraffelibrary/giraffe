structure GIRepositoryFieldInfoFlags :> G_I_REPOSITORY_FIELD_INFO_FLAGS =
  struct
    val READABLE = 0w1
    val WRITABLE = 0w2
    val allFlags = [READABLE, WRITABLE]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
