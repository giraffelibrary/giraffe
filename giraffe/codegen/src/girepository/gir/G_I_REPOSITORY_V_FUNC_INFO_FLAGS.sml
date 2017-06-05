signature G_I_REPOSITORY_V_FUNC_INFO_FLAGS =
  sig
    include FLAGS
    val MUST_CHAIN_UP : t
    val MUST_OVERRIDE : t
    val MUST_NOT_OVERRIDE : t
    val THROWS : t
  end
