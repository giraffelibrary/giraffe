structure GLibMarkupParseFlags :> G_LIB_MARKUP_PARSE_FLAGS =
  struct
    val DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 0w1
    val TREAT_CDATA_AS_TEXT = 0w2
    val PREFIX_ERROR_POSITION = 0w4
    val IGNORE_QUALIFIED = 0w8
    val allFlags =
      [
        DO_NOT_USE_THIS_UNSUPPORTED_FLAG,
        TREAT_CDATA_AS_TEXT,
        PREFIX_ERROR_POSITION,
        IGNORE_QUALIFIED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
