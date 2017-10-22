signature G_OBJECT_SIGNAL_FLAGS =
  sig
    include FLAGS
    val RUN_FIRST : t
    val RUN_LAST : t
    val RUN_CLEANUP : t
    val NO_RECURSE : t
    val DETAILED : t
    val ACTION : t
    val NO_HOOKS : t
    val MUST_COLLECT : t
    val DEPRECATED : t
  end
