structure Vte : VTE =
  struct
    local
      open PolyMLFFI
    in
      val getUserShell_ = call (getSymbol "vte_get_user_shell") (cVoid --> Utf8.PolyML.cOutPtr)
    end
    structure PtyClass = VtePtyClass
    structure PtyError = VtePtyError
    exception PtyError = VtePtyError
    structure PtyFlags = VtePtyFlags
    structure TerminalClass = VteTerminalClass
    structure TerminalAntiAlias = VteTerminalAntiAlias
    structure TerminalCursorBlinkMode = VteTerminalCursorBlinkMode
    structure TerminalCursorShape = VteTerminalCursorShape
    structure TerminalEraseBinding = VteTerminalEraseBinding
    structure TerminalWriteFlags = VteTerminalWriteFlags
    structure Pty = VtePty
    structure Terminal = VteTerminal
    val SPAWN_NO_PARENT_ENVV = 33554432
    fun getUserShell () = (I ---> Utf8.FFI.fromPtr 1) getUserShell_ ()
  end
