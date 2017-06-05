structure GLibTraverseFlags :> G_LIB_TRAVERSE_FLAGS =
  struct
    val LEAVES = 0w1
    val NON_LEAVES = 0w2
    val ALL = 0w3
    val MASK = 0w3
    val LEAFS = 0w1
    val NON_LEAFS = 0w2
    val allFlags =
      [
        LEAVES,
        NON_LEAVES,
        ALL,
        MASK,
        LEAFS,
        NON_LEAFS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
