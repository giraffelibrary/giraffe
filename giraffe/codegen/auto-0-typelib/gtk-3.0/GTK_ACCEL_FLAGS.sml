signature GTK_ACCEL_FLAGS =
  sig
    include FLAGS
    val VISIBLE : t
    val LOCKED : t
    val MASK : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
