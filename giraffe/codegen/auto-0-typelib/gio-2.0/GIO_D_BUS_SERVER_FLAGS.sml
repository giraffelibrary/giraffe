signature GIO_D_BUS_SERVER_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val RUN_IN_THREAD : t
    val AUTHENTICATION_ALLOW_ANONYMOUS : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
