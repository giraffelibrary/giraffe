signature GTK_SOURCE_COMPLETION_ACTIVATION =
  sig
    include FLAGS
    val NONE : t
    val INTERACTIVE : t
    val USER_REQUESTED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
