signature G_LIB_FILE_TEST =
  sig
    include FLAGS
    val IS_REGULAR : t
    val IS_SYMLINK : t
    val IS_DIR : t
    val IS_EXECUTABLE : t
    val EXISTS : t
  end
