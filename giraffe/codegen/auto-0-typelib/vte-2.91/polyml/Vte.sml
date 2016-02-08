structure Vte : VTE =
  struct
    local
      open PolyMLFFI
    in
      val getMajorVersion_ = call (load_sym libvte "vte_get_major_version") (FFI.PolyML.VOID --> FFI.UInt32.PolyML.VAL)
      val getMicroVersion_ = call (load_sym libvte "vte_get_micro_version") (FFI.PolyML.VOID --> FFI.UInt32.PolyML.VAL)
      val getMinorVersion_ = call (load_sym libvte "vte_get_minor_version") (FFI.PolyML.VOID --> FFI.UInt32.PolyML.VAL)
      val getUserShell_ = call (load_sym libvte "vte_get_user_shell") (FFI.PolyML.VOID --> Utf8.PolyML.RETPTR)
    end
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
    fun getMajorVersion () = (I ---> FFI.UInt32.C.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> FFI.UInt32.C.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> FFI.UInt32.C.fromVal) getMinorVersion_ ()
    fun getUserShell () = (I ---> Utf8.C.fromPtr true) getUserShell_ ()
  end
