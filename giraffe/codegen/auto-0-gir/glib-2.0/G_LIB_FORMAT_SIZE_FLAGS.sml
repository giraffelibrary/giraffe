signature G_LIB_FORMAT_SIZE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val DEFAULT : t
    val LONG_FORMAT : t
    val IEC_UNITS : t
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
