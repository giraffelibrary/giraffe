signature G_LIB_SPAWN_FLAGS =
  sig
    include FLAGS
    val DEFAULT : t
    val LEAVE_DESCRIPTORS_OPEN : t
    val DO_NOT_REAP_CHILD : t
    val SEARCH_PATH : t
    val STDOUT_TO_DEV_NULL : t
    val STDERR_TO_DEV_NULL : t
    val CHILD_INHERITS_STDIN : t
    val FILE_AND_ARGV_ZERO : t
    val SEARCH_PATH_FROM_ENVP : t
    val CLOEXEC_PIPES : t
  end
