signature G_OBJECT_TYPE_DEBUG_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val OBJECTS : t
    val SIGNALS : t
    val MASK : t
  end
