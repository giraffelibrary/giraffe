signature GDK_W_M_DECORATION =
  sig
    include FLAGS
    val ALL : t
    val BORDER : t
    val RESIZEH : t
    val TITLE : t
    val MENU : t
    val MINIMIZE : t
    val MAXIMIZE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
