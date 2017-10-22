signature GIO_SUBPROCESS_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val STDIN_PIPE : t
    val STDIN_INHERIT : t
    val STDOUT_PIPE : t
    val STDOUT_SILENCE : t
    val STDERR_PIPE : t
    val STDERR_SILENCE : t
    val STDERR_MERGE : t
    val INHERIT_FDS : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
