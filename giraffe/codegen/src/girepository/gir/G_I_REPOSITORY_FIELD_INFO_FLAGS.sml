signature G_I_REPOSITORY_FIELD_INFO_FLAGS =
  sig
    eqtype t
    include
      BIT_FLAGS
        where type flags = t
    val READABLE : t
    val WRITABLE : t
  end
