signature GTK_APPLICATION_INHIBIT_FLAGS =
  sig
    include FLAGS
    val LOGOUT : t
    val SWITCH : t
    val SUSPEND : t
    val IDLE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
