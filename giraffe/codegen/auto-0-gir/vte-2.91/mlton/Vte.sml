structure Vte : VTE =
  struct
    val getMajorVersion_ = _import "vte_get_major_version" : unit -> FFI.UInt.C.val_;
    val getMicroVersion_ = _import "vte_get_micro_version" : unit -> FFI.UInt.C.val_;
    val getMinorVersion_ = _import "vte_get_minor_version" : unit -> FFI.UInt.C.val_;
    val getUserShell_ = _import "vte_get_user_shell" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
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
    fun getMajorVersion () = (I ---> FFI.UInt.C.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> FFI.UInt.C.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> FFI.UInt.C.fromVal) getMinorVersion_ ()
    fun getUserShell () = (I ---> FFI.String.C.fromPtr true) getUserShell_ ()
  end
