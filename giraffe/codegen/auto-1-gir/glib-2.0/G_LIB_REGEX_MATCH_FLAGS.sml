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
    val NEWLINECR : t
    val NEWLINELF : t
    val NEWLINECRLF : t
    val NEWLINEANY : t
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
