structure Vte : VTE =
  struct
    val getUserShell_ = _import "vte_get_user_shell" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
