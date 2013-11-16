signature G_LIB_ASCII_TYPE =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
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
