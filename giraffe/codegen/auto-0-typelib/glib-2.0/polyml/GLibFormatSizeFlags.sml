structure GLibFormatSizeFlags :> G_LIB_FORMAT_SIZE_FLAGS =
  struct
    val DEFAULT = 0w0
    val LONG_FORMAT = 0w1
    val IEC_UNITS = 0w2
    val allFlags =
      [
        DEFAULT,
        LONG_FORMAT,
        IEC_UNITS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
