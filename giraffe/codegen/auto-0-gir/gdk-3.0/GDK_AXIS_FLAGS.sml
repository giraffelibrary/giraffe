signature GDK_AXIS_FLAGS =
  sig
    include FLAGS
    val X : t
    val Y : t
    val PRESSURE : t
    val XTILT : t
    val YTILT : t
    val WHEEL : t
    val DISTANCE : t
    val ROTATION : t
    val SLIDER : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
