signature GDK_DRAG_ACTION =
  sig
    include FLAGS
    val DEFAULT : t
    val COPY : t
    val MOVE : t
    val LINK : t
    val PRIVATE : t
    val ASK : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
