structure GLibKeyFileFlags :> G_LIB_KEY_FILE_FLAGS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val KEEP_COMMENTS = 0w1
    val KEEP_TRANSLATIONS = 0w2
    val allFlags =
      [
        NONE,
        KEEP_COMMENTS,
        KEEP_TRANSLATIONS
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
  end
