structure GLibSpawnFlags :> G_LIB_SPAWN_FLAGS =
  struct
    val DEFAULT = 0w0
    val LEAVE_DESCRIPTORS_OPEN = 0w1
    val DO_NOT_REAP_CHILD = 0w2
    val SEARCH_PATH = 0w4
    val STDOUT_TO_DEV_NULL = 0w8
    val STDERR_TO_DEV_NULL = 0w16
    val CHILD_INHERITS_STDIN = 0w32
    val FILE_AND_ARGV_ZERO = 0w64
    val SEARCH_PATH_FROM_ENVP = 0w128
    val CLOEXEC_PIPES = 0w256
    val allFlags =
      [
        DEFAULT,
        LEAVE_DESCRIPTORS_OPEN,
        DO_NOT_REAP_CHILD,
        SEARCH_PATH,
        STDOUT_TO_DEV_NULL,
        STDERR_TO_DEV_NULL,
        CHILD_INHERITS_STDIN,
        FILE_AND_ARGV_ZERO,
        SEARCH_PATH_FROM_ENVP,
        CLOEXEC_PIPES
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
