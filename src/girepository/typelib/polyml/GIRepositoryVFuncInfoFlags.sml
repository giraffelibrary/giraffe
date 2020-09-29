structure GIRepositoryVFuncInfoFlags :> G_I_REPOSITORY_V_FUNC_INFO_FLAGS =
  struct
    val MUST_CHAIN_UP = 0w1
    val MUST_OVERRIDE = 0w2
    val MUST_NOT_OVERRIDE = 0w4
    val THROWS = 0w8
    val allFlags =
      [
        MUST_CHAIN_UP,
        MUST_OVERRIDE,
        MUST_NOT_OVERRIDE,
        THROWS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
