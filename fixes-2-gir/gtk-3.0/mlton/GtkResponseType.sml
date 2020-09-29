structure GtkResponseType :> GTK_RESPONSE_TYPE =
  struct
    type t = LargeInt.int
    local
      fun NONE () = ~1
    in
      val NONE : t = NONE ()
    end
    val REJECT : t = ~2
    val ACCEPT : t = ~3
    val DELETE_EVENT : t = ~4
    val OK : t = ~5
    val CANCEL : t = ~6
    val CLOSE : t = ~7
    val YES : t = ~8
    val NO : t = ~9
    val APPLY : t = ~10
    val HELP : t = ~11
  end
