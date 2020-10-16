signature G_LIB =
  sig
    structure PidType : G_LIB_PID_TYPE
    structure SourceFunc : G_LIB_SOURCE_FUNC
    structure SpawnChildSetupFunc : G_LIB_SPAWN_CHILD_SETUP_FUNC
    structure DateDay : G_LIB_DATE_DAY
    structure DateYear : G_LIB_DATE_YEAR
    structure Quark : G_LIB_QUARK
    structure Time : G_LIB_TIME
    structure TimeSpan : G_LIB_TIME_SPAN
    structure BytesRecord : G_LIB_BYTES_RECORD
    structure ChecksumRecord : G_LIB_CHECKSUM_RECORD
    structure ChecksumType : G_LIB_CHECKSUM_TYPE
    structure DateRecord : G_LIB_DATE_RECORD
    structure DateDMY : G_LIB_DATE_D_M_Y
    structure DateMonth : G_LIB_DATE_MONTH
    structure DateTimeRecord : G_LIB_DATE_TIME_RECORD
    structure DateWeekday : G_LIB_DATE_WEEKDAY
    structure ErrorType : G_LIB_ERROR_TYPE
    structure FileTest : G_LIB_FILE_TEST
    structure FormatSizeFlags : G_LIB_FORMAT_SIZE_FLAGS
    structure HookFlagMask : G_LIB_HOOK_FLAG_MASK
    structure IConvRecord : G_LIB_I_CONV_RECORD
    structure IOChannelRecord : G_LIB_I_O_CHANNEL_RECORD
    structure IOCondition : G_LIB_I_O_CONDITION
    structure IOError : G_LIB_I_O_ERROR
    structure IOFlags : G_LIB_I_O_FLAGS
    structure IOStatus : G_LIB_I_O_STATUS
    structure KeyFileRecord : G_LIB_KEY_FILE_RECORD
    structure KeyFileFlags : G_LIB_KEY_FILE_FLAGS
    structure LogLevelFlags : G_LIB_LOG_LEVEL_FLAGS
    structure LogWriterOutput : G_LIB_LOG_WRITER_OUTPUT
    structure MainContextRecord : G_LIB_MAIN_CONTEXT_RECORD
    structure MainLoopRecord : G_LIB_MAIN_LOOP_RECORD
    structure MappedFileRecord : G_LIB_MAPPED_FILE_RECORD
    structure MarkupCollectType : G_LIB_MARKUP_COLLECT_TYPE
    structure MarkupParseContextRecord : G_LIB_MARKUP_PARSE_CONTEXT_RECORD
    structure MarkupParseFlags : G_LIB_MARKUP_PARSE_FLAGS
    structure MatchInfoRecord : G_LIB_MATCH_INFO_RECORD
    structure NormalizeMode : G_LIB_NORMALIZE_MODE
    structure OnceStatus : G_LIB_ONCE_STATUS
    structure OptionArg : G_LIB_OPTION_ARG
    structure OptionFlags : G_LIB_OPTION_FLAGS
    structure OptionGroupRecord : G_LIB_OPTION_GROUP_RECORD
    structure RegexRecord : G_LIB_REGEX_RECORD
    structure RegexCompileFlags : G_LIB_REGEX_COMPILE_FLAGS
    structure RegexMatchFlags : G_LIB_REGEX_MATCH_FLAGS
    structure SeekType : G_LIB_SEEK_TYPE
    structure SliceConfig : G_LIB_SLICE_CONFIG
    structure SourceRecord : G_LIB_SOURCE_RECORD
    structure SpawnFlags : G_LIB_SPAWN_FLAGS
    structure StringRecord : G_LIB_STRING_RECORD
    structure TestConfigRecord : G_LIB_TEST_CONFIG_RECORD
    structure TestFileType : G_LIB_TEST_FILE_TYPE
    structure TestLogType : G_LIB_TEST_LOG_TYPE
    structure TestSubprocessFlags : G_LIB_TEST_SUBPROCESS_FLAGS
    structure TestTrapFlags : G_LIB_TEST_TRAP_FLAGS
    structure ThreadRecord : G_LIB_THREAD_RECORD
    structure TimeType : G_LIB_TIME_TYPE
    structure TimeValRecord : G_LIB_TIME_VAL_RECORD
    structure TimeZoneRecord : G_LIB_TIME_ZONE_RECORD
    structure TokenType : G_LIB_TOKEN_TYPE
    structure TraverseFlags : G_LIB_TRAVERSE_FLAGS
    structure TraverseType : G_LIB_TRAVERSE_TYPE
    structure UnicodeType : G_LIB_UNICODE_TYPE
    structure UserDirectory : G_LIB_USER_DIRECTORY
    structure VariantRecord : G_LIB_VARIANT_RECORD
    structure VariantBuilderRecord : G_LIB_VARIANT_BUILDER_RECORD
    structure VariantClass : G_LIB_VARIANT_CLASS
    structure VariantDictRecord : G_LIB_VARIANT_DICT_RECORD
    structure VariantTypeRecord : G_LIB_VARIANT_TYPE_RECORD
    structure IOFunc :
      G_LIB_I_O_FUNC
        where type i_o_channel_t = IOChannelRecord.t
        where type i_o_condition_t = IOCondition.t
    structure Pid : G_LIB_PID
    structure Bytes :
      G_LIB_BYTES
        where type t = BytesRecord.t
    structure Checksum :
      G_LIB_CHECKSUM
        where type t = ChecksumRecord.t
        where type checksum_type_t = ChecksumType.t
    structure Date :
      G_LIB_DATE
        where type t = DateRecord.t
        where type time_t = Time.t
        where type time_val_t = TimeValRecord.t
        where type date_day_t = DateDay.t
        where type date_month_t = DateMonth.t
        where type date_weekday_t = DateWeekday.t
        where type date_year_t = DateYear.t
    structure DateTime :
      G_LIB_DATE_TIME
        where type t = DateTimeRecord.t
        where type time_span_t = TimeSpan.t
        where type time_val_t = TimeValRecord.t
        where type time_zone_t = TimeZoneRecord.t
    structure ErrorRecord : G_LIB_ERROR_RECORD
    structure IConv :
      G_LIB_I_CONV
        where type t = IConvRecord.t
    structure KeyFile :
      G_LIB_KEY_FILE
        where type t = KeyFileRecord.t
        where type bytes_t = BytesRecord.t
        where type key_file_flags_t = KeyFileFlags.t
    structure MainContext :
      G_LIB_MAIN_CONTEXT
        where type t = MainContextRecord.t
        where type source_t = SourceRecord.t
    structure MainLoop :
      G_LIB_MAIN_LOOP
        where type t = MainLoopRecord.t
        where type main_context_t = MainContextRecord.t
    structure MappedFile :
      G_LIB_MAPPED_FILE
        where type t = MappedFileRecord.t
        where type bytes_t = BytesRecord.t
    structure MarkupParseContext :
      G_LIB_MARKUP_PARSE_CONTEXT
        where type t = MarkupParseContextRecord.t
    structure MatchInfo :
      G_LIB_MATCH_INFO
        where type t = MatchInfoRecord.t
        where type regex_t = RegexRecord.t
    structure OptionGroup :
      G_LIB_OPTION_GROUP
        where type t = OptionGroupRecord.t
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
        where type time_val_t = TimeValRecord.t
    structure String :
      G_LIB_STRING
        where type t = StringRecord.t
    structure TestConfig :
      G_LIB_TEST_CONFIG
        where type t = TestConfigRecord.t
    structure Thread :
      G_LIB_THREAD
        where type t = ThreadRecord.t
    structure TimeVal :
      G_LIB_TIME_VAL
        where type t = TimeValRecord.t
    structure TimeZone :
      G_LIB_TIME_ZONE
        where type t = TimeZoneRecord.t
        where type time_type_t = TimeType.t
    structure VariantRecordCPtrArrayN :
      C_ARRAY
        where type elem = VariantRecord.t
    structure VariantBuilder :
      G_LIB_VARIANT_BUILDER
        where type t = VariantBuilderRecord.t
        where type variant_t = VariantRecord.t
        where type variant_type_t = VariantTypeRecord.t
    structure VariantDict :
      G_LIB_VARIANT_DICT
        where type t = VariantDictRecord.t
        where type variant_t = VariantRecord.t
        where type variant_type_t = VariantTypeRecord.t
    structure VariantTypeRecordCPtrArrayN :
      C_ARRAY
        where type elem = VariantTypeRecord.t
    structure ChildWatchFunc :
      G_LIB_CHILD_WATCH_FUNC
        where type pid_t = Pid.t
    structure BookmarkFileError :
      G_LIB_BOOKMARK_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception BookmarkFileError of BookmarkFileError.t
    structure ConvertError :
      G_LIB_CONVERT_ERROR
        where type error_handler = ErrorRecord.handler
    exception ConvertError of ConvertError.t
    structure Error :
      G_LIB_ERROR
        where type t = ErrorRecord.t
        where type quark_t = Quark.t
    exception Error of exn * Error.t
    structure FileError :
      G_LIB_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception FileError of FileError.t
    structure IOChannelError :
      G_LIB_I_O_CHANNEL_ERROR
        where type error_handler = ErrorRecord.handler
    exception IOChannelError of IOChannelError.t
    structure KeyFileError :
      G_LIB_KEY_FILE_ERROR
        where type error_handler = ErrorRecord.handler
    exception KeyFileError of KeyFileError.t
    structure MarkupError :
      G_LIB_MARKUP_ERROR
        where type error_handler = ErrorRecord.handler
    exception MarkupError of MarkupError.t
    structure OptionError :
      G_LIB_OPTION_ERROR
        where type error_handler = ErrorRecord.handler
    exception OptionError of OptionError.t
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
    structure ThreadError :
      G_LIB_THREAD_ERROR
        where type error_handler = ErrorRecord.handler
    exception ThreadError of ThreadError.t
    structure Variant :
      G_LIB_VARIANT
        where type t = VariantRecord.t
        where type variant_record_c_ptr_array_n_t = VariantRecordCPtrArrayN.t
        where type variant_class_t = VariantClass.t
        where type bytes_t = BytesRecord.t
        where type variant_type_t = VariantTypeRecord.t
    structure VariantParseError :
      G_LIB_VARIANT_PARSE_ERROR
        where type error_handler = ErrorRecord.handler
    exception VariantParseError of VariantParseError.t
    structure VariantType :
      G_LIB_VARIANT_TYPE
        where type t = VariantTypeRecord.t
        where type variant_type_record_c_ptr_array_n_t = VariantTypeRecordCPtrArrayN.t
    structure IOChannel :
      G_LIB_I_O_CHANNEL
        where type t = IOChannelRecord.t
        where type i_o_condition_t = IOCondition.t
        where type i_o_error_t = IOError.t
        where type seek_type_t = SeekType.t
        where type i_o_flags_t = IOFlags.t
        where type i_o_status_t = IOStatus.t
        where type i_o_channel_error_t = IOChannelError.t
    val ANALYZER_ANALYZING : LargeInt.int
    val KEY_FILE_DESKTOP_GROUP : string
    val KEY_FILE_DESKTOP_KEY_ACTIONS : string
    val KEY_FILE_DESKTOP_KEY_CATEGORIES : string
    val KEY_FILE_DESKTOP_KEY_COMMENT : string
    val KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE : string
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
    val MAXINT16 : LargeInt.int
    val MAXINT32 : LargeInt.int
    val MAXINT64 : LargeInt.int
    val MAXINT8 : LargeInt.int
    val MAXUINT16 : LargeInt.int
    val MAXUINT32 : LargeInt.int
    val MAXUINT64 : LargeInt.int
    val MAXUINT8 : LargeInt.int
    val MICRO_VERSION : LargeInt.int
    val MININT16 : LargeInt.int
    val MININT32 : LargeInt.int
    val MININT64 : LargeInt.int
    val MININT8 : LargeInt.int
    val MINOR_VERSION : LargeInt.int
    val PRIORITY_DEFAULT : LargeInt.int
    val PRIORITY_DEFAULT_IDLE : LargeInt.int
    val PRIORITY_HIGH : LargeInt.int
    val PRIORITY_HIGH_IDLE : LargeInt.int
    val PRIORITY_LOW : LargeInt.int
    val SOURCE_CONTINUE : bool
    val SOURCE_REMOVE : bool
    val TIME_SPAN_DAY : LargeInt.int
    val TIME_SPAN_HOUR : LargeInt.int
    val TIME_SPAN_MILLISECOND : LargeInt.int
    val TIME_SPAN_MINUTE : LargeInt.int
    val TIME_SPAN_SECOND : LargeInt.int
    val UNICHAR_MAX_DECOMPOSITION_LENGTH : LargeInt.int
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS : string
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS : string
    val VERSION_MIN_REQUIRED : LargeInt.int
    val assertWarning :
      string
       * string
       * LargeInt.int
       * string
       * string
       -> unit
    val assertionMessage :
      string
       * string
       * LargeInt.int
       * string
       * string
       -> unit
    val assertionMessageCmpstr :
      string
       * string
       * LargeInt.int
       * string
       * string
       * string
       * string
       * string
       -> unit
    val base64Decode : string -> GUInt8CArrayN.t
    val base64Encode : GUInt8CArrayN.t -> string
    val buildFilenamev : Utf8CPtrArray.t -> string
    val buildPathv : string * Utf8CPtrArray.t -> string
    val chdir : string -> LargeInt.int
    val checkVersion :
      LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> string
    val childWatchAdd :
      LargeInt.int
       * Pid.t
       * ChildWatchFunc.t
       -> LargeInt.int
    val childWatchSourceNew : Pid.t -> SourceRecord.t
    val close : GFileDesc.t -> unit
    val computeChecksumForBytes : ChecksumType.t * BytesRecord.t -> string
    val computeChecksumForData : ChecksumType.t * GUInt8CArrayN.t -> string
    val computeChecksumForString :
      ChecksumType.t
       * string
       * int
       -> string
    val computeHmacForBytes :
      ChecksumType.t
       * BytesRecord.t
       * BytesRecord.t
       -> string
    val computeHmacForData :
      ChecksumType.t
       * GUInt8CArrayN.t
       * GUInt8CArrayN.t
       -> string
    val computeHmacForString :
      ChecksumType.t
       * GUInt8CArrayN.t
       * string
       * int
       -> string
    val convert :
      string
       * int
       * string
       * string
       -> string
           * int
           * int
    val dcgettext :
      string option
       * string
       * LargeInt.int
       -> string
    val dgettext : string option * string -> string
    val dngettext :
      string option
       * string
       * string
       * LargeInt.int
       -> string
    val dpgettext :
      string option
       * string
       * int
       -> string
    val dpgettext2 :
      string option
       * string
       * string
       -> string
    val environGetenv : Utf8CPtrArray.t option * string -> string
    val environSetenv :
      Utf8CPtrArray.t option
       * string
       * string
       * bool
       -> Utf8CPtrArray.t
    val environUnsetenv : Utf8CPtrArray.t option * string -> Utf8CPtrArray.t
    val filenameDisplayBasename : string -> string
    val filenameDisplayName : string -> string
    val filenameFromUri : string -> string * string
    val filenameFromUtf8 : string * int -> GUInt8CArrayN.t * int
    val filenameToUri : string * string option -> string
    val filenameToUtf8 :
      string * int
       -> string
           * int
           * int
    val findProgramInPath : string -> string
    val formatSize : LargeInt.int -> string
    val formatSizeForDisplay : LargeInt.int -> string
    val formatSizeFull : LargeInt.int * FormatSizeFlags.t -> string
    val getApplicationName : unit -> string
    val getCodeset : unit -> string
    val getCurrentDir : unit -> string
    val getCurrentTime : TimeValRecord.t -> unit
    val getEnviron : unit -> Utf8CPtrArray.t
    val getHomeDir : unit -> string
    val getHostName : unit -> string
    val getLanguageNames : unit -> Utf8CPtrArray.t
    val getLocaleVariants : string -> Utf8CPtrArray.t
    val getMonotonicTime : unit -> LargeInt.int
    val getNumProcessors : unit -> LargeInt.int
    val getPrgname : unit -> string
    val getRealName : unit -> string
    val getRealTime : unit -> LargeInt.int
    val getSystemConfigDirs : unit -> Utf8CPtrArray.t
    val getSystemDataDirs : unit -> Utf8CPtrArray.t
    val getTmpDir : unit -> string
    val getUserCacheDir : unit -> string
    val getUserConfigDir : unit -> string
    val getUserDataDir : unit -> string
    val getUserName : unit -> string
    val getUserRuntimeDir : unit -> string
    val getUserSpecialDir : UserDirectory.t -> string
    val getenv : string -> string
    val hostnameIsAsciiEncoded : string -> bool
    val hostnameIsIpAddress : string -> bool
    val hostnameIsNonAscii : string -> bool
    val hostnameToAscii : string -> string
    val hostnameToUnicode : string -> string
    val idleSourceNew : unit -> SourceRecord.t
    val idleAdd : LargeInt.int * SourceFunc.t -> LargeInt.int
    val ioAddWatch :
      IOChannelRecord.t
       * LargeInt.int
       * IOCondition.t
       * IOFunc.t
       -> LargeInt.int
    val ioCreateWatch : IOChannelRecord.t * IOCondition.t -> SourceRecord.t
    val listenv : unit -> Utf8CPtrArray.t
    val localeFromUtf8 :
      string * int
       -> string
           * int
           * int
    val localeToUtf8 :
      string * int
       -> string
           * int
           * int
    val log :
      string
       * LogLevelFlags.t
       * string
       -> unit
    val logRemoveHandler : string * LargeInt.int -> unit
    val logSetAlwaysFatal : LogLevelFlags.t -> LogLevelFlags.t
    val logSetFatalMask : string * LogLevelFlags.t -> LogLevelFlags.t
    val logVariant :
      string option
       * LogLevelFlags.t
       * VariantRecord.t
       -> unit
    val logWriterIsJournald : LargeInt.int -> bool
    val logWriterSupportsColor : LargeInt.int -> bool
    val mainCurrentSource : unit -> SourceRecord.t
    val mainDepth : unit -> LargeInt.int
    val markupEscapeText : string * int -> string
    val mkdirWithParents : string * LargeInt.int -> LargeInt.int
    val mkdtemp : string -> string option
    val mkdtempFull : string * LargeInt.int -> string option
    val mkstemp : string -> LargeInt.int
    val mkstempFull :
      string
       * LargeInt.int
       * LargeInt.int
       -> LargeInt.int
    val onErrorQuery : string -> unit
    val onErrorStackTrace : string -> unit
    val pathGetBasename : string -> string
    val pathGetDirname : string -> string
    val pathIsAbsolute : string -> bool
    val pathSkipRoot : string -> string option
    val patternMatchSimple : string * string -> bool
    val randomDouble : unit -> real
    val randomDoubleRange : real * real -> real
    val randomInt : unit -> LargeInt.int
    val randomIntRange : LargeInt.int * LargeInt.int -> LargeInt.int
    val randomSetSeed : LargeInt.int -> unit
    val reloadUserSpecialDirsCache : unit -> unit
    val rmdir : string -> LargeInt.int
    val setApplicationName : string -> unit
    val setPrgname : string -> unit
    val setenv :
      string
       * string
       * bool
       -> bool
    val shellParseArgv : string -> Utf8CPtrArray.t
    val shellQuote : string -> string
    val shellUnquote : string -> string
    val sliceGetConfig : SliceConfig.t -> LargeInt.int
    val sliceSetConfig : SliceConfig.t * LargeInt.int -> unit
    val spawnAsyncWithPipes :
      string option
       * Utf8CPtrArray.t
       * Utf8CPtrArray.t option
       * SpawnFlags.t
       * SpawnChildSetupFunc.t option
       -> Pid.t
           * GFileDesc.t
           * GFileDesc.t
           * GFileDesc.t
    val spawnCheckExitStatus : LargeInt.int -> unit
    val spawnClosePid : Pid.t -> unit
    val spawnCommandLineAsync : string -> unit
    val spawnCommandLineSync :
      string
       -> GUInt8CArray.t
           * GUInt8CArray.t
           * LargeInt.int
    val testAssertExpectedMessagesInternal :
      string
       * string
       * LargeInt.int
       * string
       -> unit
    val testBug : string -> unit
    val testBugBase : string -> unit
    val testExpectMessage :
      string option
       * LogLevelFlags.t
       * string
       -> unit
    val testFail : unit -> unit
    val testFailed : unit -> bool
    val testGetDir : TestFileType.t -> string
    val testIncomplete : string option -> unit
    val testLogTypeName : TestLogType.t -> string
    val testRandDouble : unit -> real
    val testRandDoubleRange : real * real -> real
    val testRandInt : unit -> LargeInt.int
    val testRandIntRange : LargeInt.int * LargeInt.int -> LargeInt.int
    val testRun : unit -> LargeInt.int
    val testSetNonfatalAssertions : unit -> unit
    val testSkip : string option -> unit
    val testSubprocess : unit -> bool
    val testTimerElapsed : unit -> real
    val testTimerLast : unit -> real
    val testTimerStart : unit -> unit
    val testTrapAssertions :
      string
       * string
       * LargeInt.int
       * string
       * LargeInt.int
       * string
       -> unit
    val testTrapFork : LargeInt.int * TestTrapFlags.t -> bool
    val testTrapHasPassed : unit -> bool
    val testTrapReachedTimeout : unit -> bool
    val testTrapSubprocess :
      string option
       * LargeInt.int
       * TestSubprocessFlags.t
       -> unit
    val timeoutAdd :
      LargeInt.int
       * LargeInt.int
       * SourceFunc.t
       -> LargeInt.int
    val timeoutAddSeconds :
      LargeInt.int
       * LargeInt.int
       * SourceFunc.t
       -> LargeInt.int
    val timeoutSourceNew : LargeInt.int -> SourceRecord.t
    val timeoutSourceNewSeconds : LargeInt.int -> SourceRecord.t
    val unixFdSourceNew : LargeInt.int * IOCondition.t -> SourceRecord.t
    val unixSetFdNonblocking : LargeInt.int * bool -> unit
    val unixSignalSourceNew : LargeInt.int -> SourceRecord.t
    val unlink : string -> LargeInt.int
    val unsetenv : string -> unit
    val uriEscapeString :
      string
       * string option
       * bool
       -> string
    val uriListExtractUris : string -> Utf8CPtrArray.t
    val uriParseScheme : string -> string
    val uriUnescapeSegment :
      string option
       * string option
       * string option
       -> string
    val uriUnescapeString : string * string option -> string
    val usleep : LargeInt.int -> unit
    val variantGetGtype : unit -> GObject.Type.t
  end
