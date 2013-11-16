signature G_OBJECT_PARAM_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val READABLE : t
    val WRITABLE : t
    val CONSTRUCT : t
    val CONSTRUCTONLY : t
    val LAXVALIDATION : t
    val STATICNAME : t
    val PRIVATE : t
    val STATICNICK : t
    val STATICBLURB : t
    val DEPRECATED : t
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
