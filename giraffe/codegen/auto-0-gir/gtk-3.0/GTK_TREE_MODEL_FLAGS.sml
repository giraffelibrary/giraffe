signature GTK_TREE_MODEL_FLAGS =
  sig
    include FLAGS
    val ITERS_PERSIST : t
    val LIST_ONLY : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
