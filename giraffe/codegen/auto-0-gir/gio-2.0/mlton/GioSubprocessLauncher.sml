structure GioSubprocessLauncher :>
  GIO_SUBPROCESS_LAUNCHER
    where type 'a class = 'a GioSubprocessLauncherClass.class
    where type 'a subprocess_class = 'a GioSubprocessClass.class
    where type subprocess_flags_t = GioSubprocessFlags.t =
  struct
    val getType_ = _import "g_subprocess_launcher_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_subprocess_launcher_new" : GioSubprocessFlags.FFI.val_ -> GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p;
    val getenv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_getenv" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val setCwd_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_set_cwd" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEnviron_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_set_environ" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFlags_ = fn x1 & x2 => (_import "g_subprocess_launcher_set_flags" : GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p * GioSubprocessFlags.FFI.val_ -> unit;) (x1, x2)
    val setStderrFilePath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_set_stderr_file_path" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStdinFilePath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_set_stdin_file_path" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStdoutFilePath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_set_stdout_file_path" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setenv_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_subprocess_launcher_setenv" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val spawnv_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_subprocess_launcher_spawnv" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioSubprocessClass.FFI.non_opt GioSubprocessClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val takeFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_subprocess_launcher_take_fd" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val takeStderrFd_ = fn x1 & x2 => (_import "g_subprocess_launcher_take_stderr_fd" : GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val takeStdinFd_ = fn x1 & x2 => (_import "g_subprocess_launcher_take_stdin_fd" : GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val takeStdoutFd_ = fn x1 & x2 => (_import "g_subprocess_launcher_take_stdout_fd" : GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val unsetenv_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_subprocess_launcher_unsetenv" :
              GioSubprocessLauncherClass.FFI.non_opt GioSubprocessLauncherClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
