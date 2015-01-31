signature VTE =
  sig
    structure CursorBlinkMode : VTE_CURSOR_BLINK_MODE
    structure CursorShape : VTE_CURSOR_SHAPE
    structure EraseBinding : VTE_ERASE_BINDING
    structure PtyClass : VTE_PTY_CLASS
    structure PtyError : VTE_PTY_ERROR
    exception PtyError of PtyError.t
    structure PtyFlags : VTE_PTY_FLAGS
    structure TerminalClass : VTE_TERMINAL_CLASS
    structure WriteFlags : VTE_WRITE_FLAGS
    structure Pty :
      VTE_PTY
        where type 'a class_t = 'a PtyClass.t
        where type ptyflags_t = PtyFlags.t
    structure Terminal :
      VTE_TERMINAL
        where type 'a class_t = 'a TerminalClass.t
        where type ptyflags_t = PtyFlags.t
        where type writeflags_t = WriteFlags.t
        where type cursorblinkmode_t = CursorBlinkMode.t
        where type cursorshape_t = CursorShape.t
        where type erasebinding_t = EraseBinding.t
        where type 'a ptyclass_t = 'a PtyClass.t
    val MAJOR_VERSION : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val SPAWN_NO_PARENT_ENVV : LargeInt.int
    val getMajorVersion : unit -> LargeInt.int
    val getMicroVersion : unit -> LargeInt.int
    val getMinorVersion : unit -> LargeInt.int
    val getUserShell : unit -> string
  end
