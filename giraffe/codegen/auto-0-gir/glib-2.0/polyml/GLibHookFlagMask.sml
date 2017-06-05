structure GLibHookFlagMask :> G_LIB_HOOK_FLAG_MASK =
  struct
    val ACTIVE = 0w1
    val IN_CALL = 0w2
    val MASK = 0w15
    val allFlags =
      [
        ACTIVE,
        IN_CALL,
        MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
