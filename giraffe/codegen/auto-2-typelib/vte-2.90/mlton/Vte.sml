structure Vte : VTE =
  struct
    val getUserShell_ = _import "vte_get_user_shell" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
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
    fun getUserShell () = (I ---> FFI.String.C.fromPtr true) getUserShell_ ()
  end
