signature GTK_RC_FLAGS =
  sig
    include FLAGS
    val FG : t
    val BG : t
    val TEXT : t
    val BASE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
