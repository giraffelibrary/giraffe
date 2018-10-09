signature G_LIB_LOG_LEVEL_FLAGS =
  sig
    include FLAGS
    val FLAG_RECURSION : t
    val FLAG_FATAL : t
    val LEVEL_ERROR : t
    val LEVEL_CRITICAL : t
    val LEVEL_WARNING : t
    val LEVEL_MESSAGE : t
    val LEVEL_INFO : t
    val LEVEL_DEBUG : t
    val LEVEL_MASK : t
  end
