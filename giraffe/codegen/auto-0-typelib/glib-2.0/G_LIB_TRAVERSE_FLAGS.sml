signature G_LIB_TRAVERSE_FLAGS =
  sig
    include FLAGS
    val LEAVES : t
    val NON_LEAVES : t
    val ALL : t
    val MASK : t
    val LEAFS : t
    val NON_LEAFS : t
  end
