signature GTK_TOOL_PALETTE_DRAG_TARGETS =
  sig
    include FLAGS
    val ITEMS : t
    val GROUPS : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
