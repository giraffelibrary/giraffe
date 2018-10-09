signature GIO_SETTINGS_BIND_FLAGS =
  sig
    include FLAGS
    val DEFAULT : t
    val GET : t
    val SET : t
    val NO_SENSITIVITY : t
    val GET_NO_CHANGES : t
    val INVERT_BOOLEAN : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
