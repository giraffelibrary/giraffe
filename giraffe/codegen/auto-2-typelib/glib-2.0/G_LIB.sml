signature G_LIB =
  sig
    structure Quark : G_LIB_QUARK
    structure Pid : G_LIB_PID
    structure SourceFunc : G_LIB_SOURCE_FUNC
    structure SpawnChildSetupFunc : G_LIB_SPAWN_CHILD_SETUP_FUNC
    structure IOChannelRecord : G_LIB_I_O_CHANNEL_RECORD
    structure IOCondition : G_LIB_I_O_CONDITION
    structure IOError : G_LIB_I_O_ERROR
    structure IOFlags : G_LIB_I_O_FLAGS
    structure IOStatus : G_LIB_I_O_STATUS
    structure KeyFileRecord : G_LIB_KEY_FILE_RECORD
    structure KeyFileFlags : G_LIB_KEY_FILE_FLAGS
    structure LogLevelFlags : G_LIB_LOG_LEVEL_FLAGS
    structure MainContextRecord : G_LIB_MAIN_CONTEXT_RECORD
    structure MatchInfoRecord : G_LIB_MATCH_INFO_RECORD
    structure RegexRecord : G_LIB_REGEX_RECORD
    structure RegexCompileFlags : G_LIB_REGEX_COMPILE_FLAGS
    structure RegexMatchFlags : G_LIB_REGEX_MATCH_FLAGS
    structure SeekType : G_LIB_SEEK_TYPE
    structure SourceRecord : G_LIB_SOURCE_RECORD
    structure SpawnFlags : G_LIB_SPAWN_FLAGS
    structure TimeValRecord : G_LIB_TIME_VAL_RECORD
    structure ChildWatchFunc :
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = Pid.t
    structure IOFunc :
      G_LIB_I_O_FUNC
        where type iochannelrecord_t = IOChannelRecord.t
        where type iocondition_t = IOCondition.t
    structure ErrorRecord : G_LIB_ERROR_RECORD
    exception Error of exn * ErrorRecord.t
    structure KeyFile :
      G_LIB_KEY_FILE
        where type record_t = KeyFileRecord.t
        where type keyfileflags_t = KeyFileFlags.t
    structure MatchInfo :
      G_LIB_MATCH_INFO
        where type record_t = MatchInfoRecord.t
        where type regexrecord_t = RegexRecord.t
    structure Regex :
      G_LIB_REGEX
        where type record_t = RegexRecord.t
        where type matchinforecord_t = MatchInfoRecord.t
        where type regexmatchflags_t = RegexMatchFlags.t
        where type regexcompileflags_t = RegexCompileFlags.t
    structure Source :
      G_LIB_SOURCE
        where type record_t = SourceRecord.t
        where type maincontextrecord_t = MainContextRecord.t
    structure TimeVal :
      G_LIB_TIME_VAL
        where type record_t = TimeValRecord.t
    structure Error :
      G_LIB_ERROR
        where type record_t = ErrorRecord.t
    structure IOChannelError :
      G_LIB_I_O_CHANNEL_ERROR
        where type errorrecord_handler = ErrorRecord.handler
    exception IOChannelError of IOChannelError.t
    structure KeyFileError :
      G_LIB_KEY_FILE_ERROR
        where type errorrecord_handler = ErrorRecord.handler
    exception KeyFileError of KeyFileError.t
    structure RegexError :
      G_LIB_REGEX_ERROR
        where type errorrecord_handler = ErrorRecord.handler
    exception RegexError of RegexError.t
    structure ShellError :
      G_LIB_SHELL_ERROR
        where type errorrecord_handler = ErrorRecord.handler
    exception ShellError of ShellError.t
    structure SpawnError :
      G_LIB_SPAWN_ERROR
        where type errorrecord_handler = ErrorRecord.handler
    exception SpawnError of SpawnError.t
    structure IOChannel :
      G_LIB_I_O_CHANNEL
        where type record_t = IOChannelRecord.t
        where type iocondition_t = IOCondition.t
        where type ioerror_t = IOError.t
        where type seektype_t = SeekType.t
        where type ioflags_t = IOFlags.t
        where type iostatus_t = IOStatus.t
        where type iochannelerror_t = IOChannelError.t
    val KEY_FILE_DESKTOP_GROUP : string
    val KEY_FILE_DESKTOP_KEY_CATEGORIES : string
    val KEY_FILE_DESKTOP_KEY_COMMENT : string
    val KEY_FILE_DESKTOP_KEY_EXEC : string
    val KEY_FILE_DESKTOP_KEY_GENERIC_NAME : string
    val KEY_FILE_DESKTOP_KEY_HIDDEN : string
    val KEY_FILE_DESKTOP_KEY_ICON : string
    val KEY_FILE_DESKTOP_KEY_MIME_TYPE : string
    val KEY_FILE_DESKTOP_KEY_NAME : string
    val KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN : string
    val KEY_FILE_DESKTOP_KEY_NO_DISPLAY : string
    val KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN : string
    val KEY_FILE_DESKTOP_KEY_PATH : string
    val KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY : string
    val KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS : string
    val KEY_FILE_DESKTOP_KEY_TERMINAL : string
    val KEY_FILE_DESKTOP_KEY_TRY_EXEC : string
    val KEY_FILE_DESKTOP_KEY_TYPE : string
    val KEY_FILE_DESKTOP_KEY_URL : string
    val KEY_FILE_DESKTOP_KEY_VERSION : string
    val KEY_FILE_DESKTOP_TYPE_APPLICATION : string
    val KEY_FILE_DESKTOP_TYPE_DIRECTORY : string
    val KEY_FILE_DESKTOP_TYPE_LINK : string
    val LOG_LEVEL_USER_SHIFT : LargeInt.int
    val MAJOR_VERSION : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val PRIORITY_DEFAULT : LargeInt.int
    val PRIORITY_DEFAULT_IDLE : LargeInt.int
    val PRIORITY_HIGH : LargeInt.int
    val PRIORITY_HIGH_IDLE : LargeInt.int
    val PRIORITY_LOW : LargeInt.int
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS : string
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS : string
    val checkVersion :
      LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val childWatchSourceNew :
      Pid.t
       -> ChildWatchFunc.t
       -> SourceRecord.t
    val childWatchAdd :
      LargeInt.int
       -> Pid.t
       -> ChildWatchFunc.t
       -> LargeInt.int
    val filenameFromUri :
      string
       -> string
       -> string
    val filenameToUri :
      string
       -> string option
       -> string
    val idleAdd : LargeInt.int -> SourceFunc.t -> LargeInt.int
    val ioAddWatch :
      IOChannelRecord.t
       -> LargeInt.int
       -> IOCondition.t
       -> IOFunc.t
       -> LargeInt.int
    val ioCreateWatch :
      IOChannelRecord.t
       -> IOCondition.t
       -> SourceRecord.t
    val logDefaultHandler :
      string
       -> LogLevelFlags.t
       -> string
       -> unit
    val logRemoveHandler :
      string
       -> LargeInt.int
       -> unit
    val logSetAlwaysFatal : LogLevelFlags.t -> LogLevelFlags.t
    val logSetFatalMask :
      string
       -> LogLevelFlags.t
       -> LogLevelFlags.t
    val mainContextDefault : unit -> MainContextRecord.t
    val mainContextGetThreadDefault : unit -> MainContextRecord.t
    val mainCurrentSource : unit -> SourceRecord.t
    val mainDepth : unit -> LargeInt.int
    val regexMatchSimple :
      string
       -> string
       -> RegexCompileFlags.t
       -> RegexMatchFlags.t
       -> bool
    val shellParseArgv : string -> string list
    val shellQuote : string -> string
    val shellUnquote : string -> string
    val sourceRemove : LargeInt.int -> bool
    val spawnAsyncWithPipes :
      string option
       -> string list
       -> string list option
       -> SpawnFlags.t
       -> SpawnChildSetupFunc.t
       -> Pid.t
           * FileDesc.t
           * FileDesc.t
           * FileDesc.t
    val spawnClosePid : Pid.t -> unit
    val spawnCommandLineAsync : string -> bool
    val timeoutAdd :
      LargeInt.int
       -> LargeInt.int
       -> SourceFunc.t
       -> LargeInt.int
    val timeoutAddSeconds :
      LargeInt.int
       -> LargeInt.int
       -> SourceFunc.t
       -> LargeInt.int
    val uriEscapeString :
      string
       -> string
       -> bool
       -> string
    val uriParseScheme : string -> string
    val uriUnescapeSegment :
      string
       -> string
       -> string
       -> string
    val uriUnescapeString :
      string
       -> string
       -> string
  end
