signature VTE_PTY_FLAGS =
  sig
    include FLAGS
    val NO_LASTLOG : t
    val NO_UTMP : t
    val NO_WTMP : t
    val NO_HELPER : t
    val NO_FALLBACK : t
    val DEFAULT : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
