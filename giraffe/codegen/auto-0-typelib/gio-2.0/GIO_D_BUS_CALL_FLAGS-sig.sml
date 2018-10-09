signature GIO_D_BUS_CALL_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val NO_AUTO_START : t
    val ALLOW_INTERACTIVE_AUTHORIZATION : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
