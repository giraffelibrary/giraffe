signature G_OBJECT_TYPE_FUNDAMENTAL_FLAGS =
  sig
    include FLAGS
    val CLASSED : t
    val INSTANTIATABLE : t
    val DERIVABLE : t
    val DEEP_DERIVABLE : t
  end
