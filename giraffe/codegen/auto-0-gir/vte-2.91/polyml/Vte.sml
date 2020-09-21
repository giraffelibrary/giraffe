structure Vte : VTE =
  struct
    local
      open PolyMLFFI
    in
      val getFeatures_ = call (getSymbol "vte_get_features") (cVoid --> Utf8.PolyML.cOutPtr)
      val getMajorVersion_ = call (getSymbol "vte_get_major_version") (cVoid --> GUInt.PolyML.cVal)
      val getMicroVersion_ = call (getSymbol "vte_get_micro_version") (cVoid --> GUInt.PolyML.cVal)
      val getMinorVersion_ = call (getSymbol "vte_get_minor_version") (cVoid --> GUInt.PolyML.cVal)
      val getUserShell_ = call (getSymbol "vte_get_user_shell") (cVoid --> Utf8.PolyML.cOutPtr)
    end
    structure CharAttributesRecord = VteCharAttributesRecord
    structure CursorBlinkMode = VteCursorBlinkMode
    structure CursorShape = VteCursorShape
    structure EraseBinding = VteEraseBinding
    structure PtyClass = VtePtyClass
    structure PtyError = VtePtyError
    exception PtyError = VtePtyError
    structure PtyFlags = VtePtyFlags
    structure RegexRecord = VteRegexRecord
    structure RegexError = VteRegexError
    exception RegexError = VteRegexError
    structure TerminalClass = VteTerminalClass
    structure WriteFlags = VteWriteFlags
    structure CharAttributes = VteCharAttributes
    structure Pty = VtePty
    structure Regex = VteRegex
    structure Terminal = VteTerminal
    val MAJOR_VERSION = 0
    val MICRO_VERSION = 3
    val MINOR_VERSION = 46
    val REGEX_FLAGS_DEFAULT = 1075314688
    val SPAWN_NO_PARENT_ENVV = 33554432
    fun getFeatures () = (I ---> Utf8.FFI.fromPtr 0) getFeatures_ ()
    fun getMajorVersion () = (I ---> GUInt.FFI.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> GUInt.FFI.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> GUInt.FFI.fromVal) getMinorVersion_ ()
    fun getUserShell () = (I ---> Utf8.FFI.fromPtr ~1) getUserShell_ ()
  end
