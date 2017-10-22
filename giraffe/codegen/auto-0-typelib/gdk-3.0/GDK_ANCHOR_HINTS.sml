signature GDK_ANCHOR_HINTS =
  sig
    include FLAGS
    val FLIP_X : t
    val FLIP_Y : t
    val SLIDE_X : t
    val SLIDE_Y : t
    val RESIZE_X : t
    val RESIZE_Y : t
    val FLIP : t
    val SLIDE : t
    val RESIZE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
