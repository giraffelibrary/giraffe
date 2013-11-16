signature G_LIB_MARKUP_PARSE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val DONOTUSETHISUNSUPPORTEDFLAG : t
    val TREATCDATAASTEXT : t
    val PREFIXERRORPOSITION : t
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
