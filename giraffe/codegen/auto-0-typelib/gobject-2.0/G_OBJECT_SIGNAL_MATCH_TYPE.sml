signature G_OBJECT_SIGNAL_MATCH_TYPE =
  sig
    include FLAGS
    val ID : t
    val DETAIL : t
    val CLOSURE : t
    val FUNC : t
    val DATA : t
    val UNBLOCKED : t
  end
