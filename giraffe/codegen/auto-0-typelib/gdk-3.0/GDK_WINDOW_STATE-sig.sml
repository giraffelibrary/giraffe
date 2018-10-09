signature GDK_WINDOW_STATE =
  sig
    include FLAGS
    val WITHDRAWN : t
    val ICONIFIED : t
    val MAXIMIZED : t
    val STICKY : t
    val FULLSCREEN : t
    val ABOVE : t
    val BELOW : t
    val FOCUSED : t
    val TILED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
