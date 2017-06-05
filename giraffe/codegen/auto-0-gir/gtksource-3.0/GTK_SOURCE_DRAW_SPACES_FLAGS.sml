signature GTK_SOURCE_DRAW_SPACES_FLAGS =
  sig
    include FLAGS
    val SPACE : t
    val TAB : t
    val NEWLINE : t
    val NBSP : t
    val LEADING : t
    val TEXT : t
    val TRAILING : t
    val ALL : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
