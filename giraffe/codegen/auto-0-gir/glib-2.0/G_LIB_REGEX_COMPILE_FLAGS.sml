signature G_LIB_REGEX_COMPILE_FLAGS =
  sig
    include FLAGS
    val CASELESS : t
    val MULTILINE : t
    val DOTALL : t
    val EXTENDED : t
    val ANCHORED : t
    val DOLLAR_ENDONLY : t
    val UNGREEDY : t
    val RAW : t
    val NO_AUTO_CAPTURE : t
    val OPTIMIZE : t
    val FIRSTLINE : t
    val DUPNAMES : t
    val NEWLINE_CR : t
    val NEWLINE_LF : t
    val NEWLINE_CRLF : t
    val NEWLINE_ANYCRLF : t
    val BSR_ANYCRLF : t
    val JAVASCRIPT_COMPAT : t
  end
