signature GTK_ICON_LOOKUP_FLAGS =
  sig
    include FLAGS
    val NO_SVG : t
    val FORCE_SVG : t
    val USE_BUILTIN : t
    val GENERIC_FALLBACK : t
    val FORCE_SIZE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
