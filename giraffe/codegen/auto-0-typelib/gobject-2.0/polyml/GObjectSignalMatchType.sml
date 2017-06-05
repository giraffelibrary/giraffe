structure GObjectSignalMatchType :> G_OBJECT_SIGNAL_MATCH_TYPE =
  struct
    val ID = 0w1
    val DETAIL = 0w2
    val CLOSURE = 0w4
    val FUNC = 0w8
    val DATA = 0w16
    val UNBLOCKED = 0w32
    val allFlags =
      [
        ID,
        DETAIL,
        CLOSURE,
        FUNC,
        DATA,
        UNBLOCKED
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
