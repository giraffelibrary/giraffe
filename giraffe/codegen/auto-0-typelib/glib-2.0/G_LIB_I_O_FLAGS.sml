signature G_LIB_I_O_FLAGS =
  sig
    include FLAGS
    val APPEND : t
    val NONBLOCK : t
    val IS_READABLE : t
    val IS_WRITEABLE : t
    val IS_SEEKABLE : t
    val MASK : t
    val GET_MASK : t
    val SET_MASK : t
  end
