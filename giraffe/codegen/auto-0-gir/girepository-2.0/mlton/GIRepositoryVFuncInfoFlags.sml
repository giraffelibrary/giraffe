structure GIRepositoryVFuncInfoFlags :> G_I_REPOSITORY_V_FUNC_INFO_FLAGS =
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
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
