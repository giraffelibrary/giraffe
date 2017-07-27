structure GLib : G_LIB =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    val base64Decode_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_base64_decode" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               -> GUInt8CVectorN.FFI.notnull GUInt8CVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val base64Encode_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_base64_encode" :
              GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val buildFilenamev_ = _import "mlton_g_build_filenamev" : Utf8CVector.MLton.p1 * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val buildPathv_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_build_pathv" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val chdir_ = _import "mlton_g_chdir" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GInt.FFI.val_;
    val checkVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "glib_check_version" :
              GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val childWatchAdd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "giraffe_g_child_watch_add" :
              GInt.FFI.val_
               * GLibPid.FFI.val_
               * GLibChildWatchFunc.FFI.callback
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val childWatchSourceNew_ = fn x1 & x2 => (_import "giraffe_g_child_watch_source_new" : GLibPid.FFI.val_ * GLibChildWatchFunc.FFI.callback -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;) (x1, x2)
    val filenameFromUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_from_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val filenameToUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_to_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getApplicationName_ = _import "g_get_application_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCurrentDir_ = _import "g_get_current_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCurrentTime_ = _import "g_get_current_time" : GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> unit;
    val getEnviron_ = _import "g_get_environ" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getHomeDir_ = _import "g_get_home_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getHostName_ = _import "g_get_host_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLanguageNames_ = _import "g_get_language_names" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getLocaleVariants_ = _import "mlton_g_get_locale_variants" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getMonotonicTime_ = _import "g_get_monotonic_time" : unit -> GInt64.FFI.val_;
    val getPrgname_ = _import "g_get_prgname" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRealName_ = _import "g_get_real_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRealTime_ = _import "g_get_real_time" : unit -> GInt64.FFI.val_;
    val getSystemConfigDirs_ = _import "g_get_system_config_dirs" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getSystemDataDirs_ = _import "g_get_system_data_dirs" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getTmpDir_ = _import "g_get_tmp_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserCacheDir_ = _import "g_get_user_cache_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserConfigDir_ = _import "g_get_user_config_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserDataDir_ = _import "g_get_user_data_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserName_ = _import "g_get_user_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserRuntimeDir_ = _import "g_get_user_runtime_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserSpecialDir_ = _import "g_get_user_special_dir" : GLibUserDirectory.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getenv_ = _import "mlton_g_getenv" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val idleAdd_ = fn x1 & x2 => (_import "giraffe_g_idle_add" : GInt.FFI.val_ * GLibSourceFunc.FFI.callback -> GUInt.FFI.val_;) (x1, x2)
    val ioAddWatch_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "giraffe_g_io_add_watch" :
              GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p
               * GInt.FFI.val_
               * GLibIOCondition.FFI.val_
               * GLibIOFunc.FFI.callback
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val ioCreateWatch_ = fn x1 & x2 => (_import "g_io_create_watch" : GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p * GLibIOCondition.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;) (x1, x2)
    val logDefaultHandler_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_log_default_handler" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val logRemoveHandler_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_remove_handler" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val logSetAlwaysFatal_ = _import "g_log_set_always_fatal" : GLibLogLevelFlags.FFI.val_ -> GLibLogLevelFlags.FFI.val_;
    val logSetFatalMask_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_set_fatal_mask" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               -> GLibLogLevelFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mainCurrentSource_ = _import "g_main_current_source" : unit -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val mainDepth_ = _import "g_main_depth" : unit -> GInt.FFI.val_;
    val shellParseArgv_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_shell_parse_argv" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.ref_
               * Utf8CVectorN.MLton.r1
               * (unit, Utf8CVectorN.FFI.notnull) Utf8CVectorN.MLton.r2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val shellQuote_ = _import "mlton_g_shell_quote" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val shellUnquote_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_shell_unquote" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val spawnAsyncWithPipes_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13 =>
          (
            _import "giraffe_g_spawn_async_with_pipes" :
              Utf8.MLton.p1 * unit Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               * Utf8CVector.MLton.p1
               * unit Utf8CVector.MLton.p2
               * GLibSpawnFlags.FFI.val_
               * GLibSpawnChildSetupFunc.FFI.callback
               * GLibPid.FFI.ref_
               * FileDesc.FFI.ref_
               * FileDesc.FFI.ref_
               * FileDesc.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> bool;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12,
              x13
            )
    val spawnClosePid_ = _import "g_spawn_close_pid" : GLibPid.FFI.val_ -> unit;
    val spawnCommandLineAsync_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_spawn_command_line_async" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val timeoutAdd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "giraffe_g_timeout_add" :
              GInt.FFI.val_
               * GUInt.FFI.val_
               * GLibSourceFunc.FFI.callback
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val timeoutAddSeconds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "giraffe_g_timeout_add_seconds" :
              GInt.FFI.val_
               * GUInt.FFI.val_
               * GLibSourceFunc.FFI.callback
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val uriEscapeString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_uri_escape_string" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val uriParseScheme_ = _import "mlton_g_uri_parse_scheme" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val uriUnescapeSegment_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_uri_unescape_segment" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val uriUnescapeString_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_uri_unescape_string" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure DateDay = GLibDateDay
    structure DateYear = GLibDateYear
    structure Pid = GLibPid
    structure Quark = GLibQuark
    structure Time = GLibTime
    structure TimeSpan = GLibTimeSpan
    structure IOChannelRecord = GLibIOChannelRecord
    structure IOCondition = GLibIOCondition
    structure IOError = GLibIOError
    structure IOFlags = GLibIOFlags
    structure IOStatus = GLibIOStatus
    structure KeyFileRecord = GLibKeyFileRecord
    structure KeyFileFlags = GLibKeyFileFlags
    structure LogLevelFlags = GLibLogLevelFlags
    structure MainContextRecord = GLibMainContextRecord
    structure MatchInfoRecord = GLibMatchInfoRecord
    structure PollFDRecord = GLibPollFDRecord
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure StringRecord = GLibStringRecord
    structure TimeValRecord = GLibTimeValRecord
    structure UserDirectory = GLibUserDirectory
    structure VariantRecord = GLibVariantRecord
    structure VariantTypeRecord = GLibVariantTypeRecord
    structure ChildWatchFunc = GLibChildWatchFunc
    structure IOFunc = GLibIOFunc
    structure ErrorRecord = GLibErrorRecord
    structure KeyFile = GLibKeyFile
    structure MatchInfo = GLibMatchInfo
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure TimeVal = GLibTimeVal
    structure Error = GLibError
    exception Error = GLibError
    structure IOChannelError = GLibIOChannelError
    exception IOChannelError = GLibIOChannelError
    structure KeyFileError = GLibKeyFileError
    exception KeyFileError = GLibKeyFileError
    structure RegexError = GLibRegexError
    exception RegexError = GLibRegexError
    structure ShellError = GLibShellError
    exception ShellError = GLibShellError
    structure SpawnError = GLibSpawnError
    exception SpawnError = GLibSpawnError
    structure IOChannel = GLibIOChannel
    val KEY_FILE_DESKTOP_GROUP = "Desktop Entry"
    val KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories"
    val KEY_FILE_DESKTOP_KEY_COMMENT = "Comment"
    val KEY_FILE_DESKTOP_KEY_EXEC = "Exec"
    val KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName"
    val KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden"
    val KEY_FILE_DESKTOP_KEY_ICON = "Icon"
    val KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType"
    val KEY_FILE_DESKTOP_KEY_NAME = "Name"
    val KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn"
    val KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay"
    val KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn"
    val KEY_FILE_DESKTOP_KEY_PATH = "Path"
    val KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify"
    val KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass"
    val KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal"
    val KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec"
    val KEY_FILE_DESKTOP_KEY_TYPE = "Type"
    val KEY_FILE_DESKTOP_KEY_URL = "URL"
    val KEY_FILE_DESKTOP_KEY_VERSION = "Version"
    val KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application"
    val KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory"
    val KEY_FILE_DESKTOP_TYPE_LINK = "Link"
    val LOG_LEVEL_USER_SHIFT = 8
    val MAJOR_VERSION = 2
    val MICRO_VERSION = 90
    val MINOR_VERSION = 29
    val PRIORITY_DEFAULT = 0
    val PRIORITY_DEFAULT_IDLE = 200
    val PRIORITY_HIGH = ~100
    val PRIORITY_HIGH_IDLE = 100
    val PRIORITY_LOW = 300
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
    fun base64Decode text =
      let
        val outLen & retVal = (Utf8.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 1) base64Decode_ (text & GSize.null)
      in
        retVal (LargeInt.toInt outLen)
      end
    fun base64Encode data =
      let
        val len = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal = (GUInt8CVectorN.FFI.withPtr &&&> GSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) base64Encode_ (data & len)
      in
        retVal
      end
    fun buildFilenamev args = (Utf8CVector.FFI.withPtr ---> Utf8.FFI.fromPtr 1) buildFilenamev_ args
    fun buildPathv (separator, args) = (Utf8.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> Utf8.FFI.fromPtr 1) buildPathv_ (separator & args)
    fun chdir path = (Utf8.FFI.withPtr ---> GInt.FFI.fromVal) chdir_ path
    fun checkVersion
      (
        requiredMajor,
        requiredMinor,
        requiredMicro
      ) =
      (
        GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun childWatchAdd (priority, pid, function) =
      (
        GInt.FFI.withVal
         &&&> GLibPid.FFI.withVal
         &&&> GLibChildWatchFunc.FFI.withCallback
         ---> GUInt.FFI.fromVal
      )
        childWatchAdd_
        (
          priority
           & pid
           & function
        )
    fun childWatchSourceNew (pid, function) = (GLibPid.FFI.withVal &&&> GLibChildWatchFunc.FFI.withCallback ---> GLibSourceRecord.FFI.fromPtr true) childWatchSourceNew_ (pid & function)
    fun filenameFromUri (uri, hostname) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        filenameFromUri_
        (
          uri
           & hostname
           & []
        )
    fun filenameToUri (filename, hostname) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr 1
      )
        filenameToUri_
        (
          filename
           & hostname
           & []
        )
    fun getApplicationName () = (I ---> Utf8.FFI.fromPtr 0) getApplicationName_ ()
    fun getCurrentDir () = (I ---> Utf8.FFI.fromPtr 1) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.FFI.withPtr ---> I) getCurrentTime_ result
    fun getEnviron () = (I ---> Utf8CVector.FFI.fromPtr 2) getEnviron_ ()
    fun getHomeDir () = (I ---> Utf8.FFI.fromPtr 0) getHomeDir_ ()
    fun getHostName () = (I ---> Utf8.FFI.fromPtr 0) getHostName_ ()
    fun getLanguageNames () = (I ---> Utf8CVector.FFI.fromPtr 0) getLanguageNames_ ()
    fun getLocaleVariants locale = (Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getLocaleVariants_ locale
    fun getMonotonicTime () = (I ---> GInt64.FFI.fromVal) getMonotonicTime_ ()
    fun getPrgname () = (I ---> Utf8.FFI.fromPtr 1) getPrgname_ ()
    fun getRealName () = (I ---> Utf8.FFI.fromPtr 0) getRealName_ ()
    fun getRealTime () = (I ---> GInt64.FFI.fromVal) getRealTime_ ()
    fun getSystemConfigDirs () = (I ---> Utf8CVector.FFI.fromPtr 0) getSystemConfigDirs_ ()
    fun getSystemDataDirs () = (I ---> Utf8CVector.FFI.fromPtr 0) getSystemDataDirs_ ()
    fun getTmpDir () = (I ---> Utf8.FFI.fromPtr 0) getTmpDir_ ()
    fun getUserCacheDir () = (I ---> Utf8.FFI.fromPtr 0) getUserCacheDir_ ()
    fun getUserConfigDir () = (I ---> Utf8.FFI.fromPtr 0) getUserConfigDir_ ()
    fun getUserDataDir () = (I ---> Utf8.FFI.fromPtr 0) getUserDataDir_ ()
    fun getUserName () = (I ---> Utf8.FFI.fromPtr 0) getUserName_ ()
    fun getUserRuntimeDir () = (I ---> Utf8.FFI.fromPtr 0) getUserRuntimeDir_ ()
    fun getUserSpecialDir directory = (GLibUserDirectory.FFI.withVal ---> Utf8.FFI.fromPtr 0) getUserSpecialDir_ directory
    fun getenv variable = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getenv_ variable
    fun idleAdd (priority, function) = (GInt.FFI.withVal &&&> GLibSourceFunc.FFI.withCallback ---> GUInt.FFI.fromVal) idleAdd_ (priority & function)
    fun ioAddWatch (channel, priority, condition, func) =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibIOCondition.FFI.withVal
         &&&> GLibIOFunc.FFI.withCallback
         ---> GUInt.FFI.fromVal
      )
        ioAddWatch_
        (
          channel
           & priority
           & condition
           & func
        )
    fun ioCreateWatch (channel, condition) = (GLibIOChannelRecord.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) ioCreateWatch_ (channel & condition)
    fun logDefaultHandler (logDomain, logLevel, message) =
      (
        Utf8.FFI.withPtr
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        logDefaultHandler_
        (
          logDomain
           & logLevel
           & message
        )
    fun logRemoveHandler (logDomain, handlerId) = (Utf8.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask (logDomain, fatalMask) = (Utf8.FFI.withPtr &&&> GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainCurrentSource () = (I ---> GLibSourceRecord.FFI.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> GInt.FFI.fromVal) mainDepth_ ()
    fun shellParseArgv commandLine =
      let
        val argcp
         & argvp
         & _ =
          (
            Utf8.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> Utf8CVectorN.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal
                   && Utf8CVectorN.FFI.fromPtr 2
                   && GBool.FFI.fromVal
          )
            shellParseArgv_
            (
              commandLine
               & GInt.null
               & NONE
               & [GLibShellError.handler]
            )
      in
        argvp (LargeInt.toInt argcp)
      end
    fun shellQuote unquotedString = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr 1) shellUnquote_ (quotedString & [])
    fun spawnAsyncWithPipes (workingDirectory, argv, envp, flags, childSetup) =
      let
        val
          childPid
           & standardInput
           & standardOutput
           & standardError
           & _ =
          (
            Utf8.FFI.withOptPtr
             &&&> Utf8CVector.FFI.withPtr
             &&&> Utf8CVector.FFI.withOptPtr
             &&&> GLibSpawnFlags.FFI.withVal
             &&&> GLibSpawnChildSetupFunc.FFI.withOptCallback
             &&&> GLibPid.FFI.withRefVal
             &&&> FileDesc.FFI.withRefVal
             &&&> FileDesc.FFI.withRefVal
             &&&> FileDesc.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GLibPid.FFI.fromVal
                   && FileDesc.FFI.fromVal
                   && FileDesc.FFI.fromVal
                   && FileDesc.FFI.fromVal
                   && I
          )
            spawnAsyncWithPipes_
            (
              workingDirectory
               & argv
               & envp
               & flags
               & childSetup
               & GLibPid.null
               & FileDesc.null
               & FileDesc.null
               & FileDesc.null
               & [GLibSpawnError.handler]
            )
      in
        (childPid, standardInput, standardOutput, standardError)
      end
    fun spawnClosePid pid = (GLibPid.FFI.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun timeoutAdd (priority, interval, function) =
      (
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withCallback
         ---> GUInt.FFI.fromVal
      )
        timeoutAdd_
        (
          priority
           & interval
           & function
        )
    fun timeoutAddSeconds (priority, interval, function) =
      (
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withCallback
         ---> GUInt.FFI.fromVal
      )
        timeoutAddSeconds_
        (
          priority
           & interval
           & function
        )
    fun uriEscapeString
      (
        unescaped,
        reservedCharsAllowed,
        allowUtf8
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriParseScheme uri = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) uriParseScheme_ uri
    fun uriUnescapeSegment
      (
        escapedString,
        escapedStringEnd,
        illegalCharacters
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromPtr 1
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString (escapedString, illegalCharacters) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) uriUnescapeString_ (escapedString & illegalCharacters)
  end
