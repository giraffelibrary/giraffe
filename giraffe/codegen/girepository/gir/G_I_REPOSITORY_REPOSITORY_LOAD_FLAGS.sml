signature G_I_REPOSITORY_REPOSITORY_LOAD_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val IREPOSITORYLOADFLAGLAZY : t
  end
