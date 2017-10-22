structure GLibRegexMatchFlags :> G_LIB_REGEX_MATCH_FLAGS =
  struct
    val ANCHORED = 0w16
    val NOTBOL = 0w128
    val NOTEOL = 0w256
    val NOTEMPTY = 0w1024
    val PARTIAL = 0w32768
    val NEWLINE_CR = 0w1048576
    val NEWLINE_LF = 0w2097152
    val NEWLINE_CRLF = 0w3145728
    val NEWLINE_ANY = 0w4194304
    val NEWLINE_ANYCRLF = 0w5242880
    val BSR_ANYCRLF = 0w8388608
    val BSR_ANY = 0w16777216
    val PARTIAL_SOFT = 0w32768
    val PARTIAL_HARD = 0w134217728
    val NOTEMPTY_ATSTART = 0w268435456
    val allFlags =
      [
        ANCHORED,
        NOTBOL,
        NOTEOL,
        NOTEMPTY,
        PARTIAL,
        NEWLINE_CR,
        NEWLINE_LF,
        NEWLINE_CRLF,
        NEWLINE_ANY,
        NEWLINE_ANYCRLF,
        BSR_ANYCRLF,
        BSR_ANY,
        PARTIAL_SOFT,
        PARTIAL_HARD,
        NOTEMPTY_ATSTART
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
