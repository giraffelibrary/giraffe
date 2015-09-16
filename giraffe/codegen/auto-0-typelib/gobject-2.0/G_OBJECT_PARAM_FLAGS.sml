signature G_OBJECT_PARAM_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val READABLE : t
    val WRITABLE : t
    val CONSTRUCT : t
    val CONSTRUCT_ONLY : t
    val LAX_VALIDATION : t
    val STATIC_NAME : t
    val PRIVATE : t
    val STATIC_NICK : t
    val STATIC_BLURB : t
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
