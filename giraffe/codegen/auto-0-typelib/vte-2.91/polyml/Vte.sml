structure Vte : VTE =
  struct
    local
      open PolyMLFFI
    in
      val getMajorVersion_ = call (getSymbol "vte_get_major_version") (PolyMLFFI.cVoid --> GUInt32.PolyML.cVal)
      val getMicroVersion_ = call (getSymbol "vte_get_micro_version") (PolyMLFFI.cVoid --> GUInt32.PolyML.cVal)
      val getMinorVersion_ = call (getSymbol "vte_get_minor_version") (PolyMLFFI.cVoid --> GUInt32.PolyML.cVal)
      val getUserShell_ = call (getSymbol "vte_get_user_shell") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
    end
    structure CursorBlinkMode = VteCursorBlinkMode
    structure CursorShape = VteCursorShape
    structure EraseBinding = VteEraseBinding
    structure PtyClass = VtePtyClass
    structure PtyError = VtePtyError
    exception PtyError = VtePtyError
    structure PtyFlags = VtePtyFlags
    structure TerminalClass = VteTerminalClass
    structure WriteFlags = VteWriteFlags
    structure Pty = VtePty
    structure Terminal = VteTerminal
    val MAJOR_VERSION = 0
    val MICRO_VERSION = 1
    val MINOR_VERSION = 39
    val SPAWN_NO_PARENT_ENVV = 33554432
    fun getMajorVersion () = (I ---> GUInt32.FFI.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> GUInt32.FFI.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> GUInt32.FFI.fromVal) getMinorVersion_ ()
    fun getUserShell () = (I ---> Utf8.FFI.fromPtr 1) getUserShell_ ()
  end
