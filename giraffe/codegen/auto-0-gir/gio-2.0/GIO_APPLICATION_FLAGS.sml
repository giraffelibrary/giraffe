signature GIO_APPLICATION_FLAGS =
  sig
    include FLAGS
    val FLAGS_NONE : t
    val IS_SERVICE : t
    val IS_LAUNCHER : t
    val HANDLES_OPEN : t
    val HANDLES_COMMAND_LINE : t
    val SEND_ENVIRONMENT : t
    val NON_UNIQUE : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
