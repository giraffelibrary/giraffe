structure GLibTestSubprocessFlags :> G_LIB_TEST_SUBPROCESS_FLAGS =
  struct
    val STDIN = 0w1
    val STDOUT = 0w2
    val STDERR = 0w4
    val allFlags =
      [
        STDIN,
        STDOUT,
        STDERR
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
