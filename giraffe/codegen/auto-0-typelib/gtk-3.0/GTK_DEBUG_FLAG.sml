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
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
