signature GDK_WINDOW_ATTRIBUTES_TYPE =
  sig
    include FLAGS
    val TITLE : t
    val X : t
    val Y : t
    val CURSOR : t
    val VISUAL : t
    val WMCLASS : t
    val NOREDIR : t
    val TYPE_HINT : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
