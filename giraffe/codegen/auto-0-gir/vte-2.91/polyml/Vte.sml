structure Vte : VTE =
  struct
    local
      open PolyMLFFI
    in
      val getMajorVersion_ = call (load_sym libvte "vte_get_major_version") (PolyMLFFI.cVoid --> FFI.UInt.PolyML.cVal)
      val getMicroVersion_ = call (load_sym libvte "vte_get_micro_version") (PolyMLFFI.cVoid --> FFI.UInt.PolyML.cVal)
      val getMinorVersion_ = call (load_sym libvte "vte_get_minor_version") (PolyMLFFI.cVoid --> FFI.UInt.PolyML.cVal)
      val getUserShell_ = call (load_sym libvte "vte_get_user_shell") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
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
    fun getMajorVersion () = (I ---> FFI.UInt.C.fromVal) getMajorVersion_ ()
    fun getMicroVersion () = (I ---> FFI.UInt.C.fromVal) getMicroVersion_ ()
    fun getMinorVersion () = (I ---> FFI.UInt.C.fromVal) getMinorVersion_ ()
    fun getUserShell () = (I ---> Utf8.C.fromPtr true) getUserShell_ ()
  end
