signature G_LIB_REGEX_MATCH_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val ANCHORED : t
    val NOTBOL : t
    val NOTEOL : t
    val NOTEMPTY : t
    val PARTIAL : t
    val NEWLINE_CR : t
    val NEWLINE_LF : t
    val NEWLINE_CRLF : t
    val NEWLINE_ANY : t
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
