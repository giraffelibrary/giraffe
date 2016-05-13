structure Vte : VTE =
  struct
    local
      open PolyMLFFI
    in
      val getUserShell_ = call (load_sym libvte "vte_get_user_shell") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
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
    fun getUserShell () = (I ---> Utf8.C.fromPtr true) getUserShell_ ()
  end
