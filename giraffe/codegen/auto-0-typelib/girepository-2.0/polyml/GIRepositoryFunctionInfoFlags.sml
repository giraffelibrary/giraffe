structure GIRepositoryFunctionInfoFlags :> G_I_REPOSITORY_FUNCTION_INFO_FLAGS =
  struct
    val IS_METHOD = 0w1
    val IS_CONSTRUCTOR = 0w2
    val IS_GETTER = 0w4
    val IS_SETTER = 0w8
    val WRAPS_VFUNC = 0w16
    val THROWS = 0w32
    val allFlags =
      [
        IS_METHOD,
        IS_CONSTRUCTOR,
        IS_GETTER,
        IS_SETTER,
        WRAPS_VFUNC,
        THROWS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
