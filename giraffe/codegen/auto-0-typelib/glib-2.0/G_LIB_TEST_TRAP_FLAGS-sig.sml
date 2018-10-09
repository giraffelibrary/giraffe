signature G_LIB_TEST_TRAP_FLAGS =
  sig
    include FLAGS
    val SILENCE_STDOUT : t
    val SILENCE_STDERR : t
    val INHERIT_STDIN : t
  end
