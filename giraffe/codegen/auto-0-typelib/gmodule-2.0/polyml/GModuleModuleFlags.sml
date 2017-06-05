structure GModuleModuleFlags :> G_MODULE_MODULE_FLAGS =
  struct
    val LAZY = 0w1
    val LOCAL = 0w2
    val MASK = 0w3
    val allFlags =
      [
        LAZY,
        LOCAL,
        MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
