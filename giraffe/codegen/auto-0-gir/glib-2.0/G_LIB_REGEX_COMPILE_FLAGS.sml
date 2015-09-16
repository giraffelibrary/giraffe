signature G_LIB_REGEX_COMPILE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
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
    val DUPNAMES : t
    val NEWLINE_CR : t
    val NEWLINE_LF : t
    val NEWLINE_CRLF : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
