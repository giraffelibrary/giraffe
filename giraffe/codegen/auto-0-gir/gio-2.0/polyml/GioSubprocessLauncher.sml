structure GioSubprocessLauncher :>
  GIO_SUBPROCESS_LAUNCHER
    where type 'a class = 'a GioSubprocessLauncherClass.class
    where type 'a subprocess_class = 'a GioSubprocessClass.class
    where type subprocess_flags_t = GioSubprocessFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_subprocess_launcher_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_subprocess_launcher_new") (GioSubprocessFlags.PolyML.cVal --> GioSubprocessLauncherClass.PolyML.cPtr)
      val getenv_ = call (getSymbol "g_subprocess_launcher_getenv") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val setCwd_ = call (getSymbol "g_subprocess_launcher_set_cwd") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setEnviron_ = call (getSymbol "g_subprocess_launcher_set_environ") (GioSubprocessLauncherClass.PolyML.cPtr &&> Utf8CPtrArray.PolyML.cInPtr --> cVoid)
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
             &&> Utf8CPtrArray.PolyML.cInPtr
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
    fun getenv self variable = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getenv_ (self & variable)
    fun setCwd self cwd = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setCwd_ (self & cwd)
    fun setEnviron self env = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withPtr 0 ---> I) setEnviron_ (self & env)
    fun setFlags self flags = (GioSubprocessLauncherClass.FFI.withPtr false &&&> GioSubprocessFlags.FFI.withVal ---> I) setFlags_ (self & flags)
    fun setStderrFilePath self path = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setStderrFilePath_ (self & path)
    fun setStdinFilePath self path = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setStdinFilePath_ (self & path)
    fun setStdoutFilePath self path = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setStdoutFilePath_ (self & path)
    fun setenv
      self
      (
        variable,
        value,
        overwrite
      ) =
      (
        GioSubprocessLauncherClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        GioSubprocessLauncherClass.FFI.withPtr false
         &&&> Utf8CPtrArray.FFI.withPtr 0
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
        GioSubprocessLauncherClass.FFI.withPtr false
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
    fun takeStderrFd self fd = (GioSubprocessLauncherClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) takeStderrFd_ (self & fd)
    fun takeStdinFd self fd = (GioSubprocessLauncherClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) takeStdinFd_ (self & fd)
    fun takeStdoutFd self fd = (GioSubprocessLauncherClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) takeStdoutFd_ (self & fd)
    fun unsetenv self variable = (GioSubprocessLauncherClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unsetenv_ (self & variable)
    local
      open ValueAccessor
    in
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype GioSubprocessFlags.t (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GioSubprocessFlags.t x
        }
    end
  end
