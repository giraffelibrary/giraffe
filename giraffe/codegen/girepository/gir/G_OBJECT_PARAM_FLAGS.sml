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
  end
