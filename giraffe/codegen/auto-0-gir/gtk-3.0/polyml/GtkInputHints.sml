structure GtkInputHints :> GTK_INPUT_HINTS =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val SPELLCHECK = 0w1
    val NO_SPELLCHECK = 0w2
    val WORD_COMPLETION = 0w4
    val LOWERCASE = 0w8
    val UPPERCASE_CHARS = 0w16
    val UPPERCASE_WORDS = 0w32
    val UPPERCASE_SENTENCES = 0w64
    val INHIBIT_OSK = 0w128
    val VERTICAL_WRITING = 0w256
    val allFlags =
      [
        NONE,
        SPELLCHECK,
        NO_SPELLCHECK,
        WORD_COMPLETION,
        LOWERCASE,
        UPPERCASE_CHARS,
        UPPERCASE_WORDS,
        UPPERCASE_SENTENCES,
        INHIBIT_OSK,
        VERTICAL_WRITING
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_input_hints_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
