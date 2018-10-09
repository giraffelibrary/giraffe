signature GTK_STYLE_CONTEXT_PRINT_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val RECURSE : t
    val SHOW_STYLE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
