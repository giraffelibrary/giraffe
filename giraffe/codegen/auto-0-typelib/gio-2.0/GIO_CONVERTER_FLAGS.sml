signature GIO_CONVERTER_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val INPUT_AT_END : t
    val FLUSH : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
