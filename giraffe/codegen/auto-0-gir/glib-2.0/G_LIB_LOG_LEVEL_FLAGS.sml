signature G_LIB_LOG_LEVEL_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val FLAG_RECURSION : t
    val FLAG_FATAL : t
    val LEVEL_ERROR : t
    val LEVEL_CRITICAL : t
    val LEVEL_WARNING : t
    val LEVEL_MESSAGE : t
    val LEVEL_INFO : t
    val LEVEL_DEBUG : t
    val LEVEL_MASK : t
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
