signature GTK_DIALOG_FLAGS =
  sig
    include FLAGS
    val MODAL : t
    val DESTROY_WITH_PARENT : t
    val USE_HEADER_BAR : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
