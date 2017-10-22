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
        where type 'a class = 'a PtyClass.class
        where type pty_flags_t = PtyFlags.t
    structure Terminal :
      VTE_TERMINAL
        where type 'a class = 'a TerminalClass.class
        where type pty_flags_t = PtyFlags.t
        where type terminal_write_flags_t = TerminalWriteFlags.t
        where type terminal_cursor_blink_mode_t = TerminalCursorBlinkMode.t
        where type terminal_cursor_shape_t = TerminalCursorShape.t
        where type terminal_erase_binding_t = TerminalEraseBinding.t
        where type 'a pty_class = 'a PtyClass.class
    val SPAWN_NO_PARENT_ENVV : LargeInt.int
    val getUserShell : unit -> string
  end
