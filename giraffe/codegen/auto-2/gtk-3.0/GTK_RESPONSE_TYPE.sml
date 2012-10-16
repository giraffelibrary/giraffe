signature GTK_RESPONSE_TYPE =
  sig
    type t = LargeInt.int
    val NONE : t
    val REJECT : t
    val ACCEPT : t
    val DELETEEVENT : t
    val OK : t
    val CANCEL : t
    val CLOSE : t
    val YES : t
    val NO : t
    val APPLY : t
    val HELP : t
  end
