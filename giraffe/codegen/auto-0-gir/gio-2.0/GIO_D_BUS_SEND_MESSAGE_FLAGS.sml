signature GIO_D_BUS_SEND_MESSAGE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val PRESERVE_SERIAL : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
