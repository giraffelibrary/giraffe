signature GDK_W_M_FUNCTION =
  sig
    include FLAGS
    val ALL : t
    val RESIZE : t
    val MOVE : t
    val MINIMIZE : t
    val MAXIMIZE : t
    val CLOSE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
