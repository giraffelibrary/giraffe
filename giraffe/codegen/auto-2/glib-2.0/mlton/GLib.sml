structure GLib : G_LIB =
  struct
    val checkVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "glib_check_version" :
              FFI.UInt.C.val_
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              FFI.Int.C.val_
               * Pid.C.val_
               * GLibChildWatchFunc.C.callback
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val childWatchSourceNew_ = fn x1 & x2 => (_import "giraffe_g_child_watch_source_new" : Pid.C.val_ * GLibChildWatchFunc.C.callback -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;) (x1, x2)
    val filenameFromUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_from_uri" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val idleAdd_ = fn x1 & x2 => (_import "giraffe_g_idle_add" : FFI.Int.C.val_ * GLibSourceFunc.C.callback -> FFI.UInt.C.val_;) (x1, x2)
    val ioAddWatch_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "giraffe_g_io_add_watch" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * FFI.Int.C.val_
               * GLibIOCondition.C.val_
               * GLibIOFunc.C.callback
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val ioCreateWatch_ = fn x1 & x2 => (_import "g_io_create_watch" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * GLibIOCondition.C.val_ -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;) (x1, x2)
    val logDefaultHandler_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_log_default_handler" :
              cstring
               * unit CPointer.t
               * GLibLogLevelFlags.C.val_
               * cstring
               * unit CPointer.t
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
              cstring
               * unit CPointer.t
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val logSetAlwaysFatal_ = _import "g_log_set_always_fatal" : GLibLogLevelFlags.C.val_ -> GLibLogLevelFlags.C.val_;
    val logSetFatalMask_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_set_fatal_mask" :
              cstring
               * unit CPointer.t
               * GLibLogLevelFlags.C.val_
               -> GLibLogLevelFlags.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mainContextDefault_ = _import "g_main_context_default" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val mainContextGetThreadDefault_ = _import "g_main_context_get_thread_default" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val mainCurrentSource_ = _import "g_main_current_source" : unit -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val mainDepth_ = _import "g_main_depth" : unit -> FFI.Int.C.val_;
    val regexMatchSimple_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_regex_match_simple" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GLibRegexCompileFlags.C.val_
               * GLibRegexMatchFlags.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val shellParseArgv_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5, x6)
         & x7 =>
          (
            _import "mlton_g_shell_parse_argv" :
              cstring * unit CPointer.t  (* GCharVec.C.in_p *)
              * FFI.OptPointer.C.val_
              * cstring vector * unit GCharVec.C.out_p array * unit CPointer.t ref  (* GCharVecVec.C.inout_r *)
              * (unit, unit) GLibErrorRecord.C.r
              -> bool;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val shellQuote_ = _import "mlton_g_shell_quote" : cstring * unit CPointer.t -> FFI.String.C.notnull FFI.String.C.out_p;
    val shellUnquote_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_shell_unquote" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val sourceRemove_ = _import "g_source_remove" : FFI.UInt.C.val_ -> FFI.Bool.C.val_;
    val spawnAsyncWithPipes_ =
      fn
        (x1, x2)
         & (x3, x4, x5)
         & (x6, x7, x8)
         & x9
         & x10
         & x11
         & x12
         & x13
         & x14
         & x15 =>
          (
            _import "giraffe_g_spawn_async_with_pipes" :
              cstring * unit CPointer.t  (* GCharVec.C.in_p *)
               * cstring vector * unit GCharVec.C.out_p array * unit CPointer.t  (* GCharVecVec.C.in_p *)
               * cstring vector * unit GCharVec.C.out_p array * unit CPointer.t  (* GCharVecVec.C.in_p *)
               * GLibSpawnFlags.C.val_
               * GLibSpawnChildSetupFunc.C.callback
               * Pid.C.ref_
               * FileDesc.C.ref_
               * FileDesc.C.ref_
               * FileDesc.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
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
              x13,
              x14,
              x15
            )
    val spawnClosePid_ = _import "g_spawn_close_pid" : Pid.C.val_ -> unit;
    val spawnCommandLineAsync_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_spawn_command_line_async" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              FFI.Int.C.val_
               * FFI.UInt.C.val_
               * GLibSourceFunc.C.callback
               -> FFI.UInt.C.val_;
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
              FFI.Int.C.val_
               * FFI.UInt.C.val_
               * GLibSourceFunc.C.callback
               -> FFI.UInt.C.val_;
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val uriParseScheme_ = _import "mlton_g_uri_parse_scheme" : cstring * unit CPointer.t -> FFI.String.C.notnull FFI.String.C.out_p;
    val uriUnescapeSegment_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_uri_unescape_segment" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    structure Quark = GLibQuark
    structure SourceFunc = GLibSourceFunc
    structure ChildWatchFunc = GLibChildWatchFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
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
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure TimeValRecord = GLibTimeValRecord
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
    fun checkVersion requiredMajor requiredMinor requiredMicro =
      (
        FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> FFI.String.C.fromPtr false
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun childWatchAdd priority pid function =
      (
        FFI.Int.C.withVal
         &&&> Pid.C.withVal
         &&&> GLibChildWatchFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        childWatchAdd_
        (
          priority
           & pid
           & function
        )
    fun childWatchSourceNew pid function = (Pid.C.withVal &&&> GLibChildWatchFunc.C.withCallback ---> GLibSourceRecord.C.fromPtr true) childWatchSourceNew_ (pid & function)
    fun filenameFromUri uri hostname =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        filenameFromUri_
        (
          uri
           & hostname
           & []
        )
    fun filenameToUri filename hostname =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        filenameToUri_
        (
          filename
           & hostname
           & []
        )
    fun idleAdd priority function = (FFI.Int.C.withVal &&&> GLibSourceFunc.C.withCallback ---> FFI.UInt.C.fromVal) idleAdd_ (priority & function)
    fun ioAddWatch channel priority condition func =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GLibIOCondition.C.withVal
         &&&> GLibIOFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        ioAddWatch_
        (
          channel
           & priority
           & condition
           & func
        )
    fun ioCreateWatch channel condition = (GLibIOChannelRecord.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibSourceRecord.C.fromPtr true) ioCreateWatch_ (channel & condition)
    fun logDefaultHandler logDomain logLevel message =
      (
        FFI.String.C.withConstPtr
         &&&> GLibLogLevelFlags.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        logDefaultHandler_
        (
          logDomain
           & logLevel
           & message
        )
    fun logRemoveHandler logDomain handlerId = (FFI.String.C.withConstPtr &&&> FFI.UInt.C.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask logDomain fatalMask = (FFI.String.C.withConstPtr &&&> GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainContextDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextDefault_ ()
    fun mainContextGetThreadDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextGetThreadDefault_ ()
    fun mainCurrentSource () = (I ---> GLibSourceRecord.C.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> FFI.Int.C.fromVal) mainDepth_ ()
    fun regexMatchSimple pattern string compileOptions matchOptions =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        regexMatchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
    fun shellParseArgv commandLine =
      let
        val argvp & _ =
          (
            FFI.String.C.withConstPtr
             &&&> FFI.OptPointer.C.withVal
             &&&> FFI.StringVector.C.withRefConstOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.StringVector.C.fromPtr true && I
          )
            shellParseArgv_
            (
              commandLine
               & CPointer.null
               & NONE
               & [GLibShellError.handler]
            )
      in
        argvp
      end
    fun shellQuote unquotedString = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) shellQuote_ unquotedString
    fun shellUnquote quotedString = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.C.fromPtr true) shellUnquote_ (quotedString & [])
    fun sourceRemove tag = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) sourceRemove_ tag
    fun spawnAsyncWithPipes workingDirectory argv envp flags childSetup =
      let
        val
          childPid
           & standardInput
           & standardOutput
           & standardError
           & _ =
          (
            FFI.String.C.withConstOptPtr
             &&&> FFI.StringVector.C.withConstPtr
             &&&> FFI.StringVector.C.withConstOptPtr
             &&&> GLibSpawnFlags.C.withVal
             &&&> GLibSpawnChildSetupFunc.C.withCallback
             &&&> Pid.C.withRefVal
             &&&> FileDesc.C.withRefVal
             &&&> FileDesc.C.withRefVal
             &&&> FileDesc.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> Pid.C.fromVal
                   && FileDesc.C.fromVal
                   && FileDesc.C.fromVal
                   && FileDesc.C.fromVal
                   && I
          )
            spawnAsyncWithPipes_
            (
              workingDirectory
               & argv
               & envp
               & flags
               & childSetup
               & Pid.null
               & FileDesc.null
               & FileDesc.null
               & FileDesc.null
               & [GLibSpawnError.handler]
            )
      in
        (childPid, standardInput, standardOutput, standardError)
      end
    fun spawnClosePid pid = (Pid.C.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun timeoutAdd priority interval function =
      (
        FFI.Int.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GLibSourceFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        timeoutAdd_
        (
          priority
           & interval
           & function
        )
    fun timeoutAddSeconds priority interval function =
      (
        FFI.Int.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GLibSourceFunc.C.withCallback
         ---> FFI.UInt.C.fromVal
      )
        timeoutAddSeconds_
        (
          priority
           & interval
           & function
        )
    fun uriEscapeString unescaped reservedCharsAllowed allowUtf8 =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriParseScheme uri = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) uriParseScheme_ uri
    fun uriUnescapeSegment escapedString escapedStringEnd illegalCharacters =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromPtr true
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString escapedString illegalCharacters = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) uriUnescapeString_ (escapedString & illegalCharacters)
  end
