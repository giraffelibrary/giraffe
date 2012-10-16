signature G_I_REPOSITORY_V_FUNC_INFO_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val CHAINUP : t
    val OVERRIDE : t
    val NOTOVERRIDE : t
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
