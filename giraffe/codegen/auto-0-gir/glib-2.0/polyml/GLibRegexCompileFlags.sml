structure GLibRegexCompileFlags :> G_LIB_REGEX_COMPILE_FLAGS =
  struct
    val CASELESS = 0w1
    val MULTILINE = 0w2
    val DOTALL = 0w4
    val EXTENDED = 0w8
    val ANCHORED = 0w16
    val DOLLAR_ENDONLY = 0w32
    val UNGREEDY = 0w512
    val RAW = 0w2048
    val NO_AUTO_CAPTURE = 0w4096
    val OPTIMIZE = 0w8192
    val FIRSTLINE = 0w262144
    val DUPNAMES = 0w524288
    val NEWLINE_CR = 0w1048576
    val NEWLINE_LF = 0w2097152
    val NEWLINE_CRLF = 0w3145728
    val NEWLINE_ANYCRLF = 0w5242880
    val BSR_ANYCRLF = 0w8388608
    val JAVASCRIPT_COMPAT = 0w33554432
    val allFlags =
      [
        CASELESS,
        MULTILINE,
        DOTALL,
        EXTENDED,
        ANCHORED,
        DOLLAR_ENDONLY,
        UNGREEDY,
        RAW,
        NO_AUTO_CAPTURE,
        OPTIMIZE,
        FIRSTLINE,
        DUPNAMES,
        NEWLINE_CR,
        NEWLINE_LF,
        NEWLINE_CRLF,
        NEWLINE_ANYCRLF,
        BSR_ANYCRLF,
        JAVASCRIPT_COMPAT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
