signature GIO_D_BUS_PROPERTY_INFO_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val READABLE : t
    val WRITABLE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
