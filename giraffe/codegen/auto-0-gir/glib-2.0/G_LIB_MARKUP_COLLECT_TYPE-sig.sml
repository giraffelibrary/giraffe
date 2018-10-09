signature G_LIB_MARKUP_COLLECT_TYPE =
  sig
    include FLAGS
    val INVALID : t
    val STRING : t
    val STRDUP : t
    val BOOLEAN : t
    val TRISTATE : t
    val OPTIONAL : t
  end
