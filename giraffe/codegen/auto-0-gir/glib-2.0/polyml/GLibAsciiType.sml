structure GLibAsciiType :> G_LIB_ASCII_TYPE =
  struct
    val ALNUM = 0w1
    val ALPHA = 0w2
    val CNTRL = 0w4
    val DIGIT = 0w8
    val GRAPH = 0w16
    val LOWER = 0w32
    val PRINT = 0w64
    val PUNCT = 0w128
    val SPACE = 0w256
    val UPPER = 0w512
    val XDIGIT = 0w1024
    val allFlags =
      [
        ALNUM,
        ALPHA,
        CNTRL,
        DIGIT,
        GRAPH,
        LOWER,
        PRINT,
        PUNCT,
        SPACE,
        UPPER,
        XDIGIT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
