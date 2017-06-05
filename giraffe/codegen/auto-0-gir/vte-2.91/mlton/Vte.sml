structure Vte : VTE =
  struct
    val getMajorVersion_ = _import "vte_get_major_version" : unit -> GUInt.FFI.val_;
    val getMicroVersion_ = _import "vte_get_micro_version" : unit -> GUInt.FFI.val_;
    val getMinorVersion_ = _import "vte_get_minor_version" : unit -> GUInt.FFI.val_;
    val getUserShell_ = _import "vte_get_user_shell" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
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
    fun getMajorVersion () = (I ---> GUInt.FFI.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> GUInt.FFI.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> GUInt.FFI.fromVal) getMinorVersion_ ()
    fun getUserShell () = (I ---> Utf8.FFI.fromPtr 1) getUserShell_ ()
  end
