structure GLibTestTrapFlags :> G_LIB_TEST_TRAP_FLAGS =
  struct
    val SILENCE_STDOUT = 0w128
    val SILENCE_STDERR = 0w256
    val INHERIT_STDIN = 0w512
    val allFlags =
      [
        SILENCE_STDOUT,
        SILENCE_STDERR,
        INHERIT_STDIN
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
