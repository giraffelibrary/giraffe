structure GLibIOFlags :> G_LIB_I_O_FLAGS =
  struct
    val APPEND = 0w1
    val NONBLOCK = 0w2
    val IS_READABLE = 0w4
    val IS_WRITABLE = 0w8
    val IS_WRITEABLE = 0w8
    val IS_SEEKABLE = 0w16
    val MASK = 0w31
    val GET_MASK = 0w31
    val SET_MASK = 0w3
    val allFlags =
      [
        APPEND,
        NONBLOCK,
        IS_READABLE,
        IS_WRITABLE,
        IS_WRITEABLE,
        IS_SEEKABLE,
        MASK,
        GET_MASK,
        SET_MASK
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
