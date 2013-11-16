structure GLib : G_LIB =
  struct
    local
      open PolyMLFFI
    in
      val checkVersion_ =
        call (load_sym libglib "glib_check_version")
          (
            FFI.UInt.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             --> FFI.String.PolyML.RETPTR
          )
      val childWatchAdd_ =
        call (load_sym libgiraffeglib "giraffe_g_child_watch_add")
          (
            FFI.Int.PolyML.VAL
             &&> Pid.PolyML.VAL
             &&> GLibChildWatchFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.VAL
          )
      val childWatchSourceNew_ = call (load_sym libgiraffeglib "giraffe_g_child_watch_source_new") (Pid.PolyML.VAL &&> GLibChildWatchFunc.PolyML.CALLBACK --> GLibSourceRecord.PolyML.PTR)
      val filenameFromUri_ =
        call (load_sym libglib "g_filename_from_uri")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val filenameToUri_ =
        call (load_sym libglib "g_filename_to_uri")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.String.PolyML.RETPTR
          )
      val idleAdd_ = call (load_sym libgiraffeglib "giraffe_g_idle_add") (FFI.Int.PolyML.VAL &&> GLibSourceFunc.PolyML.CALLBACK --> FFI.UInt.PolyML.VAL)
      val ioAddWatch_ =
        call
          (load_sym libgiraffeglib "giraffe_g_io_add_watch")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> GLibIOCondition.PolyML.VAL
             &&> GLibIOFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.VAL
          )
      val ioCreateWatch_ = call (load_sym libglib "g_io_create_watch") (GLibIOChannelRecord.PolyML.PTR &&> GLibIOCondition.PolyML.VAL --> GLibSourceRecord.PolyML.PTR)
      val logDefaultHandler_ =
        call (load_sym libglib "g_log_default_handler")
          (
            FFI.String.PolyML.INPTR
             &&> GLibLogLevelFlags.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val logRemoveHandler_ = call (load_sym libglib "g_log_remove_handler") (FFI.String.PolyML.INPTR &&> FFI.UInt.PolyML.VAL --> FFI.PolyML.VOID)
      val logSetAlwaysFatal_ = call (load_sym libglib "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.VAL --> GLibLogLevelFlags.PolyML.VAL)
      val logSetFatalMask_ = call (load_sym libglib "g_log_set_fatal_mask") (FFI.String.PolyML.INPTR &&> GLibLogLevelFlags.PolyML.VAL --> GLibLogLevelFlags.PolyML.VAL)
      val mainContextDefault_ = call (load_sym libglib "g_main_context_default") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
      val mainContextGetThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
      val mainCurrentSource_ = call (load_sym libglib "g_main_current_source") (FFI.PolyML.VOID --> GLibSourceRecord.PolyML.PTR)
      val mainDepth_ = call (load_sym libglib "g_main_depth") (FFI.PolyML.VOID --> FFI.Int.PolyML.VAL)
      val regexMatchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibRegexCompileFlags.PolyML.VAL
             &&> GLibRegexMatchFlags.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val shellParseArgv_ =
        call
          (load_sym libglib "g_shell_parse_argv")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.OptPointer.PolyML.VAL
             &&> FFI.StringVector.PolyML.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val shellQuote_ = call (load_sym libglib "g_shell_quote") (FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val shellUnquote_ = call (load_sym libglib "g_shell_unquote") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.String.PolyML.RETPTR)
      val sourceRemove_ = call (load_sym libglib "g_source_remove") (FFI.UInt.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val spawnAsyncWithPipes_ =
        call
          (load_sym libgiraffeglib "giraffe_g_spawn_async_with_pipes")
          (
            FFI.String.PolyML.INOPTPTR
             &&> FFI.StringVector.PolyML.INPTR
             &&> FFI.StringVector.PolyML.INOPTPTR
             &&> GLibSpawnFlags.PolyML.VAL
             &&> GLibSpawnChildSetupFunc.PolyML.CALLBACK
             &&> Pid.PolyML.REF
             &&> FileDesc.PolyML.REF
             &&> FileDesc.PolyML.REF
             &&> FileDesc.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val spawnClosePid_ = call (load_sym libglib "g_spawn_close_pid") (Pid.PolyML.VAL --> FFI.PolyML.VOID)
      val spawnCommandLineAsync_ = call (load_sym libglib "g_spawn_command_line_async") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.Bool.PolyML.VAL)
      val timeoutAdd_ =
        call
          (load_sym libgiraffeglib "giraffe_g_timeout_add")
          (
            FFI.Int.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             &&> GLibSourceFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.VAL
          )
      val timeoutAddSeconds_ =
        call
          (load_sym libgiraffeglib "giraffe_g_timeout_add_seconds")
          (
            FFI.Int.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             &&> GLibSourceFunc.PolyML.CALLBACK
             --> FFI.UInt.PolyML.VAL
          )
      val uriEscapeString_ =
        call (load_sym libglib "g_uri_escape_string")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.String.PolyML.RETPTR
          )
      val uriParseScheme_ = call (load_sym libglib "g_uri_parse_scheme") (FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val uriUnescapeSegment_ =
        call (load_sym libglib "g_uri_unescape_segment")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.String.PolyML.RETPTR
          )
      val uriUnescapeString_ = call (load_sym libglib "g_uri_unescape_string") (FFI.String.PolyML.INPTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
    end
    structure SourceFunc = GLibSourceFunc
    structure ChildWatchFunc = GLibChildWatchFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure Quark = GLibQuark
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
