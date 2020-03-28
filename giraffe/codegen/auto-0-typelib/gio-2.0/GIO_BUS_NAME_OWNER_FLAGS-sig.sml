signature GIO_BUS_NAME_OWNER_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val ALLOW_REPLACEMENT : t
    val REPLACE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end