signature G_LIB_ASCII_TYPE =
  sig
    include FLAGS
    val ALNUM : t
    val ALPHA : t
    val CNTRL : t
    val DIGIT : t
    val GRAPH : t
    val LOWER : t
    val PRINT : t
    val PUNCT : t
    val SPACE : t
    val UPPER : t
    val XDIGIT : t
  end
