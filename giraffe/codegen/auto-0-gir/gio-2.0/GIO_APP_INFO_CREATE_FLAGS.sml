signature GIO_APP_INFO_CREATE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val NEEDS_TERMINAL : t
    val SUPPORTS_URIS : t
    val SUPPORTS_STARTUP_NOTIFICATION : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
