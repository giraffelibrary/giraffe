signature GIO_RESOURCE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val COMPRESSED : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
