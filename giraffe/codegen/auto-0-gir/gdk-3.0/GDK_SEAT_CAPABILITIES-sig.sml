signature GDK_SEAT_CAPABILITIES =
  sig
    include FLAGS
    val NONE : t
    val POINTER : t
    val TOUCH : t
    val TABLET_STYLUS : t
    val KEYBOARD : t
    val ALL_POINTING : t
    val ALL : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
