signature G_LIB_I_O_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val APPEND : t
    val NONBLOCK : t
    val IS_READABLE : t
    val IS_WRITEABLE : t
    val IS_SEEKABLE : t
    val MASK : t
    val GET_MASK : t
    val SET_MASK : t
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
