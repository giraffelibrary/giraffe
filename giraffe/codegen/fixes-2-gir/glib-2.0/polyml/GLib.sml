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
    local
      open PolyMLFFI
    in
      val base64Decode_ = call (getSymbol "g_base64_decode") (Utf8.PolyML.cInPtr &&> GSize.PolyML.cRef --> GUInt8CVectorN.PolyML.cOutPtr)
      val base64Encode_ = call (getSymbol "g_base64_encode") (GUInt8CVectorN.PolyML.cInPtr &&> GSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val buildFilenamev_ = call (getSymbol "g_build_filenamev") (Utf8CVector.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val buildPathv_ = call (getSymbol "g_build_pathv") (Utf8.PolyML.cInPtr &&> Utf8CVector.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val chdir_ = call (getSymbol "g_chdir") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val checkVersion_ =
        call (getSymbol "glib_check_version")
          (
            GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val childWatchAdd_ =
        call (getSymbol "giraffe_g_child_watch_add")
          (
            GInt.PolyML.cVal
             &&> GLibPid.PolyML.cVal
             &&> GLibChildWatchFunc.PolyML.CALLBACK
             --> GUInt.PolyML.cVal
          )
      val childWatchSourceNew_ = call (getSymbol "giraffe_g_child_watch_source_new") (GLibPid.PolyML.cVal &&> GLibChildWatchFunc.PolyML.CALLBACK --> GLibSourceRecord.PolyML.cPtr)
      val filenameFromUri_ =
        call (getSymbol "g_filename_from_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameToUri_ =
        call (getSymbol "g_filename_to_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val getApplicationName_ = call (getSymbol "g_get_application_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentDir_ = call (getSymbol "g_get_current_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentTime_ = call (getSymbol "g_get_current_time") (GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val getEnviron_ = call (getSymbol "g_get_environ") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getHomeDir_ = call (getSymbol "g_get_home_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getHostName_ = call (getSymbol "g_get_host_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getLanguageNames_ = call (getSymbol "g_get_language_names") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getLocaleVariants_ = call (getSymbol "g_get_locale_variants") (Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val getMonotonicTime_ = call (getSymbol "g_get_monotonic_time") (cVoid --> GInt64.PolyML.cVal)
      val getPrgname_ = call (getSymbol "g_get_prgname") (cVoid --> Utf8.PolyML.cOutPtr)
      val getRealName_ = call (getSymbol "g_get_real_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getRealTime_ = call (getSymbol "g_get_real_time") (cVoid --> GInt64.PolyML.cVal)
      val getSystemConfigDirs_ = call (getSymbol "g_get_system_config_dirs") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getSystemDataDirs_ = call (getSymbol "g_get_system_data_dirs") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getTmpDir_ = call (getSymbol "g_get_tmp_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserCacheDir_ = call (getSymbol "g_get_user_cache_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserConfigDir_ = call (getSymbol "g_get_user_config_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserDataDir_ = call (getSymbol "g_get_user_data_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserName_ = call (getSymbol "g_get_user_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserRuntimeDir_ = call (getSymbol "g_get_user_runtime_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserSpecialDir_ = call (getSymbol "g_get_user_special_dir") (GLibUserDirectory.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getenv_ = call (getSymbol "g_getenv") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val idleAdd_ = call (getSymbol "giraffe_g_idle_add") (GInt.PolyML.cVal &&> GLibSourceFunc.PolyML.CALLBACK --> GUInt.PolyML.cVal)
      val ioAddWatch_ =
        call
          (getSymbol "giraffe_g_io_add_watch")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibIOCondition.PolyML.cVal
             &&> GLibIOFunc.PolyML.CALLBACK
             --> GUInt.PolyML.cVal
          )
      val ioCreateWatch_ = call (getSymbol "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val logDefaultHandler_ =
        call (getSymbol "g_log_default_handler")
          (
            Utf8.PolyML.cInPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val logRemoveHandler_ = call (getSymbol "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> GUInt.PolyML.cVal --> cVoid)
      val logSetAlwaysFatal_ = call (getSymbol "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (getSymbol "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val mainCurrentSource_ = call (getSymbol "g_main_current_source") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (getSymbol "g_main_depth") (cVoid --> GInt.PolyML.cVal)
      val shellParseArgv_ =
        call (getSymbol "g_shell_parse_argv")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cRef
             &&> Utf8CVectorN.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shellQuote_ = call (getSymbol "g_shell_quote") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val shellUnquote_ = call (getSymbol "g_shell_unquote") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val spawnAsyncWithPipes_ =
        call
          (getSymbol "giraffe_g_spawn_async_with_pipes")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8CVector.PolyML.cInPtr
             &&> Utf8CVector.PolyML.cInOptPtr
             &&> GLibSpawnFlags.PolyML.cVal
             &&> GLibSpawnChildSetupFunc.PolyML.CALLBACK
             &&> GLibPid.PolyML.cRef
             &&> FileDesc.PolyML.cRef
             &&> FileDesc.PolyML.cRef
             &&> FileDesc.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val spawnClosePid_ = call (getSymbol "g_spawn_close_pid") (GLibPid.PolyML.cVal --> cVoid)
      val spawnCommandLineAsync_ = call (getSymbol "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val timeoutAdd_ =
        call
          (getSymbol "giraffe_g_timeout_add")
          (
            GInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.CALLBACK
             --> GUInt.PolyML.cVal
          )
      val timeoutAddSeconds_ =
        call
          (getSymbol "giraffe_g_timeout_add_seconds")
          (
            GInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.CALLBACK
             --> GUInt.PolyML.cVal
          )
      val uriEscapeString_ =
        call (getSymbol "g_uri_escape_string")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val uriParseScheme_ = call (getSymbol "g_uri_parse_scheme") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val uriUnescapeSegment_ =
        call (getSymbol "g_uri_unescape_segment")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val uriUnescapeString_ = call (getSymbol "g_uri_unescape_string") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
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
