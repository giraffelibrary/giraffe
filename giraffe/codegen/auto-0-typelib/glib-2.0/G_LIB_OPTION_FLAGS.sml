signature G_LIB_OPTION_FLAGS =
  sig
    include FLAGS
    val HIDDEN : t
    val IN_MAIN : t
    val REVERSE : t
    val NO_ARG : t
    val FILENAME : t
    val OPTIONAL_ARG : t
    val NOALIAS : t
  end
