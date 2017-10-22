structure GLibOptionFlags :> G_LIB_OPTION_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val HIDDEN = 0w1
    val IN_MAIN = 0w2
    val REVERSE = 0w4
    val NO_ARG = 0w8
    val FILENAME = 0w16
    val OPTIONAL_ARG = 0w32
    val NOALIAS = 0w64
    val allFlags =
      [
        NONE,
        HIDDEN,
        IN_MAIN,
        REVERSE,
        NO_ARG,
        FILENAME,
        OPTIONAL_ARG,
        NOALIAS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
