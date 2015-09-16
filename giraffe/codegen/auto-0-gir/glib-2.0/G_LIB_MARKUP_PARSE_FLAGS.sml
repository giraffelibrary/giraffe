signature G_LIB_MARKUP_PARSE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val DO_NOT_USE_THIS_UNSUPPORTED_FLAG : t
    val TREAT_CDATA_AS_TEXT : t
    val PREFIX_ERROR_POSITION : t
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
