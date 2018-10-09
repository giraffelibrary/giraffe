signature ATK_HYPERLINK_STATE_FLAGS =
  sig
    include FLAGS
    val INLINE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
