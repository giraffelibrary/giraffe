signature G_LIB =
  sig
    structure SourceFunc : G_LIB_SOURCE_FUNC
    structure SpawnChildSetupFunc : G_LIB_SPAWN_CHILD_SETUP_FUNC
    structure DateDay : G_LIB_DATE_DAY
    structure DateYear : G_LIB_DATE_YEAR
    structure Pid : G_LIB_PID
    structure Quark : G_LIB_QUARK
    structure Time : G_LIB_TIME
    structure TimeSpan : G_LIB_TIME_SPAN
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
    structure PollFDRecord : G_LIB_POLL_F_D_RECORD
    structure RegexRecord : G_LIB_REGEX_RECORD
    structure RegexCompileFlags : G_LIB_REGEX_COMPILE_FLAGS
    structure RegexMatchFlags : G_LIB_REGEX_MATCH_FLAGS
    structure SeekType : G_LIB_SEEK_TYPE
    structure SourceRecord : G_LIB_SOURCE_RECORD
    structure SpawnFlags : G_LIB_SPAWN_FLAGS
    structure StringRecord : G_LIB_STRING_RECORD
    structure TimeValRecord : G_LIB_TIME_VAL_RECORD
    structure UserDirectory : G_LIB_USER_DIRECTORY
    structure VariantRecord : G_LIB_VARIANT_RECORD
    structure VariantTypeRecord : G_LIB_VARIANT_TYPE_RECORD
    structure ChildWatchFunc :
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = Pid.t
    structure IOFunc :
      G_LIB_I_O_FUNC
        where type i_o_channel_t = IOChannelRecord.t
        where type i_o_condition_t = IOCondition.t
    structure ErrorRecord : G_LIB_ERROR_RECORD
    exception Error of exn * ErrorRecord.t
    structure KeyFile :
      G_LIB_KEY_FILE
        where type t = KeyFileRecord.t
        where type key_file_flags_t = KeyFileFlags.t
    structure MatchInfo :
      G_LIB_MATCH_INFO
        where type t = MatchInfoRecord.t
        where type regex_t = RegexRecord.t
    structure Regex :
      G_LIB_REGEX
        where type t = RegexRecord.t
        where type match_info_t = MatchInfoRecord.t
        where type regex_match_flags_t = RegexMatchFlags.t
        where type regex_compile_flags_t = RegexCompileFlags.t
    structure Source :
      G_LIB_SOURCE
        where type t = SourceRecord.t
        where type main_context_t = MainContextRecord.t
    structure TimeVal :
      G_LIB_TIME_VAL
        where type t = TimeValRecord.t
    structure Error :
      G_LIB_ERROR
        where type t = ErrorRecord.t
    structure IOChannelError :
      G_LIB_I_O_CHANNEL_ERROR
        where type error_handler = ErrorRecord.handler
    exception IOChannelError of IOChannelError.t
    structure KeyFileError :
      G_LIB_KEY_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception KeyFileError of KeyFileError.t
    structure RegexError :
      G_LIB_REGEX_ERROR
        where type error_handler = ErrorRecord.handler
    exception RegexError of RegexError.t
    structure ShellError :
      G_LIB_SHELL_ERROR
        where type error_handler = ErrorRecord.handler
    exception ShellError of ShellError.t
    structure SpawnError :
      G_LIB_SPAWN_ERROR
        where type error_handler = ErrorRecord.handler
    exception SpawnError of SpawnError.t
    structure IOChannel :
      G_LIB_I_O_CHANNEL
        where type t = IOChannelRecord.t
        where type i_o_condition_t = IOCondition.t
        where type i_o_error_t = IOError.t
        where type seek_type_t = SeekType.t
        where type i_o_flags_t = IOFlags.t
        where type i_o_status_t = IOStatus.t
        where type i_o_channel_error_t = IOChannelError.t
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
    val base64Decode : string -> Word8Vector.vector
    val base64Encode : Word8Vector.vector -> string
    val buildFilenamev : string list -> string
    val buildPathv :
      string
       -> string list
       -> string
    val chdir : string -> LargeInt.int
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
    val getApplicationName : unit -> string
    val getCurrentDir : unit -> string
    val getCurrentTime : TimeValRecord.t -> unit
    val getEnviron : unit -> string list
    val getHomeDir : unit -> string
    val getHostName : unit -> string
    val getLanguageNames : unit -> string list
    val getLocaleVariants : string -> string list
    val getMonotonicTime : unit -> LargeInt.int
    val getPrgname : unit -> string
    val getRealName : unit -> string
    val getRealTime : unit -> LargeInt.int
    val getSystemConfigDirs : unit -> string list
    val getSystemDataDirs : unit -> string list
    val getTmpDir : unit -> string
    val getUserCacheDir : unit -> string
    val getUserConfigDir : unit -> string
    val getUserDataDir : unit -> string
    val getUserName : unit -> string
    val getUserRuntimeDir : unit -> string
    val getUserSpecialDir : UserDirectory.t -> string
    val getenv : string -> string
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
       -> SpawnChildSetupFunc.t option
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
