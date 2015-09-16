signature G_LIB_TRAVERSE_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val LEAVES : t
    val NON_LEAVES : t
    val ALL : t
    val MASK : t
    val LEAFS : t
    val NON_LEAFS : t
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
