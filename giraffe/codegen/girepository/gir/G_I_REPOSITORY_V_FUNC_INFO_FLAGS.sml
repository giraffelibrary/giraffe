signature G_I_REPOSITORY_V_FUNC_INFO_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val MUSTCHAINUP : t
    val MUSTOVERRIDE : t
    val MUSTNOTOVERRIDE : t
    val THROWS : t
  end
