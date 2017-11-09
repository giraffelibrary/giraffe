signature GDK_WINDOW_HINTS =
  sig
    include FLAGS
    val POS : t
    val MIN_SIZE : t
    val MAX_SIZE : t
    val BASE_SIZE : t
    val ASPECT : t
    val RESIZE_INC : t
    val WIN_GRAVITY : t
    val USER_POS : t
    val USER_SIZE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
