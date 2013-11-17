signature G_LIB_OPTION_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val HIDDEN : t
    val INMAIN : t
    val REVERSE : t
    val NOARG : t
    val FILENAME : t
    val OPTIONALARG : t
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
