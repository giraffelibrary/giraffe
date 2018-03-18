structure GioSubprocessLauncher :>
  GIO_SUBPROCESS_LAUNCHER
    where type 'a class = 'a GioSubprocessLauncherClass.class
    where type 'a subprocess_class = 'a GioSubprocessClass.class
    where type subprocess_flags_t = GioSubprocessFlags.t =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_subprocess_launcher_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_subprocess_launcher_new") (GioSubprocessFlags.PolyML.cVal --> GioSubprocessLauncherClass.PolyML.cPtr)
      val getenv_ = call (getSymbol "g_subprocess_launcher_getenv") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val setCwd_ = call (getSymbol "g_subprocess_launcher_set_cwd") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setEnviron_ = call (getSymbol "g_subprocess_launcher_set_environ") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8CVector.PolyML.cInPtr --> cVoid)
      val setFlags_ = call (getSymbol "g_subprocess_launcher_set_flags") (GioSubprocessLauncherClass.PolyML.cPtr &&> GioSubprocessFlags.PolyML.cVal --> cVoid)
      val setStderrFilePath_ = call (getSymbol "g_subprocess_launcher_set_stderr_file_path") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setStdinFilePath_ = call (getSymbol "g_subprocess_launcher_set_stdin_file_path") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setStdoutFilePath_ = call (getSymbol "g_subprocess_launcher_set_stdout_file_path") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setenv_ =
        call (getSymbol "g_subprocess_launcher_setenv")
          (
            GioSubprocessLauncherClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val spawnv_ =
        call (getSymbol "g_subprocess_launcher_spawnv")
          (
            GioSubprocessLauncherClass.PolyML.cPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioSubprocessClass.PolyML.cPtr
          )
      val takeFd_ =
        call (getSymbol "g_subprocess_launcher_take_fd")
          (
            GioSubprocessLauncherClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val takeStderrFd_ = call (getSymbol "g_subprocess_launcher_take_stderr_fd") (GioSubprocessLauncherClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val takeStdinFd_ = call (getSymbol "g_subprocess_launcher_take_stdin_fd") (GioSubprocessLauncherClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val takeStdoutFd_ = call (getSymbol "g_subprocess_launcher_take_stdout_fd") (GioSubprocessLauncherClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val unsetenv_ = call (getSymbol "g_subprocess_launcher_unsetenv") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioSubprocessLauncherClass.class
    type 'a subprocess_class = 'a GioSubprocessClass.class
    type subprocess_flags_t = GioSubprocessFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new flags = (GioSubprocessFlags.FFI.withVal ---> GioSubprocessLauncherClass.FFI.fromPtr true) new_ flags
    fun getenv self variable = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getenv_ (self & variable)
    fun setCwd self cwd = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setCwd_ (self & cwd)
    fun setEnviron self env = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> I) setEnviron_ (self & env)
    fun setFlags self flags = (GioSubprocessLauncherClass.FFI.withPtr &&&> GioSubprocessFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setStderrFilePath self path = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStderrFilePath_ (self & path)
    fun setStdinFilePath self path = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setStdinFilePath_ (self & path)
    fun setStdoutFilePath self path = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setStdoutFilePath_ (self & path)
    fun setenv
      self
      (
        variable,
        value,
        overwrite
      ) =
      (
        GioSubprocessLauncherClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setenv_
        (
          self
           & variable
           & value
           & overwrite
        )
    fun spawnv self argv =
      (
        GioSubprocessLauncherClass.FFI.withPtr
         &&&> Utf8CVector.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioSubprocessClass.FFI.fromPtr true
      )
        spawnv_
        (
          self
           & argv
           & []
        )
    fun takeFd self (sourceFd, targetFd) =
      (
        GioSubprocessLauncherClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        takeFd_
        (
          self
           & sourceFd
           & targetFd
        )
    fun takeStderrFd self fd = (GioSubprocessLauncherClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) takeStderrFd_ (self & fd)
    fun takeStdinFd self fd = (GioSubprocessLauncherClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) takeStdinFd_ (self & fd)
    fun takeStdoutFd self fd = (GioSubprocessLauncherClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) takeStdoutFd_ (self & fd)
    fun unsetenv self variable = (GioSubprocessLauncherClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) unsetenv_ (self & variable)
    local
      open Property
    in
      val flagsProp = {new = fn x => new "flags" GioSubprocessFlags.t x}
    end
  end
