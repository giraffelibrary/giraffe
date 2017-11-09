signature GIO_D_BUS_SIGNAL_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val NO_MATCH_RULE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
