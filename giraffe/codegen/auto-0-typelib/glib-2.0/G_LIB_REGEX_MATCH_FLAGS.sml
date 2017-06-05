signature G_LIB_REGEX_MATCH_FLAGS =
  sig
    include FLAGS
    val ANCHORED : t
    val NOTBOL : t
    val NOTEOL : t
    val NOTEMPTY : t
    val PARTIAL : t
    val NEWLINE_CR : t
    val NEWLINE_LF : t
    val NEWLINE_CRLF : t
    val NEWLINE_ANY : t
  end
