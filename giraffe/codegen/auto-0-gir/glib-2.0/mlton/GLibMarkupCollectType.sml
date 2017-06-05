structure GLibMarkupCollectType :> G_LIB_MARKUP_COLLECT_TYPE =
  struct
    val INVALID = 0w0
    val STRING = 0w1
    val STRDUP = 0w2
    val BOOLEAN = 0w3
    val TRISTATE = 0w4
    val OPTIONAL = 0w65536
    val allFlags =
      [
        INVALID,
        STRING,
        STRDUP,
        BOOLEAN,
        TRISTATE,
        OPTIONAL
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
