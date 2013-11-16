signature G_LIB_I_O_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val APPEND : t
    val NONBLOCK : t
    val ISREADABLE : t
    val ISWRITEABLE : t
    val ISSEEKABLE : t
    val MASK : t
    val GETMASK : t
    val SETMASK : t
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
