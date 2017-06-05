signature GIO_D_BUS_PROPERTY_INFO_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val READABLE : t
    val WRITABLE : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
