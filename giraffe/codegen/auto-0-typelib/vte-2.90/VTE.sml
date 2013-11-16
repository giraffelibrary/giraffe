signature VTE =
  sig
    structure PtyClass : VTE_PTY_CLASS
    structure PtyError : VTE_PTY_ERROR
    exception PtyError of PtyError.t
    structure PtyFlags : VTE_PTY_FLAGS
    structure TerminalClass : VTE_TERMINAL_CLASS
    structure TerminalAntiAlias : VTE_TERMINAL_ANTI_ALIAS
    structure TerminalCursorBlinkMode : VTE_TERMINAL_CURSOR_BLINK_MODE
    structure TerminalCursorShape : VTE_TERMINAL_CURSOR_SHAPE
    structure TerminalEraseBinding : VTE_TERMINAL_ERASE_BINDING
    structure TerminalWriteFlags : VTE_TERMINAL_WRITE_FLAGS
    structure Pty :
      VTE_PTY
        where type 'a class_t = 'a PtyClass.t
        where type ptyflags_t = PtyFlags.t
    structure Terminal :
      VTE_TERMINAL
        where type 'a class_t = 'a TerminalClass.t
        where type ptyflags_t = PtyFlags.t
        where type terminalwriteflags_t = TerminalWriteFlags.t
        where type terminalcursorblinkmode_t = TerminalCursorBlinkMode.t
        where type terminalcursorshape_t = TerminalCursorShape.t
        where type terminalerasebinding_t = TerminalEraseBinding.t
        where type 'a ptyclass_t = 'a PtyClass.t
    val getUserShell : unit -> string
  end
