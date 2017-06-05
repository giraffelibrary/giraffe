signature GIO_D_BUS_PROXY_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val DO_NOT_LOAD_PROPERTIES : t
    val DO_NOT_CONNECT_SIGNALS : t
    val DO_NOT_AUTO_START : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
