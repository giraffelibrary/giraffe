signature GIO_D_BUS_OBJECT_MANAGER_CLIENT_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val DO_NOT_AUTO_START : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
