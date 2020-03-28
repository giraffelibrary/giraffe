signature VTE =
  sig
    structure CursorBlinkMode : VTE_CURSOR_BLINK_MODE
    structure CursorShape : VTE_CURSOR_SHAPE
    structure EraseBinding : VTE_ERASE_BINDING
    structure PtyClass : VTE_PTY_CLASS
    structure PtyError : VTE_PTY_ERROR
    exception PtyError of PtyError.t
    structure PtyFlags : VTE_PTY_FLAGS
    structure RegexRecord : VTE_REGEX_RECORD
    structure RegexError : VTE_REGEX_ERROR
    exception RegexError of RegexError.t
    structure TerminalClass : VTE_TERMINAL_CLASS
    structure WriteFlags : VTE_WRITE_FLAGS
    structure Pty :
      VTE_PTY
        where type 'a class = 'a PtyClass.class
        where type pty_flags_t = PtyFlags.t
    structure Regex :
      VTE_REGEX
        where type t = RegexRecord.t
    structure RegexRecordCArrayN :
      C_ARRAY
        where type elem = RegexRecord.t
    structure Terminal :
      VTE_TERMINAL
        where type 'a class = 'a TerminalClass.class
        where type regex_record_c_array_n_t = RegexRecordCArrayN.t
        where type pty_flags_t = PtyFlags.t
        where type regex_t = RegexRecord.t
        where type write_flags_t = WriteFlags.t
        where type cursor_blink_mode_t = CursorBlinkMode.t
        where type cursor_shape_t = CursorShape.t
        where type erase_binding_t = EraseBinding.t
        where type 'a pty_class = 'a PtyClass.class
    val MAJOR_VERSION : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val REGEX_FLAGS_DEFAULT : LargeInt.int
    val SPAWN_NO_PARENT_ENVV : LargeInt.int
    val getFeatures : unit -> string
    val getMajorVersion : unit -> LargeInt.int
    val getMicroVersion : unit -> LargeInt.int
    val getMinorVersion : unit -> LargeInt.int
    val getUserShell : unit -> string
    val regexErrorQuark : unit -> LargeInt.int
  end
