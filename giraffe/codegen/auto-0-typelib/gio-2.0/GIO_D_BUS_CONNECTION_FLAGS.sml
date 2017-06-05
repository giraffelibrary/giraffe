signature GIO_D_BUS_CONNECTION_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val AUTHENTICATION_CLIENT : t
    val AUTHENTICATION_SERVER : t
    val AUTHENTICATION_ALLOW_ANONYMOUS : t
    val MESSAGE_BUS_CONNECTION : t
    val DELAY_MESSAGE_PROCESSING : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
