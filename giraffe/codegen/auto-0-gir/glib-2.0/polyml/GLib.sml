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
      val assertWarning_ =
        call (getSymbol "g_assert_warning")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessage_ =
        call (getSymbol "g_assertion_message")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessageCmpstr_ =
        call (getSymbol "g_assertion_message_cmpstr")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessageExpr_ =
        call (getSymbol "g_assertion_message_expr")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
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
      val childWatchSourceNew_ = call (getSymbol "g_child_watch_source_new") (GLibPid.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val computeChecksumForString_ =
        call (getSymbol "g_compute_checksum_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForString_ =
        call (getSymbol "g_compute_hmac_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val convert_ =
        call (getSymbol "g_convert")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val dcgettext_ =
        call (getSymbol "g_dcgettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dgettext_ = call (getSymbol "g_dgettext") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val dngettext_ =
        call (getSymbol "g_dngettext")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GULong.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext_ =
        call (getSymbol "g_dpgettext")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext2_ =
        call (getSymbol "g_dpgettext2")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val filenameDisplayBasename_ = call (getSymbol "g_filename_display_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameDisplayName_ = call (getSymbol "g_filename_display_name") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
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
      val findProgramInPath_ = call (getSymbol "g_find_program_in_path") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val formatSize_ = call (getSymbol "g_format_size") (GUInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeForDisplay_ = call (getSymbol "g_format_size_for_display") (GInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeFull_ = call (getSymbol "g_format_size_full") (GUInt64.PolyML.cVal &&> GLibFormatSizeFlags.PolyML.cVal --> Utf8.PolyML.cOutPtr)
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
      val hostnameIsAsciiEncoded_ = call (getSymbol "g_hostname_is_ascii_encoded") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameIsIpAddress_ = call (getSymbol "g_hostname_is_ip_address") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameIsNonAscii_ = call (getSymbol "g_hostname_is_non_ascii") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameToAscii_ = call (getSymbol "g_hostname_to_ascii") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hostnameToUnicode_ = call (getSymbol "g_hostname_to_unicode") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val idleSourceNew_ = call (getSymbol "g_idle_source_new") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val ioCreateWatch_ = call (getSymbol "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val listenv_ = call (getSymbol "g_listenv") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val logRemoveHandler_ = call (getSymbol "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> GUInt.PolyML.cVal --> cVoid)
      val logSetAlwaysFatal_ = call (getSymbol "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (getSymbol "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val mainCurrentSource_ = call (getSymbol "g_main_current_source") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (getSymbol "g_main_depth") (cVoid --> GInt.PolyML.cVal)
      val markupEscapeText_ = call (getSymbol "g_markup_escape_text") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val mkdirWithParents_ = call (getSymbol "g_mkdir_with_parents") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val mkdtemp_ = call (getSymbol "g_mkdtemp") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val mkdtempFull_ = call (getSymbol "g_mkdtemp_full") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val mkstemp_ = call (getSymbol "g_mkstemp") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val mkstempFull_ =
        call (getSymbol "g_mkstemp_full")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val onErrorQuery_ = call (getSymbol "g_on_error_query") (Utf8.PolyML.cInPtr --> cVoid)
      val onErrorStackTrace_ = call (getSymbol "g_on_error_stack_trace") (Utf8.PolyML.cInPtr --> cVoid)
      val pathGetBasename_ = call (getSymbol "g_path_get_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathGetDirname_ = call (getSymbol "g_path_get_dirname") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathIsAbsolute_ = call (getSymbol "g_path_is_absolute") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val pathSkipRoot_ = call (getSymbol "g_path_skip_root") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val patternMatch_ =
        call (getSymbol "g_pattern_match")
          (
            GLibPatternSpecRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val patternMatchSimple_ = call (getSymbol "g_pattern_match_simple") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val patternMatchString_ = call (getSymbol "g_pattern_match_string") (GLibPatternSpecRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val randomDouble_ = call (getSymbol "g_random_double") (cVoid --> GDouble.PolyML.cVal)
      val randomDoubleRange_ = call (getSymbol "g_random_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val randomInt_ = call (getSymbol "g_random_int") (cVoid --> GUInt32.PolyML.cVal)
      val randomIntRange_ = call (getSymbol "g_random_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val randomSetSeed_ = call (getSymbol "g_random_set_seed") (GUInt32.PolyML.cVal --> cVoid)
      val reloadUserSpecialDirsCache_ = call (getSymbol "g_reload_user_special_dirs_cache") (cVoid --> cVoid)
      val rmdir_ = call (getSymbol "g_rmdir") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val setApplicationName_ = call (getSymbol "g_set_application_name") (Utf8.PolyML.cInPtr --> cVoid)
      val setPrgname_ = call (getSymbol "g_set_prgname") (Utf8.PolyML.cInPtr --> cVoid)
      val setenv_ =
        call (getSymbol "g_setenv")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
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
      val sliceGetConfig_ = call (getSymbol "g_slice_get_config") (GLibSliceConfig.PolyML.cVal --> GInt64.PolyML.cVal)
      val sliceSetConfig_ = call (getSymbol "g_slice_set_config") (GLibSliceConfig.PolyML.cVal &&> GInt64.PolyML.cVal --> cVoid)
      val spawnClosePid_ = call (getSymbol "g_spawn_close_pid") (GLibPid.PolyML.cVal --> cVoid)
      val spawnCommandLineAsync_ = call (getSymbol "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val testBug_ = call (getSymbol "g_test_bug") (Utf8.PolyML.cInPtr --> cVoid)
      val testBugBase_ = call (getSymbol "g_test_bug_base") (Utf8.PolyML.cInPtr --> cVoid)
      val testFail_ = call (getSymbol "g_test_fail") (cVoid --> cVoid)
      val testLogTypeName_ = call (getSymbol "g_test_log_type_name") (GLibTestLogType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val testRandDouble_ = call (getSymbol "g_test_rand_double") (cVoid --> GDouble.PolyML.cVal)
      val testRandDoubleRange_ = call (getSymbol "g_test_rand_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val testRandInt_ = call (getSymbol "g_test_rand_int") (cVoid --> GInt32.PolyML.cVal)
      val testRandIntRange_ = call (getSymbol "g_test_rand_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val testRun_ = call (getSymbol "g_test_run") (cVoid --> GInt.PolyML.cVal)
      val testRunSuite_ = call (getSymbol "g_test_run_suite") (GLibTestSuiteRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val testTimerElapsed_ = call (getSymbol "g_test_timer_elapsed") (cVoid --> GDouble.PolyML.cVal)
      val testTimerLast_ = call (getSymbol "g_test_timer_last") (cVoid --> GDouble.PolyML.cVal)
      val testTimerStart_ = call (getSymbol "g_test_timer_start") (cVoid --> cVoid)
      val testTrapAssertions_ =
        call (getSymbol "g_test_trap_assertions")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testTrapFork_ = call (getSymbol "g_test_trap_fork") (GUInt64.PolyML.cVal &&> GLibTestTrapFlags.PolyML.cVal --> GBool.PolyML.cVal)
      val testTrapHasPassed_ = call (getSymbol "g_test_trap_has_passed") (cVoid --> GBool.PolyML.cVal)
      val testTrapReachedTimeout_ = call (getSymbol "g_test_trap_reached_timeout") (cVoid --> GBool.PolyML.cVal)
      val timeoutSourceNew_ = call (getSymbol "g_timeout_source_new") (GUInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val timeoutSourceNewSeconds_ = call (getSymbol "g_timeout_source_new_seconds") (GUInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val unlink_ = call (getSymbol "g_unlink") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val unsetenv_ = call (getSymbol "g_unsetenv") (Utf8.PolyML.cInPtr --> cVoid)
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
      val usleep_ = call (getSymbol "g_usleep") (GULong.PolyML.cVal --> cVoid)
      val variantGetType_ = call (getSymbol "g_variant_get_type") (GLibVariantRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val warnMessage_ =
        call (getSymbol "g_warn_message")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
    end
    structure PidType = GLibPidType
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure DateDay = GLibDateDay
    structure DateYear = GLibDateYear
    structure Quark = GLibQuark
    structure Time = GLibTime
    structure TimeSpan = GLibTimeSpan
    structure ChecksumType = GLibChecksumType
    structure DateRecord = GLibDateRecord
    structure DateDMY = GLibDateDMY
    structure DateMonth = GLibDateMonth
    structure DateTimeRecord = GLibDateTimeRecord
    structure DateWeekday = GLibDateWeekday
    structure ErrorType = GLibErrorType
    structure FileTest = GLibFileTest
    structure FormatSizeFlags = GLibFormatSizeFlags
    structure HookFlagMask = GLibHookFlagMask
    structure IOChannelRecord = GLibIOChannelRecord
    structure IOCondition = GLibIOCondition
    structure IOError = GLibIOError
    structure IOFlags = GLibIOFlags
    structure IOStatus = GLibIOStatus
    structure KeyFileRecord = GLibKeyFileRecord
    structure KeyFileFlags = GLibKeyFileFlags
    structure LogLevelFlags = GLibLogLevelFlags
    structure MainContextRecord = GLibMainContextRecord
    structure MarkupCollectType = GLibMarkupCollectType
    structure MarkupParseFlags = GLibMarkupParseFlags
    structure MatchInfoRecord = GLibMatchInfoRecord
    structure NormalizeMode = GLibNormalizeMode
    structure OnceStatus = GLibOnceStatus
    structure OptionArg = GLibOptionArg
    structure OptionFlags = GLibOptionFlags
    structure PatternSpecRecord = GLibPatternSpecRecord
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SliceConfig = GLibSliceConfig
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure StringRecord = GLibStringRecord
    structure TestCaseRecord = GLibTestCaseRecord
    structure TestLogType = GLibTestLogType
    structure TestSuiteRecord = GLibTestSuiteRecord
    structure TestTrapFlags = GLibTestTrapFlags
    structure ThreadPriority = GLibThreadPriority
    structure TimeType = GLibTimeType
    structure TimeValRecord = GLibTimeValRecord
    structure TimeZoneRecord = GLibTimeZoneRecord
    structure TokenType = GLibTokenType
    structure TraverseFlags = GLibTraverseFlags
    structure TraverseType = GLibTraverseType
    structure UnicodeType = GLibUnicodeType
    structure UserDirectory = GLibUserDirectory
    structure VariantRecord = GLibVariantRecord
    structure VariantClass = GLibVariantClass
    structure VariantParseError = GLibVariantParseError
    structure VariantTypeRecord = GLibVariantTypeRecord
    structure Pid = GLibPid
    structure IOFunc = GLibIOFunc
    structure ErrorRecord = GLibErrorRecord
    structure Date = GLibDate
    structure DateTime = GLibDateTime
    structure KeyFile = GLibKeyFile
    structure MainContext = GLibMainContext
    structure MatchInfo = GLibMatchInfo
    structure PatternSpec = GLibPatternSpec
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure String = GLibString
    structure TestCase = GLibTestCase
    structure TestSuite = GLibTestSuite
    structure TimeVal = GLibTimeVal
    structure TimeZone = GLibTimeZone
    structure Variant = GLibVariant
    structure VariantType = GLibVariantType
    structure ChildWatchFunc = GLibChildWatchFunc
    structure BookmarkFileError = GLibBookmarkFileError
    exception BookmarkFileError = GLibBookmarkFileError
    structure ConvertError = GLibConvertError
    exception ConvertError = GLibConvertError
    structure Error = GLibError
    structure FileError = GLibFileError
    exception FileError = GLibFileError
    structure IOChannelError = GLibIOChannelError
    exception IOChannelError = GLibIOChannelError
    structure KeyFileError = GLibKeyFileError
    exception KeyFileError = GLibKeyFileError
    structure MarkupError = GLibMarkupError
    exception MarkupError = GLibMarkupError
    structure OptionError = GLibOptionError
    exception OptionError = GLibOptionError
    structure RegexError = GLibRegexError
    exception RegexError = GLibRegexError
    structure ShellError = GLibShellError
    exception ShellError = GLibShellError
    structure SpawnError = GLibSpawnError
    exception SpawnError = GLibSpawnError
    structure ThreadError = GLibThreadError
    exception ThreadError = GLibThreadError
    structure IOChannel = GLibIOChannel
    val ALLOCATOR_LIST = 1
    val ALLOCATOR_NODE = 3
    val ALLOCATOR_SLIST = 2
    val ALLOC_AND_FREE = 2
    val ALLOC_ONLY = 1
    val ASCII_DTOSTR_BUF_SIZE = 39
    val ATOMIC_OP_USE_GCC_BUILTINS = 1
    val BIG_ENDIAN = 4321
    val CAN_INLINE = 1
    val CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    val CSET_DIGITS = "0123456789"
    val CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz"
    val DATALIST_FLAGS_MASK = 3
    val DATE_BAD_DAY = 0
    val DATE_BAD_JULIAN = 0
    val DATE_BAD_YEAR = 0
    val DIR_SEPARATOR = 92
    val DIR_SEPARATOR_S = "\\"
    val E = 2.718282
    val GINT16_FORMAT = "hi"
    val GINT16_MODIFIER = "h"
    val GINT32_FORMAT = "i"
    val GINT32_MODIFIER = ""
    val GINT64_FORMAT = "li"
    val GINT64_MODIFIER = "l"
    val GINTPTR_FORMAT = "li"
    val GINTPTR_MODIFIER = "l"
    val GNUC_FUNCTION = ""
    val GNUC_PRETTY_FUNCTION = ""
    val GSIZE_FORMAT = "lu"
    val GSIZE_MODIFIER = "l"
    val GSSIZE_FORMAT = "li"
    val GUINT16_FORMAT = "hu"
    val GUINT32_FORMAT = "u"
    val GUINT64_FORMAT = "lu"
    val GUINTPTR_FORMAT = "lu"
    val HAVE_GINT64 = 1
    val HAVE_GNUC_VARARGS = 1
    val HAVE_GNUC_VISIBILITY = 1
    val HAVE_GROWING_STACK = 1
    val HAVE_INLINE = 1
    val HAVE_ISO_VARARGS = 1
    val HAVE___INLINE = 1
    val HAVE___INLINE__ = 1
    val HOOK_FLAG_USER_SHIFT = 4
    val IEEE754_DOUBLE_BIAS = 1023
    val IEEE754_FLOAT_BIAS = 127
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
    val LITTLE_ENDIAN = 1234
    val LN10 = 2.302585
    val LN2 = 0.693147
    val LOG_2_BASE_10 = 0.301030
    val LOG_FATAL_MASK = 0
    val LOG_LEVEL_USER_SHIFT = 8
    val MAJOR_VERSION = 2
    val MICRO_VERSION = 90
    val MINOR_VERSION = 29
    val MODULE_SUFFIX = "so"
    val MUTEX_DEBUG_MAGIC = 4175530711
    val OPTION_REMAINING = ""
    val PDP_ENDIAN = 3412
    val PI = 3.141593
    val PI_2 = 1.570796
    val PI_4 = 0.785398
    val POLLFD_FORMAT = "%#I64x"
    val PRIORITY_DEFAULT = 0
    val PRIORITY_DEFAULT_IDLE = 200
    val PRIORITY_HIGH = ~100
    val PRIORITY_HIGH_IDLE = 100
    val PRIORITY_LOW = 300
    val SEARCHPATH_SEPARATOR = 59
    val SEARCHPATH_SEPARATOR_S = ";"
    val SIZEOF_LONG = 8
    val SIZEOF_SIZE_T = 8
    val SIZEOF_VOID_P = 8
    val SQRT2 = 1.414214
    val STR_DELIMITERS = "_-|> <."
    val SYSDEF_AF_INET = 2
    val SYSDEF_AF_INET6 = 10
    val SYSDEF_AF_UNIX = 1
    val SYSDEF_MSG_DONTROUTE = 4
    val SYSDEF_MSG_OOB = 1
    val SYSDEF_MSG_PEEK = 2
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
    val USEC_PER_SEC = 1000000
    val VA_COPY_AS_ARRAY = 1
    val WIN32_MSG_HANDLE = 19981206
    fun assertWarning
      (
        logDomain,
        file,
        line,
        prettyFunction,
        expression
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        assertWarning_
        (
          logDomain
           & file
           & line
           & prettyFunction
           & expression
        )
    fun assertionMessage
      (
        domain,
        file,
        line,
        func,
        message
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        assertionMessage_
        (
          domain
           & file
           & line
           & func
           & message
        )
    fun assertionMessageCmpstr
      (
        domain,
        file,
        line,
        func,
        expr,
        arg1,
        cmp,
        arg2
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        assertionMessageCmpstr_
        (
          domain
           & file
           & line
           & func
           & expr
           & arg1
           & cmp
           & arg2
        )
    fun assertionMessageExpr
      (
        domain,
        file,
        line,
        func,
        expr
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        assertionMessageExpr_
        (
          domain
           & file
           & line
           & func
           & expr
        )
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
    fun childWatchSourceNew pid = (GLibPid.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) childWatchSourceNew_ pid
    fun computeChecksumForString
      (
        checksumType,
        str,
        length
      ) =
      (
        GLibChecksumType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        computeChecksumForString_
        (
          checksumType
           & str
           & length
        )
    fun computeHmacForString
      (
        digestType,
        key,
        str,
        length
      ) =
      let
        val keyLen = LargeInt.fromInt (GUInt8CVectorN.length key)
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GSSize.FFI.withVal
             ---> Utf8.FFI.fromPtr 1
          )
            computeHmacForString_
            (
              digestType
               & key
               & keyLen
               & str
               & length
            )
      in
        retVal
      end
    fun convert
      (
        str,
        len,
        toCodeset,
        fromCodeset
      ) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
          )
            convert_
            (
              str
               & len
               & toCodeset
               & fromCodeset
               & GSize.null
               & GSize.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun dcgettext
      (
        domain,
        msgid,
        category
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        dcgettext_
        (
          domain
           & msgid
           & category
        )
    fun dgettext (domain, msgid) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) dgettext_ (domain & msgid)
    fun dngettext
      (
        domain,
        msgid,
        msgidPlural,
        n
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GULong.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        dngettext_
        (
          domain
           & msgid
           & msgidPlural
           & n
        )
    fun dpgettext
      (
        domain,
        msgctxtid,
        msgidoffset
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        dpgettext_
        (
          domain
           & msgctxtid
           & msgidoffset
        )
    fun dpgettext2
      (
        domain,
        context,
        msgid
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromPtr 0
      )
        dpgettext2_
        (
          domain
           & context
           & msgid
        )
    fun filenameDisplayBasename filename = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) filenameDisplayBasename_ filename
    fun filenameDisplayName filename = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) filenameDisplayName_ filename
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
    fun findProgramInPath program = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) findProgramInPath_ program
    fun formatSize size = (GUInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSize_ size
    fun formatSizeForDisplay size = (GInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSizeForDisplay_ size
    fun formatSizeFull (size, flags) = (GUInt64.FFI.withVal &&&> GLibFormatSizeFlags.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSizeFull_ (size & flags)
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
    fun hostnameIsAsciiEncoded hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) hostnameToUnicode_ hostname
    fun idleSourceNew () = (I ---> GLibSourceRecord.FFI.fromPtr true) idleSourceNew_ ()
    fun ioCreateWatch (channel, condition) = (GLibIOChannelRecord.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) ioCreateWatch_ (channel & condition)
    fun listenv () = (I ---> Utf8CVector.FFI.fromPtr 2) listenv_ ()
    fun logRemoveHandler (logDomain, handlerId) = (Utf8.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask (logDomain, fatalMask) = (Utf8.FFI.withPtr &&&> GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainCurrentSource () = (I ---> GLibSourceRecord.FFI.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> GInt.FFI.fromVal) mainDepth_ ()
    fun markupEscapeText (text, length) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) markupEscapeText_ (text & length)
    fun mkdirWithParents (pathname, mode) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) mkdirWithParents_ (pathname & mode)
    fun mkdtemp tmpl = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) mkdtemp_ tmpl
    fun mkdtempFull (tmpl, mode) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 1) mkdtempFull_ (tmpl & mode)
    fun mkstemp tmpl = (Utf8.FFI.withPtr ---> GInt.FFI.fromVal) mkstemp_ tmpl
    fun mkstempFull
      (
        tmpl,
        flags,
        mode
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        mkstempFull_
        (
          tmpl
           & flags
           & mode
        )
    fun onErrorQuery prgName = (Utf8.FFI.withPtr ---> I) onErrorQuery_ prgName
    fun onErrorStackTrace prgName = (Utf8.FFI.withPtr ---> I) onErrorStackTrace_ prgName
    fun pathGetBasename fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) pathGetBasename_ fileName
    fun pathGetDirname fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) pathGetDirname_ fileName
    fun pathIsAbsolute fileName = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) pathIsAbsolute_ fileName
    fun pathSkipRoot fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) pathSkipRoot_ fileName
    fun patternMatch
      (
        pspec,
        stringLength,
        string,
        stringReversed
      ) =
      (
        GLibPatternSpecRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        patternMatch_
        (
          pspec
           & stringLength
           & string
           & stringReversed
        )
    fun patternMatchSimple (pattern, string) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) patternMatchSimple_ (pattern & string)
    fun patternMatchString (pspec, string) = (GLibPatternSpecRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) patternMatchString_ (pspec & string)
    fun randomDouble () = (I ---> GDouble.FFI.fromVal) randomDouble_ ()
    fun randomDoubleRange (begin, end') = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal) randomDoubleRange_ (begin & end')
    fun randomInt () = (I ---> GUInt32.FFI.fromVal) randomInt_ ()
    fun randomIntRange (begin, end') = (GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) randomIntRange_ (begin & end')
    fun randomSetSeed seed = (GUInt32.FFI.withVal ---> I) randomSetSeed_ seed
    fun reloadUserSpecialDirsCache () = (I ---> I) reloadUserSpecialDirsCache_ ()
    fun rmdir filename = (Utf8.FFI.withPtr ---> GInt.FFI.fromVal) rmdir_ filename
    fun setApplicationName applicationName = (Utf8.FFI.withPtr ---> I) setApplicationName_ applicationName
    fun setPrgname prgname = (Utf8.FFI.withPtr ---> I) setPrgname_ prgname
    fun setenv
      (
        variable,
        value,
        overwrite
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        setenv_
        (
          variable
           & value
           & overwrite
        )
    fun shellParseArgv commandLine =
      let
        val argcp
         & argvp
         & retVal =
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
               & []
            )
      in
        if retVal then SOME (argvp (LargeInt.toInt argcp)) else NONE
      end
    fun shellQuote unquotedString = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr 1) shellUnquote_ (quotedString & [])
    fun sliceGetConfig ckey = (GLibSliceConfig.FFI.withVal ---> GInt64.FFI.fromVal) sliceGetConfig_ ckey
    fun sliceSetConfig (ckey, value) = (GLibSliceConfig.FFI.withVal &&&> GInt64.FFI.withVal ---> I) sliceSetConfig_ (ckey & value)
    fun spawnClosePid pid = (GLibPid.FFI.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun testBug bugUriSnippet = (Utf8.FFI.withPtr ---> I) testBug_ bugUriSnippet
    fun testBugBase uriPattern = (Utf8.FFI.withPtr ---> I) testBugBase_ uriPattern
    fun testFail () = (I ---> I) testFail_ ()
    fun testLogTypeName logType = (GLibTestLogType.FFI.withVal ---> Utf8.FFI.fromPtr 0) testLogTypeName_ logType
    fun testRandDouble () = (I ---> GDouble.FFI.fromVal) testRandDouble_ ()
    fun testRandDoubleRange (rangeStart, rangeEnd) = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal) testRandDoubleRange_ (rangeStart & rangeEnd)
    fun testRandInt () = (I ---> GInt32.FFI.fromVal) testRandInt_ ()
    fun testRandIntRange (begin, end') = (GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) testRandIntRange_ (begin & end')
    fun testRun () = (I ---> GInt.FFI.fromVal) testRun_ ()
    fun testRunSuite suite = (GLibTestSuiteRecord.FFI.withPtr ---> GInt.FFI.fromVal) testRunSuite_ suite
    fun testTimerElapsed () = (I ---> GDouble.FFI.fromVal) testTimerElapsed_ ()
    fun testTimerLast () = (I ---> GDouble.FFI.fromVal) testTimerLast_ ()
    fun testTimerStart () = (I ---> I) testTimerStart_ ()
    fun testTrapAssertions
      (
        domain,
        file,
        line,
        func,
        assertionFlags,
        pattern
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        testTrapAssertions_
        (
          domain
           & file
           & line
           & func
           & assertionFlags
           & pattern
        )
    fun testTrapFork (usecTimeout, testTrapFlags) = (GUInt64.FFI.withVal &&&> GLibTestTrapFlags.FFI.withVal ---> GBool.FFI.fromVal) testTrapFork_ (usecTimeout & testTrapFlags)
    fun testTrapHasPassed () = (I ---> GBool.FFI.fromVal) testTrapHasPassed_ ()
    fun testTrapReachedTimeout () = (I ---> GBool.FFI.fromVal) testTrapReachedTimeout_ ()
    fun timeoutSourceNew interval = (GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) timeoutSourceNew_ interval
    fun timeoutSourceNewSeconds interval = (GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) timeoutSourceNewSeconds_ interval
    fun unlink filename = (Utf8.FFI.withPtr ---> GInt.FFI.fromVal) unlink_ filename
    fun unsetenv variable = (Utf8.FFI.withPtr ---> I) unsetenv_ variable
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
    fun usleep microseconds = (GULong.FFI.withVal ---> I) usleep_ microseconds
    fun variantGetType value = (GLibVariantRecord.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) variantGetType_ value
    fun warnMessage
      (
        domain,
        file,
        line,
        func,
        warnexpr
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        warnMessage_
        (
          domain
           & file
           & line
           & func
           & warnexpr
        )
  end
