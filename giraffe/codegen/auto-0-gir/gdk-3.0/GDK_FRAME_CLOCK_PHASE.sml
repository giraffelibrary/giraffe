signature GDK_FRAME_CLOCK_PHASE =
  sig
    include FLAGS
    val NONE : t
    val FLUSH_EVENTS : t
    val BEFORE_PAINT : t
    val UPDATE : t
    val LAYOUT : t
    val PAINT : t
    val RESUME_EVENTS : t
    val AFTER_PAINT : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
