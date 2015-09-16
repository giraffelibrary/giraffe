signature G_I_REPOSITORY_FUNCTION_INFO_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val IS_METHOD : t
    val IS_CONSTRUCTOR : t
    val IS_GETTER : t
    val IS_SETTER : t
    val WRAPS_VFUNC : t
    val THROWS : t
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
