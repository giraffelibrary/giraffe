signature G_LIB_MARKUP_PARSE_FLAGS =
  sig
    include FLAGS
    val DO_NOT_USE_THIS_UNSUPPORTED_FLAG : t
    val TREAT_CDATA_AS_TEXT : t
    val PREFIX_ERROR_POSITION : t
  end
