signature GTK_DEBUG_FLAG =
  sig
    include FLAGS
    val MISC : t
    val PLUGSOCKET : t
    val TEXT : t
    val TREE : t
    val UPDATES : t
    val KEYBINDINGS : t
    val MULTIHEAD : t
    val MODULES : t
    val GEOMETRY : t
    val ICONTHEME : t
    val PRINTING : t
    val BUILDER : t
    val SIZE_REQUEST : t
    val NO_CSS_CACHE : t
    val BASELINES : t
    val PIXEL_CACHE : t
    val NO_PIXEL_CACHE : t
    val INTERACTIVE : t
    val TOUCHSCREEN : t
    val ACTIONS : t
    val RESIZE : t
    val LAYOUT : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
