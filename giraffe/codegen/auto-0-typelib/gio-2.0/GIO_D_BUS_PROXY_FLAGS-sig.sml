signature GIO_D_BUS_PROXY_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val DO_NOT_LOAD_PROPERTIES : t
    val DO_NOT_CONNECT_SIGNALS : t
    val DO_NOT_AUTO_START : t
    val GET_INVALIDATED_PROPERTIES : t
    val DO_NOT_AUTO_START_AT_CONSTRUCTION : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
