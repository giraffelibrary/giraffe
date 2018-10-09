signature G_LIB_HOOK_FLAG_MASK =
  sig
    include FLAGS
    val ACTIVE : t
    val IN_CALL : t
    val MASK : t
  end
