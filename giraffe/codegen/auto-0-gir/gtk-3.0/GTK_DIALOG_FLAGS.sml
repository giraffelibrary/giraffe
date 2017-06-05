signature GTK_DIALOG_FLAGS =
  sig
    include FLAGS
    val MODAL : t
    val DESTROY_WITH_PARENT : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
