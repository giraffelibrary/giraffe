signature G_OBJECT_PARAM_FLAGS =
  sig
    include FLAGS
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
  end
