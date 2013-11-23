structure GIRepositoryVFuncInfoFlags :>
  sig
    include G_I_REPOSITORY_V_FUNC_INFO_FLAGS
  end =
  struct
    val MUSTCHAINUP = 0w1
    val MUSTOVERRIDE = 0w2
    val MUSTNOTOVERRIDE = 0w4
    val THROWS = 0w8
    val allFlags =
      [
        MUSTCHAINUP,
        MUSTOVERRIDE,
        MUSTNOTOVERRIDE,
        THROWS
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
  end
