structure GLibFileTest :> G_LIB_FILE_TEST =
  struct
    val IS_REGULAR = 0w1
    val IS_SYMLINK = 0w2
    val IS_DIR = 0w4
    val IS_EXECUTABLE = 0w8
    val EXISTS = 0w16
    val allFlags =
      [
        IS_REGULAR,
        IS_SYMLINK,
        IS_DIR,
        IS_EXECUTABLE,
        EXISTS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
