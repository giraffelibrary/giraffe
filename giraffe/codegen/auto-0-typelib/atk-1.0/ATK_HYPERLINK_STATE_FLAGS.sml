signature ATK_HYPERLINK_STATE_FLAGS =
  sig
    include FLAGS
    val INLINE : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
