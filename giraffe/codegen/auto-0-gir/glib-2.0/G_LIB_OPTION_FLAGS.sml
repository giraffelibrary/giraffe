signature G_LIB_OPTION_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val HIDDEN : t
    val IN_MAIN : t
    val REVERSE : t
    val NO_ARG : t
    val FILENAME : t
    val OPTIONAL_ARG : t
    val NOALIAS : t
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
