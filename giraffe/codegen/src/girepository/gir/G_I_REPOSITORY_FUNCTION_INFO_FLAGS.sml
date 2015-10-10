signature G_I_REPOSITORY_FUNCTION_INFO_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ISMETHOD : t
    val ISCONSTRUCTOR : t
    val ISGETTER : t
    val ISSETTER : t
    val WRAPSVFUNC : t
    val THROWS : t
  end
