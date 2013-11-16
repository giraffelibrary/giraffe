signature G_LIB_LOG_LEVEL_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val FLAGRECURSION : t
    val FLAGFATAL : t
    val LEVELERROR : t
    val LEVELCRITICAL : t
    val LEVELWARNING : t
    val LEVELMESSAGE : t
    val LEVELINFO : t
    val LEVELDEBUG : t
    val LEVELMASK : t
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
