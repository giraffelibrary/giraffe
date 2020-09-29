signature G_I_REPOSITORY_FUNCTION_INFO_FLAGS =
  sig
    include FLAGS
    val IS_METHOD : t
    val IS_CONSTRUCTOR : t
    val IS_GETTER : t
    val IS_SETTER : t
    val WRAPS_VFUNC : t
    val THROWS : t
  end
