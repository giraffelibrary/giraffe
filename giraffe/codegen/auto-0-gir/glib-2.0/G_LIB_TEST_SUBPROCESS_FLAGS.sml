signature G_LIB_TEST_SUBPROCESS_FLAGS =
  sig
    include FLAGS
    val STDIN : t
    val STDOUT : t
    val STDERR : t
  end
