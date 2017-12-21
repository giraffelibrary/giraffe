structure GLib : G_LIB =
  struct
    structure GUInt8CVectorType =
      CValueCVectorType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVector = CVector(GUInt8CVectorType)
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    structure GLibDebugKeyRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GLibDebugKeyRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GLibDebugKeyRecordCVectorN = CVectorN(GLibDebugKeyRecordCVectorNType)
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
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessage_ =
        call (getSymbol "g_assertion_message")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessageCmpstr_ =
        call (getSymbol "g_assertion_message_cmpstr")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val base64Decode_ = call (getSymbol "g_base64_decode") (Utf8.PolyML.cInPtr &&> GUInt64.PolyML.cRef --> GUInt8CVectorN.PolyML.cOutPtr)
      val base64Encode_ = call (getSymbol "g_base64_encode") (GUInt8CVectorN.PolyML.cInPtr &&> GUInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val buildFilenamev_ = call (getSymbol "g_build_filenamev") (Utf8CVector.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val buildPathv_ = call (getSymbol "g_build_pathv") (Utf8.PolyML.cInPtr &&> Utf8CVector.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val chdir_ = call (getSymbol "g_chdir") (Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val checkVersion_ =
        call (getSymbol "glib_check_version")
          (
            GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val checksumTypeGetLength_ = call (getSymbol "g_checksum_type_get_length") (GLibChecksumType.PolyML.cVal --> GInt64.PolyML.cVal)
      val childWatchSourceNew_ = call (getSymbol "g_child_watch_source_new") (GInt32.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val close_ = call (getSymbol "g_close") (GInt32.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val computeChecksumForBytes_ = call (getSymbol "g_compute_checksum_for_bytes") (GLibChecksumType.PolyML.cVal &&> GLibBytesRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val computeChecksumForData_ =
        call (getSymbol "g_compute_checksum_for_data")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeChecksumForString_ =
        call (getSymbol "g_compute_checksum_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForBytes_ =
        call (getSymbol "g_compute_hmac_for_bytes")
          (
            GLibChecksumType.PolyML.cVal
             &&> GLibBytesRecord.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cPtr
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForData_ =
        call (getSymbol "g_compute_hmac_for_data")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForString_ =
        call (getSymbol "g_compute_hmac_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val convert_ =
        call (getSymbol "g_convert")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cRef
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val dateGetDaysInMonth_ = call (getSymbol "g_date_get_days_in_month") (GLibDateMonth.PolyML.cVal &&> GUInt16.PolyML.cVal --> GUInt8.PolyML.cVal)
      val dateGetMondayWeeksInYear_ = call (getSymbol "g_date_get_monday_weeks_in_year") (GUInt16.PolyML.cVal --> GUInt8.PolyML.cVal)
      val dateGetSundayWeeksInYear_ = call (getSymbol "g_date_get_sunday_weeks_in_year") (GUInt16.PolyML.cVal --> GUInt8.PolyML.cVal)
      val dateIsLeapYear_ = call (getSymbol "g_date_is_leap_year") (GUInt16.PolyML.cVal --> GBool.PolyML.cVal)
      val dateStrftime_ =
        call (getSymbol "g_date_strftime")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibDateRecord.PolyML.cPtr
             --> GUInt64.PolyML.cVal
          )
      val dateValidDay_ = call (getSymbol "g_date_valid_day") (GUInt8.PolyML.cVal --> GBool.PolyML.cVal)
      val dateValidDmy_ =
        call (getSymbol "g_date_valid_dmy")
          (
            GUInt8.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GUInt16.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val dateValidJulian_ = call (getSymbol "g_date_valid_julian") (GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val dateValidMonth_ = call (getSymbol "g_date_valid_month") (GLibDateMonth.PolyML.cVal --> GBool.PolyML.cVal)
      val dateValidWeekday_ = call (getSymbol "g_date_valid_weekday") (GLibDateWeekday.PolyML.cVal --> GBool.PolyML.cVal)
      val dateValidYear_ = call (getSymbol "g_date_valid_year") (GUInt16.PolyML.cVal --> GBool.PolyML.cVal)
      val dcgettext_ =
        call (getSymbol "g_dcgettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dgettext_ = call (getSymbol "g_dgettext") (Utf8.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val dirMakeTmp_ = call (getSymbol "g_dir_make_tmp") (Utf8.PolyML.cInOptPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val dngettext_ =
        call (getSymbol "g_dngettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext_ =
        call (getSymbol "g_dpgettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext2_ =
        call (getSymbol "g_dpgettext2")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val environGetenv_ = call (getSymbol "g_environ_getenv") (Utf8CVector.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameDisplayBasename_ = call (getSymbol "g_filename_display_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameDisplayName_ = call (getSymbol "g_filename_display_name") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameFromUri_ =
        call (getSymbol "g_filename_from_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameFromUtf8_ =
        call (getSymbol "g_filename_from_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8CVectorN.PolyML.cOutPtr
          )
      val filenameToUri_ =
        call (getSymbol "g_filename_to_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameToUtf8_ =
        call (getSymbol "g_filename_to_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val findProgramInPath_ = call (getSymbol "g_find_program_in_path") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val formatSize_ = call (getSymbol "g_format_size") (GUInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeForDisplay_ = call (getSymbol "g_format_size_for_display") (GInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeFull_ = call (getSymbol "g_format_size_full") (GUInt64.PolyML.cVal &&> GLibFormatSizeFlags.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getApplicationName_ = call (getSymbol "g_get_application_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCodeset_ = call (getSymbol "g_get_codeset") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentDir_ = call (getSymbol "g_get_current_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentTime_ = call (getSymbol "g_get_current_time") (GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val getEnviron_ = call (getSymbol "g_get_environ") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getHomeDir_ = call (getSymbol "g_get_home_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getHostName_ = call (getSymbol "g_get_host_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getLanguageNames_ = call (getSymbol "g_get_language_names") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getLocaleVariants_ = call (getSymbol "g_get_locale_variants") (Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val getMonotonicTime_ = call (getSymbol "g_get_monotonic_time") (cVoid --> GInt64.PolyML.cVal)
      val getNumProcessors_ = call (getSymbol "g_get_num_processors") (cVoid --> GUInt32.PolyML.cVal)
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
      val hookDestroy_ = call (getSymbol "g_hook_destroy") (GLibHookListRecord.PolyML.cPtr &&> GUInt64.PolyML.cVal --> GBool.PolyML.cVal)
      val hookDestroyLink_ = call (getSymbol "g_hook_destroy_link") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> cVoid)
      val hookFree_ = call (getSymbol "g_hook_free") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> cVoid)
      val hookInsertBefore_ =
        call (getSymbol "g_hook_insert_before")
          (
            GLibHookListRecord.PolyML.cPtr
             &&> GLibHookRecord.PolyML.cOptPtr
             &&> GLibHookRecord.PolyML.cPtr
             --> cVoid
          )
      val hookPrepend_ = call (getSymbol "g_hook_prepend") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> cVoid)
      val hookUnref_ = call (getSymbol "g_hook_unref") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> cVoid)
      val hostnameIsAsciiEncoded_ = call (getSymbol "g_hostname_is_ascii_encoded") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameIsIpAddress_ = call (getSymbol "g_hostname_is_ip_address") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameIsNonAscii_ = call (getSymbol "g_hostname_is_non_ascii") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameToAscii_ = call (getSymbol "g_hostname_to_ascii") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hostnameToUnicode_ = call (getSymbol "g_hostname_to_unicode") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val idleSourceNew_ = call (getSymbol "g_idle_source_new") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val ioChannelErrorFromErrno_ = call (getSymbol "g_io_channel_error_from_errno") (GInt32.PolyML.cVal --> GLibIOChannelError.PolyML.cVal)
      val ioCreateWatch_ = call (getSymbol "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val listenv_ = call (getSymbol "g_listenv") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val localeFromUtf8_ =
        call (getSymbol "g_locale_from_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val localeToUtf8_ =
        call (getSymbol "g_locale_to_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GInt64.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GUInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val logRemoveHandler_ = call (getSymbol "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val logSetAlwaysFatal_ = call (getSymbol "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (getSymbol "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logVariant_ =
        call (getSymbol "g_log_variant")
          (
            Utf8.PolyML.cInOptPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val logWriterIsJournald_ = call (getSymbol "g_log_writer_is_journald") (GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val logWriterSupportsColor_ = call (getSymbol "g_log_writer_supports_color") (GInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val mainContextDefault_ = call (getSymbol "g_main_context_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainContextGetThreadDefault_ = call (getSymbol "g_main_context_get_thread_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainContextRefThreadDefault_ = call (getSymbol "g_main_context_ref_thread_default") (cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainCurrentSource_ = call (getSymbol "g_main_current_source") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (getSymbol "g_main_depth") (cVoid --> GInt32.PolyML.cVal)
      val markupEscapeText_ = call (getSymbol "g_markup_escape_text") (Utf8.PolyML.cInPtr &&> GInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val mkdirWithParents_ = call (getSymbol "g_mkdir_with_parents") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val mkdtemp_ = call (getSymbol "g_mkdtemp") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val mkdtempFull_ = call (getSymbol "g_mkdtemp_full") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val mkstemp_ = call (getSymbol "g_mkstemp") (Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val mkstempFull_ =
        call (getSymbol "g_mkstemp_full")
          (
            Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val onErrorQuery_ = call (getSymbol "g_on_error_query") (Utf8.PolyML.cInPtr --> cVoid)
      val onErrorStackTrace_ = call (getSymbol "g_on_error_stack_trace") (Utf8.PolyML.cInPtr --> cVoid)
      val parseDebugString_ =
        call (getSymbol "g_parse_debug_string")
          (
            Utf8.PolyML.cInOptPtr
             &&> GLibDebugKeyRecordCVectorN.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             --> GUInt32.PolyML.cVal
          )
      val pathGetBasename_ = call (getSymbol "g_path_get_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathGetDirname_ = call (getSymbol "g_path_get_dirname") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathIsAbsolute_ = call (getSymbol "g_path_is_absolute") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val pathSkipRoot_ = call (getSymbol "g_path_skip_root") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val patternMatch_ =
        call (getSymbol "g_pattern_match")
          (
            GLibPatternSpecRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GBool.PolyML.cVal
          )
      val patternMatchSimple_ = call (getSymbol "g_pattern_match_simple") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val patternMatchString_ = call (getSymbol "g_pattern_match_string") (GLibPatternSpecRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val randomDouble_ = call (getSymbol "g_random_double") (cVoid --> GDouble.PolyML.cVal)
      val randomDoubleRange_ = call (getSymbol "g_random_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val randomInt_ = call (getSymbol "g_random_int") (cVoid --> GUInt32.PolyML.cVal)
      val randomIntRange_ = call (getSymbol "g_random_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val randomSetSeed_ = call (getSymbol "g_random_set_seed") (GUInt32.PolyML.cVal --> cVoid)
      val regexCheckReplacement_ =
        call (getSymbol "g_regex_check_replacement")
          (
            Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val regexEscapeNul_ = call (getSymbol "g_regex_escape_nul") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val regexMatchSimple_ =
        call (getSymbol "g_regex_match_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val regexSplitSimple_ =
        call (getSymbol "g_regex_split_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> Utf8CVector.PolyML.cOutPtr
          )
      val reloadUserSpecialDirsCache_ = call (getSymbol "g_reload_user_special_dirs_cache") (cVoid --> cVoid)
      val rmdir_ = call (getSymbol "g_rmdir") (Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val sequenceMove_ = call (getSymbol "g_sequence_move") (GLibSequenceIterRecord.PolyML.cPtr &&> GLibSequenceIterRecord.PolyML.cPtr --> cVoid)
      val sequenceMoveRange_ =
        call (getSymbol "g_sequence_move_range")
          (
            GLibSequenceIterRecord.PolyML.cPtr
             &&> GLibSequenceIterRecord.PolyML.cPtr
             &&> GLibSequenceIterRecord.PolyML.cPtr
             --> cVoid
          )
      val sequenceRemove_ = call (getSymbol "g_sequence_remove") (GLibSequenceIterRecord.PolyML.cPtr --> cVoid)
      val sequenceRemoveRange_ = call (getSymbol "g_sequence_remove_range") (GLibSequenceIterRecord.PolyML.cPtr &&> GLibSequenceIterRecord.PolyML.cPtr --> cVoid)
      val sequenceSwap_ = call (getSymbol "g_sequence_swap") (GLibSequenceIterRecord.PolyML.cPtr &&> GLibSequenceIterRecord.PolyML.cPtr --> cVoid)
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
             &&> GInt32.PolyML.cRef
             &&> Utf8CVectorN.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shellQuote_ = call (getSymbol "g_shell_quote") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val shellUnquote_ = call (getSymbol "g_shell_unquote") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val sliceGetConfig_ = call (getSymbol "g_slice_get_config") (GLibSliceConfig.PolyML.cVal --> GInt64.PolyML.cVal)
      val sliceSetConfig_ = call (getSymbol "g_slice_set_config") (GLibSliceConfig.PolyML.cVal &&> GInt64.PolyML.cVal --> cVoid)
      val sourceRemove_ = call (getSymbol "g_source_remove") (GUInt32.PolyML.cVal --> GBool.PolyML.cVal)
      val sourceSetNameById_ = call (getSymbol "g_source_set_name_by_id") (GUInt32.PolyML.cVal &&> Utf8.PolyML.cInPtr --> cVoid)
      val spawnCheckExitStatus_ = call (getSymbol "g_spawn_check_exit_status") (GInt32.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val spawnClosePid_ = call (getSymbol "g_spawn_close_pid") (GInt32.PolyML.cVal --> cVoid)
      val spawnCommandLineAsync_ = call (getSymbol "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val spawnCommandLineSync_ =
        call (getSymbol "g_spawn_command_line_sync")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt8CVector.PolyML.cOutRef
             &&> GUInt8CVector.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val testAssertExpectedMessagesInternal_ =
        call (getSymbol "g_test_assert_expected_messages_internal")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testBug_ = call (getSymbol "g_test_bug") (Utf8.PolyML.cInPtr --> cVoid)
      val testBugBase_ = call (getSymbol "g_test_bug_base") (Utf8.PolyML.cInPtr --> cVoid)
      val testExpectMessage_ =
        call (getSymbol "g_test_expect_message")
          (
            Utf8.PolyML.cInOptPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testFail_ = call (getSymbol "g_test_fail") (cVoid --> cVoid)
      val testFailed_ = call (getSymbol "g_test_failed") (cVoid --> GBool.PolyML.cVal)
      val testGetDir_ = call (getSymbol "g_test_get_dir") (GLibTestFileType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val testIncomplete_ = call (getSymbol "g_test_incomplete") (Utf8.PolyML.cInOptPtr --> cVoid)
      val testLogTypeName_ = call (getSymbol "g_test_log_type_name") (GLibTestLogType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val testRandDouble_ = call (getSymbol "g_test_rand_double") (cVoid --> GDouble.PolyML.cVal)
      val testRandDoubleRange_ = call (getSymbol "g_test_rand_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val testRandInt_ = call (getSymbol "g_test_rand_int") (cVoid --> GInt32.PolyML.cVal)
      val testRandIntRange_ = call (getSymbol "g_test_rand_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val testRun_ = call (getSymbol "g_test_run") (cVoid --> GInt32.PolyML.cVal)
      val testRunSuite_ = call (getSymbol "g_test_run_suite") (GLibTestSuiteRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val testSetNonfatalAssertions_ = call (getSymbol "g_test_set_nonfatal_assertions") (cVoid --> cVoid)
      val testSkip_ = call (getSymbol "g_test_skip") (Utf8.PolyML.cInOptPtr --> cVoid)
      val testSubprocess_ = call (getSymbol "g_test_subprocess") (cVoid --> GBool.PolyML.cVal)
      val testTimerElapsed_ = call (getSymbol "g_test_timer_elapsed") (cVoid --> GDouble.PolyML.cVal)
      val testTimerLast_ = call (getSymbol "g_test_timer_last") (cVoid --> GDouble.PolyML.cVal)
      val testTimerStart_ = call (getSymbol "g_test_timer_start") (cVoid --> cVoid)
      val testTrapAssertions_ =
        call (getSymbol "g_test_trap_assertions")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testTrapFork_ = call (getSymbol "g_test_trap_fork") (GUInt64.PolyML.cVal &&> GLibTestTrapFlags.PolyML.cVal --> GBool.PolyML.cVal)
      val testTrapHasPassed_ = call (getSymbol "g_test_trap_has_passed") (cVoid --> GBool.PolyML.cVal)
      val testTrapReachedTimeout_ = call (getSymbol "g_test_trap_reached_timeout") (cVoid --> GBool.PolyML.cVal)
      val testTrapSubprocess_ =
        call (getSymbol "g_test_trap_subprocess")
          (
            Utf8.PolyML.cInOptPtr
             &&> GUInt64.PolyML.cVal
             &&> GLibTestSubprocessFlags.PolyML.cVal
             --> cVoid
          )
      val threadPoolGetMaxIdleTime_ = call (getSymbol "g_thread_pool_get_max_idle_time") (cVoid --> GUInt32.PolyML.cVal)
      val threadPoolGetMaxUnusedThreads_ = call (getSymbol "g_thread_pool_get_max_unused_threads") (cVoid --> GInt32.PolyML.cVal)
      val threadPoolGetNumUnusedThreads_ = call (getSymbol "g_thread_pool_get_num_unused_threads") (cVoid --> GUInt32.PolyML.cVal)
      val threadPoolSetMaxIdleTime_ = call (getSymbol "g_thread_pool_set_max_idle_time") (GUInt32.PolyML.cVal --> cVoid)
      val threadPoolSetMaxUnusedThreads_ = call (getSymbol "g_thread_pool_set_max_unused_threads") (GInt32.PolyML.cVal --> cVoid)
      val threadPoolStopUnusedThreads_ = call (getSymbol "g_thread_pool_stop_unused_threads") (cVoid --> cVoid)
      val threadSelf_ = call (getSymbol "g_thread_self") (cVoid --> GLibThreadRecord.PolyML.cPtr)
      val threadYield_ = call (getSymbol "g_thread_yield") (cVoid --> cVoid)
      val timeValFromIso8601_ = call (getSymbol "g_time_val_from_iso8601") (Utf8.PolyML.cInPtr &&> GLibTimeValRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val timeoutSourceNew_ = call (getSymbol "g_timeout_source_new") (GUInt32.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val timeoutSourceNewSeconds_ = call (getSymbol "g_timeout_source_new_seconds") (GUInt32.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val trashStackHeight_ = call (getSymbol "g_trash_stack_height") (GLibTrashStackRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val unixFdSourceNew_ = call (getSymbol "g_unix_fd_source_new") (GInt32.PolyML.cVal &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val unixSetFdNonblocking_ =
        call (getSymbol "g_unix_set_fd_nonblocking")
          (
            GInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unixSignalSourceNew_ = call (getSymbol "g_unix_signal_source_new") (GInt32.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val unlink_ = call (getSymbol "g_unlink") (Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val unsetenv_ = call (getSymbol "g_unsetenv") (Utf8.PolyML.cInPtr --> cVoid)
      val uriEscapeString_ =
        call (getSymbol "g_uri_escape_string")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GBool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val uriListExtractUris_ = call (getSymbol "g_uri_list_extract_uris") (Utf8.PolyML.cInPtr --> Utf8CVector.PolyML.cOutPtr)
      val uriParseScheme_ = call (getSymbol "g_uri_parse_scheme") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val uriUnescapeSegment_ =
        call (getSymbol "g_uri_unescape_segment")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> Utf8.PolyML.cOutPtr
          )
      val uriUnescapeString_ = call (getSymbol "g_uri_unescape_string") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInOptPtr --> Utf8.PolyML.cOutPtr)
      val usleep_ = call (getSymbol "g_usleep") (GUInt64.PolyML.cVal --> cVoid)
      val variantIsObjectPath_ = call (getSymbol "g_variant_is_object_path") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val variantIsSignature_ = call (getSymbol "g_variant_is_signature") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val variantParse_ =
        call (getSymbol "g_variant_parse")
          (
            GLibVariantTypeRecord.PolyML.cOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val variantTypeChecked_ = call (getSymbol "g_variant_type_checked_") (Utf8.PolyML.cInPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val variantTypeStringIsValid_ = call (getSymbol "g_variant_type_string_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val variantTypeStringScan_ =
        call (getSymbol "g_variant_type_string_scan")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
    end
    structure Quark = GLibQuark
    structure PidType = GLibPidType
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure BytesRecord = GLibBytesRecord
    structure ChecksumRecord = GLibChecksumRecord
    structure ChecksumType = GLibChecksumType
    structure DateRecord = GLibDateRecord
    structure DateDMY = GLibDateDMY
    structure DateMonth = GLibDateMonth
    structure DateTimeRecord = GLibDateTimeRecord
    structure DateWeekday = GLibDateWeekday
    structure DebugKeyRecord = GLibDebugKeyRecord
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
    structure LogWriterOutput = GLibLogWriterOutput
    structure MainContextRecord = GLibMainContextRecord
    structure MarkupCollectType = GLibMarkupCollectType
    structure MarkupParseContextRecord = GLibMarkupParseContextRecord
    structure MarkupParseFlags = GLibMarkupParseFlags
    structure MatchInfoRecord = GLibMatchInfoRecord
    structure NormalizeMode = GLibNormalizeMode
    structure OnceStatus = GLibOnceStatus
    structure OptionArg = GLibOptionArg
    structure OptionEntryRecord = GLibOptionEntryRecord
    structure OptionFlags = GLibOptionFlags
    structure OptionGroupRecord = GLibOptionGroupRecord
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
    structure TestFileType = GLibTestFileType
    structure TestLogType = GLibTestLogType
    structure TestSubprocessFlags = GLibTestSubprocessFlags
    structure TestSuiteRecord = GLibTestSuiteRecord
    structure TestTrapFlags = GLibTestTrapFlags
    structure TimeType = GLibTimeType
    structure TimeValRecord = GLibTimeValRecord
    structure TimeZoneRecord = GLibTimeZoneRecord
    structure TokenType = GLibTokenType
    structure TraverseFlags = GLibTraverseFlags
    structure TraverseType = GLibTraverseType
    structure UnicodeType = GLibUnicodeType
    structure UserDirectory = GLibUserDirectory
    structure VariantRecord = GLibVariantRecord
    structure VariantBuilderRecord = GLibVariantBuilderRecord
    structure VariantClass = GLibVariantClass
    structure VariantDictRecord = GLibVariantDictRecord
    structure VariantTypeRecord = GLibVariantTypeRecord
    structure Pid = GLibPid
    structure IOFunc = GLibIOFunc
    structure ErrorRecord = GLibErrorRecord
    structure Bytes = GLibBytes
    structure Checksum = GLibChecksum
    structure Date = GLibDate
    structure DateTime = GLibDateTime
    structure DebugKey = GLibDebugKey
    structure KeyFile = GLibKeyFile
    structure MainContext = GLibMainContext
    structure MarkupParseContext = GLibMarkupParseContext
    structure MatchInfo = GLibMatchInfo
    structure OptionEntry = GLibOptionEntry
    structure OptionGroup = GLibOptionGroup
    structure PatternSpec = GLibPatternSpec
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure String = GLibString
    structure TestCase = GLibTestCase
    structure TestSuite = GLibTestSuite
    structure TimeVal = GLibTimeVal
    structure TimeZone = GLibTimeZone
    structure Variant = GLibVariant
    structure VariantBuilder = GLibVariantBuilder
    structure VariantDict = GLibVariantDict
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
    structure VariantParseError = GLibVariantParseError
    exception VariantParseError = GLibVariantParseError
    structure IOChannel = GLibIOChannel
    val ANALYZER_ANALYZING = 1
    val KEY_FILE_DESKTOP_GROUP = "Desktop Entry"
    val KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions"
    val KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories"
    val KEY_FILE_DESKTOP_KEY_COMMENT = "Comment"
    val KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable"
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
    val MAXINT16 = 32767
    val MAXINT32 = 2147483647
    val MAXINT64 = 9223372036854775807
    val MAXINT8 = 127
    val MAXUINT16 = 65535
    val MAXUINT32 = 4294967295
    val MAXUINT64 = 18446744073709551615
    val MAXUINT8 = 255
    val MICRO_VERSION = 0
    val MININT16 = ~32768
    val MININT32 = ~2147483648
    val MININT64 = ~9223372036854775808
    val MININT8 = ~128
    val MINOR_VERSION = 50
    val PRIORITY_DEFAULT = 0
    val PRIORITY_DEFAULT_IDLE = 200
    val PRIORITY_HIGH = ~100
    val PRIORITY_HIGH_IDLE = 100
    val PRIORITY_LOW = 300
    val SOURCE_CONTINUE = true
    val SOURCE_REMOVE = false
    val TIME_SPAN_DAY = 86400000000
    val TIME_SPAN_HOUR = 3600000000
    val TIME_SPAN_MILLISECOND = 1000
    val TIME_SPAN_MINUTE = 60000000
    val TIME_SPAN_SECOND = 1000000
    val UNICHAR_MAX_DECOMPOSITION_LENGTH = 18
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
    val VERSION_MIN_REQUIRED = 2
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
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
    fun base64Decode text =
      let
        val outLen & retVal = (Utf8.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && GUInt8CVectorN.FFI.fromPtr 1) base64Decode_ (text & GUInt64.null)
      in
        retVal (LargeInt.toInt outLen)
      end
    fun base64Encode data =
      let
        val len = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal = (GUInt8CVectorN.FFI.withPtr &&&> GUInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) base64Encode_ (data & len)
      in
        retVal
      end
    fun buildFilenamev args = (Utf8CVector.FFI.withPtr ---> Utf8.FFI.fromPtr 1) buildFilenamev_ args
    fun buildPathv (separator, args) = (Utf8.FFI.withPtr &&&> Utf8CVector.FFI.withPtr ---> Utf8.FFI.fromPtr 1) buildPathv_ (separator & args)
    fun chdir path = (Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) chdir_ path
    fun checkVersion
      (
        requiredMajor,
        requiredMinor,
        requiredMicro
      ) =
      (
        GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun checksumTypeGetLength checksumType = (GLibChecksumType.FFI.withVal ---> GInt64.FFI.fromVal) checksumTypeGetLength_ checksumType
    fun childWatchSourceNew pid = (GInt32.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) childWatchSourceNew_ pid
    fun close fd = (GInt32.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore) close_ (fd & [])
    fun computeChecksumForBytes (checksumType, data) = (GLibChecksumType.FFI.withVal &&&> GLibBytesRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) computeChecksumForBytes_ (checksumType & data)
    fun computeChecksumForData (checksumType, data) =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             ---> Utf8.FFI.fromPtr 1
          )
            computeChecksumForData_
            (
              checksumType
               & data
               & length
            )
      in
        retVal
      end
    fun computeChecksumForString
      (
        checksumType,
        str,
        length
      ) =
      (
        GLibChecksumType.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GInt64.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        computeChecksumForString_
        (
          checksumType
           & str
           & length
        )
    fun computeHmacForBytes
      (
        digestType,
        key,
        data
      ) =
      (
        GLibChecksumType.FFI.withVal
         &&&> GLibBytesRecord.FFI.withPtr
         &&&> GLibBytesRecord.FFI.withPtr
         ---> Utf8.FFI.fromPtr 1
      )
        computeHmacForBytes_
        (
          digestType
           & key
           & data
        )
    fun computeHmacForData
      (
        digestType,
        key,
        data
      ) =
      let
        val keyLen = LargeInt.fromInt (GUInt8CVectorN.length key)
        val length = LargeInt.fromInt (GUInt8CVectorN.length data)
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             ---> Utf8.FFI.fromPtr 1
          )
            computeHmacForData_
            (
              digestType
               & key
               & keyLen
               & data
               & length
            )
      in
        retVal
      end
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
             &&&> GUInt64.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GInt64.FFI.withVal
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
             &&&> GInt64.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
          )
            convert_
            (
              str
               & len
               & toCodeset
               & fromCodeset
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun dateGetDaysInMonth (month, year) = (GLibDateMonth.FFI.withVal &&&> GUInt16.FFI.withVal ---> GUInt8.FFI.fromVal) dateGetDaysInMonth_ (month & year)
    fun dateGetMondayWeeksInYear year = (GUInt16.FFI.withVal ---> GUInt8.FFI.fromVal) dateGetMondayWeeksInYear_ year
    fun dateGetSundayWeeksInYear year = (GUInt16.FFI.withVal ---> GUInt8.FFI.fromVal) dateGetSundayWeeksInYear_ year
    fun dateIsLeapYear year = (GUInt16.FFI.withVal ---> GBool.FFI.fromVal) dateIsLeapYear_ year
    fun dateStrftime
      (
        s,
        slen,
        format,
        date
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GLibDateRecord.FFI.withPtr
         ---> GUInt64.FFI.fromVal
      )
        dateStrftime_
        (
          s
           & slen
           & format
           & date
        )
    fun dateValidDay day = (GUInt8.FFI.withVal ---> GBool.FFI.fromVal) dateValidDay_ day
    fun dateValidDmy
      (
        day,
        month,
        year
      ) =
      (
        GUInt8.FFI.withVal
         &&&> GLibDateMonth.FFI.withVal
         &&&> GUInt16.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        dateValidDmy_
        (
          day
           & month
           & year
        )
    fun dateValidJulian julianDate = (GUInt32.FFI.withVal ---> GBool.FFI.fromVal) dateValidJulian_ julianDate
    fun dateValidMonth month = (GLibDateMonth.FFI.withVal ---> GBool.FFI.fromVal) dateValidMonth_ month
    fun dateValidWeekday weekday = (GLibDateWeekday.FFI.withVal ---> GBool.FFI.fromVal) dateValidWeekday_ weekday
    fun dateValidYear year = (GUInt16.FFI.withVal ---> GBool.FFI.fromVal) dateValidYear_ year
    fun dcgettext
      (
        domain,
        msgid,
        category
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        dcgettext_
        (
          domain
           & msgid
           & category
        )
    fun dgettext (domain, msgid) = (Utf8.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) dgettext_ (domain & msgid)
    fun dirMakeTmp tmpl = (Utf8.FFI.withOptPtr &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr 1) dirMakeTmp_ (tmpl & [])
    fun dngettext
      (
        domain,
        msgid,
        msgidPlural,
        n
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
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
        Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt64.FFI.withVal
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
        Utf8.FFI.withOptPtr
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
    fun environGetenv (envp, variable) = (Utf8CVector.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) environGetenv_ (envp & variable)
    fun filenameDisplayBasename filename = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) filenameDisplayBasename_ filename
    fun filenameDisplayName filename = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) filenameDisplayName_ filename
    fun filenameFromUri uri =
      let
        val hostname & retVal =
          (
            Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && Utf8.FFI.fromPtr 1
          )
            filenameFromUri_
            (
              uri
               & NONE
               & []
            )
      in
        (retVal, hostname)
      end
    fun filenameFromUtf8 (utf8string, len) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && GUInt8CVectorN.FFI.fromPtr 1
          )
            filenameFromUtf8_
            (
              utf8string
               & len
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (retVal (LargeInt.toInt bytesWritten), bytesRead)
      end
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
    fun filenameToUtf8 (opsysstring, len) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
          )
            filenameToUtf8_
            (
              opsysstring
               & len
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun findProgramInPath program = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) findProgramInPath_ program
    fun formatSize size = (GUInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSize_ size
    fun formatSizeForDisplay size = (GInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSizeForDisplay_ size
    fun formatSizeFull (size, flags) = (GUInt64.FFI.withVal &&&> GLibFormatSizeFlags.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSizeFull_ (size & flags)
    fun getApplicationName () = (I ---> Utf8.FFI.fromPtr 0) getApplicationName_ ()
    fun getCodeset () = (I ---> Utf8.FFI.fromPtr 1) getCodeset_ ()
    fun getCurrentDir () = (I ---> Utf8.FFI.fromPtr 1) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.FFI.withPtr ---> I) getCurrentTime_ result
    fun getEnviron () = (I ---> Utf8CVector.FFI.fromPtr 2) getEnviron_ ()
    fun getHomeDir () = (I ---> Utf8.FFI.fromPtr 0) getHomeDir_ ()
    fun getHostName () = (I ---> Utf8.FFI.fromPtr 0) getHostName_ ()
    fun getLanguageNames () = (I ---> Utf8CVector.FFI.fromPtr 0) getLanguageNames_ ()
    fun getLocaleVariants locale = (Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getLocaleVariants_ locale
    fun getMonotonicTime () = (I ---> GInt64.FFI.fromVal) getMonotonicTime_ ()
    fun getNumProcessors () = (I ---> GUInt32.FFI.fromVal) getNumProcessors_ ()
    fun getPrgname () = (I ---> Utf8.FFI.fromPtr 0) getPrgname_ ()
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
    fun hookDestroy (hookList, hookId) = (GLibHookListRecord.FFI.withPtr &&&> GUInt64.FFI.withVal ---> GBool.FFI.fromVal) hookDestroy_ (hookList & hookId)
    fun hookDestroyLink (hookList, hook) = (GLibHookListRecord.FFI.withPtr &&&> GLibHookRecord.FFI.withPtr ---> I) hookDestroyLink_ (hookList & hook)
    fun hookFree (hookList, hook) = (GLibHookListRecord.FFI.withPtr &&&> GLibHookRecord.FFI.withPtr ---> I) hookFree_ (hookList & hook)
    fun hookInsertBefore
      (
        hookList,
        sibling,
        hook
      ) =
      (
        GLibHookListRecord.FFI.withPtr
         &&&> GLibHookRecord.FFI.withOptPtr
         &&&> GLibHookRecord.FFI.withPtr
         ---> I
      )
        hookInsertBefore_
        (
          hookList
           & sibling
           & hook
        )
    fun hookPrepend (hookList, hook) = (GLibHookListRecord.FFI.withPtr &&&> GLibHookRecord.FFI.withPtr ---> I) hookPrepend_ (hookList & hook)
    fun hookUnref (hookList, hook) = (GLibHookListRecord.FFI.withPtr &&&> GLibHookRecord.FFI.withPtr ---> I) hookUnref_ (hookList & hook)
    fun hostnameIsAsciiEncoded hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) hostnameToUnicode_ hostname
    fun idleSourceNew () = (I ---> GLibSourceRecord.FFI.fromPtr true) idleSourceNew_ ()
    fun ioChannelErrorFromErrno en = (GInt32.FFI.withVal ---> GLibIOChannelError.FFI.fromVal) ioChannelErrorFromErrno_ en
    fun ioCreateWatch (channel, condition) = (GLibIOChannelRecord.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) ioCreateWatch_ (channel & condition)
    fun listenv () = (I ---> Utf8CVector.FFI.fromPtr 2) listenv_ ()
    fun localeFromUtf8 (utf8string, len) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
          )
            localeFromUtf8_
            (
              utf8string
               & len
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun localeToUtf8 (opsysstring, len) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
          )
            localeToUtf8_
            (
              opsysstring
               & len
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun logRemoveHandler (logDomain, handlerId) = (Utf8.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask (logDomain, fatalMask) = (Utf8.FFI.withPtr &&&> GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun logVariant
      (
        logDomain,
        logLevel,
        fields
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> GLibVariantRecord.FFI.withPtr
         ---> I
      )
        logVariant_
        (
          logDomain
           & logLevel
           & fields
        )
    fun logWriterIsJournald outputFd = (GInt32.FFI.withVal ---> GBool.FFI.fromVal) logWriterIsJournald_ outputFd
    fun logWriterSupportsColor outputFd = (GInt32.FFI.withVal ---> GBool.FFI.fromVal) logWriterSupportsColor_ outputFd
    fun mainContextDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr false) mainContextDefault_ ()
    fun mainContextGetThreadDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr false) mainContextGetThreadDefault_ ()
    fun mainContextRefThreadDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr true) mainContextRefThreadDefault_ ()
    fun mainCurrentSource () = (I ---> GLibSourceRecord.FFI.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> GInt32.FFI.fromVal) mainDepth_ ()
    fun markupEscapeText (text, length) = (Utf8.FFI.withPtr &&&> GInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) markupEscapeText_ (text & length)
    fun mkdirWithParents (pathname, mode) = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) mkdirWithParents_ (pathname & mode)
    fun mkdtemp tmpl = (Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) mkdtemp_ tmpl
    fun mkdtempFull (tmpl, mode) = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 1) mkdtempFull_ (tmpl & mode)
    fun mkstemp tmpl = (Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) mkstemp_ tmpl
    fun mkstempFull
      (
        tmpl,
        flags,
        mode
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        mkstempFull_
        (
          tmpl
           & flags
           & mode
        )
    fun onErrorQuery prgName = (Utf8.FFI.withPtr ---> I) onErrorQuery_ prgName
    fun onErrorStackTrace prgName = (Utf8.FFI.withPtr ---> I) onErrorStackTrace_ prgName
    fun parseDebugString (string, keys) =
      let
        val nkeys = LargeInt.fromInt (GLibDebugKeyRecordCVectorN.length keys)
        val retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> GLibDebugKeyRecordCVectorN.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             ---> GUInt32.FFI.fromVal
          )
            parseDebugString_
            (
              string
               & keys
               & nkeys
            )
      in
        retVal
      end
    fun pathGetBasename fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) pathGetBasename_ fileName
    fun pathGetDirname fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) pathGetDirname_ fileName
    fun pathIsAbsolute fileName = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) pathIsAbsolute_ fileName
    fun pathSkipRoot fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) pathSkipRoot_ fileName
    fun patternMatch
      (
        pspec,
        stringLength,
        string,
        stringReversed
      ) =
      (
        GLibPatternSpecRecord.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
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
    fun regexCheckReplacement replacement =
      let
        val hasReferences & () =
          (
            Utf8.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && ignore
          )
            regexCheckReplacement_
            (
              replacement
               & GBool.null
               & []
            )
      in
        hasReferences
      end
    fun regexEscapeNul (string, length) = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 1) regexEscapeNul_ (string & length)
    fun regexMatchSimple
      (
        pattern,
        string,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        regexMatchSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
    fun regexSplitSimple
      (
        pattern,
        string,
        compileOptions,
        matchOptions
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibRegexCompileFlags.FFI.withVal
         &&&> GLibRegexMatchFlags.FFI.withVal
         ---> Utf8CVector.FFI.fromPtr 2
      )
        regexSplitSimple_
        (
          pattern
           & string
           & compileOptions
           & matchOptions
        )
    fun reloadUserSpecialDirsCache () = (I ---> I) reloadUserSpecialDirsCache_ ()
    fun rmdir filename = (Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) rmdir_ filename
    fun sequenceMove (src, dest) = (GLibSequenceIterRecord.FFI.withPtr &&&> GLibSequenceIterRecord.FFI.withPtr ---> I) sequenceMove_ (src & dest)
    fun sequenceMoveRange
      (
        dest,
        begin,
        end'
      ) =
      (
        GLibSequenceIterRecord.FFI.withPtr
         &&&> GLibSequenceIterRecord.FFI.withPtr
         &&&> GLibSequenceIterRecord.FFI.withPtr
         ---> I
      )
        sequenceMoveRange_
        (
          dest
           & begin
           & end'
        )
    fun sequenceRemove iter = (GLibSequenceIterRecord.FFI.withPtr ---> I) sequenceRemove_ iter
    fun sequenceRemoveRange (begin, end') = (GLibSequenceIterRecord.FFI.withPtr &&&> GLibSequenceIterRecord.FFI.withPtr ---> I) sequenceRemoveRange_ (begin & end')
    fun sequenceSwap (a, b) = (GLibSequenceIterRecord.FFI.withPtr &&&> GLibSequenceIterRecord.FFI.withPtr ---> I) sequenceSwap_ (a & b)
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
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> Utf8CVectorN.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt32.FFI.fromVal
                   && Utf8CVectorN.FFI.fromPtr 2
                   && ignore
          )
            shellParseArgv_
            (
              commandLine
               & GInt32.null
               & NONE
               & []
            )
      in
        argvp (LargeInt.toInt argcp)
      end
    fun shellQuote unquotedString = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr 1) shellUnquote_ (quotedString & [])
    fun sliceGetConfig ckey = (GLibSliceConfig.FFI.withVal ---> GInt64.FFI.fromVal) sliceGetConfig_ ckey
    fun sliceSetConfig (ckey, value) = (GLibSliceConfig.FFI.withVal &&&> GInt64.FFI.withVal ---> I) sliceSetConfig_ (ckey & value)
    fun sourceRemove tag = (GUInt32.FFI.withVal ---> GBool.FFI.fromVal) sourceRemove_ tag
    fun sourceSetNameById (tag, name) = (GUInt32.FFI.withVal &&&> Utf8.FFI.withPtr ---> I) sourceSetNameById_ (tag & name)
    fun spawnCheckExitStatus exitStatus = (GInt32.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore) spawnCheckExitStatus_ (exitStatus & [])
    fun spawnClosePid pid = (GInt32.FFI.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) spawnCommandLineAsync_ (commandLine & [])
    fun spawnCommandLineSync commandLine =
      let
        val standardOutput
         & standardError
         & exitStatus
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GUInt8CVector.FFI.withRefOptPtr
             &&&> GUInt8CVector.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CVector.FFI.fromPtr 1
                   && GUInt8CVector.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && ignore
          )
            spawnCommandLineSync_
            (
              commandLine
               & NONE
               & NONE
               & GInt32.null
               & []
            )
      in
        (
          standardOutput,
          standardError,
          exitStatus
        )
      end
    fun testAssertExpectedMessagesInternal
      (
        domain,
        file,
        line,
        func
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        testAssertExpectedMessagesInternal_
        (
          domain
           & file
           & line
           & func
        )
    fun testBug bugUriSnippet = (Utf8.FFI.withPtr ---> I) testBug_ bugUriSnippet
    fun testBugBase uriPattern = (Utf8.FFI.withPtr ---> I) testBugBase_ uriPattern
    fun testExpectMessage
      (
        logDomain,
        logLevel,
        pattern
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        testExpectMessage_
        (
          logDomain
           & logLevel
           & pattern
        )
    fun testFail () = (I ---> I) testFail_ ()
    fun testFailed () = (I ---> GBool.FFI.fromVal) testFailed_ ()
    fun testGetDir fileType = (GLibTestFileType.FFI.withVal ---> Utf8.FFI.fromPtr 0) testGetDir_ fileType
    fun testIncomplete msg = (Utf8.FFI.withOptPtr ---> I) testIncomplete_ msg
    fun testLogTypeName logType = (GLibTestLogType.FFI.withVal ---> Utf8.FFI.fromPtr 0) testLogTypeName_ logType
    fun testRandDouble () = (I ---> GDouble.FFI.fromVal) testRandDouble_ ()
    fun testRandDoubleRange (rangeStart, rangeEnd) = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal) testRandDoubleRange_ (rangeStart & rangeEnd)
    fun testRandInt () = (I ---> GInt32.FFI.fromVal) testRandInt_ ()
    fun testRandIntRange (begin, end') = (GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) testRandIntRange_ (begin & end')
    fun testRun () = (I ---> GInt32.FFI.fromVal) testRun_ ()
    fun testRunSuite suite = (GLibTestSuiteRecord.FFI.withPtr ---> GInt32.FFI.fromVal) testRunSuite_ suite
    fun testSetNonfatalAssertions () = (I ---> I) testSetNonfatalAssertions_ ()
    fun testSkip msg = (Utf8.FFI.withOptPtr ---> I) testSkip_ msg
    fun testSubprocess () = (I ---> GBool.FFI.fromVal) testSubprocess_ ()
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
         &&&> GInt32.FFI.withVal
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
    fun testTrapSubprocess
      (
        testPath,
        usecTimeout,
        testFlags
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> GUInt64.FFI.withVal
         &&&> GLibTestSubprocessFlags.FFI.withVal
         ---> I
      )
        testTrapSubprocess_
        (
          testPath
           & usecTimeout
           & testFlags
        )
    fun threadPoolGetMaxIdleTime () = (I ---> GUInt32.FFI.fromVal) threadPoolGetMaxIdleTime_ ()
    fun threadPoolGetMaxUnusedThreads () = (I ---> GInt32.FFI.fromVal) threadPoolGetMaxUnusedThreads_ ()
    fun threadPoolGetNumUnusedThreads () = (I ---> GUInt32.FFI.fromVal) threadPoolGetNumUnusedThreads_ ()
    fun threadPoolSetMaxIdleTime interval = (GUInt32.FFI.withVal ---> I) threadPoolSetMaxIdleTime_ interval
    fun threadPoolSetMaxUnusedThreads maxThreads = (GInt32.FFI.withVal ---> I) threadPoolSetMaxUnusedThreads_ maxThreads
    fun threadPoolStopUnusedThreads () = (I ---> I) threadPoolStopUnusedThreads_ ()
    fun threadSelf () = (I ---> GLibThreadRecord.FFI.fromPtr true) threadSelf_ ()
    fun threadYield () = (I ---> I) threadYield_ ()
    fun timeValFromIso8601 isoDate =
      let
        val time & retVal = (Utf8.FFI.withPtr &&&> GLibTimeValRecord.FFI.withNewPtr ---> GLibTimeValRecord.FFI.fromPtr true && GBool.FFI.fromVal) timeValFromIso8601_ (isoDate & ())
      in
        if retVal then SOME time else NONE
      end
    fun timeoutSourceNew interval = (GUInt32.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) timeoutSourceNew_ interval
    fun timeoutSourceNewSeconds interval = (GUInt32.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) timeoutSourceNewSeconds_ interval
    fun trashStackHeight stackP = (GLibTrashStackRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) trashStackHeight_ stackP
    fun unixFdSourceNew (fd, condition) = (GInt32.FFI.withVal &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) unixFdSourceNew_ (fd & condition)
    fun unixSetFdNonblocking (fd, nonblock) =
      (
        GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        unixSetFdNonblocking_
        (
          fd
           & nonblock
           & []
        )
    fun unixSignalSourceNew signum = (GInt32.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) unixSignalSourceNew_ signum
    fun unlink filename = (Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) unlink_ filename
    fun unsetenv variable = (Utf8.FFI.withPtr ---> I) unsetenv_ variable
    fun uriEscapeString
      (
        unescaped,
        reservedCharsAllowed,
        allowUtf8
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriListExtractUris uriList = (Utf8.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) uriListExtractUris_ uriList
    fun uriParseScheme uri = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) uriParseScheme_ uri
    fun uriUnescapeSegment
      (
        escapedString,
        escapedStringEnd,
        illegalCharacters
      ) =
      (
        Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> Utf8.FFI.fromPtr 1
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString (escapedString, illegalCharacters) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> Utf8.FFI.fromPtr 1) uriUnescapeString_ (escapedString & illegalCharacters)
    fun usleep microseconds = (GUInt64.FFI.withVal ---> I) usleep_ microseconds
    fun variantIsObjectPath string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) variantIsObjectPath_ string
    fun variantIsSignature string = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) variantIsSignature_ string
    fun variantParse
      (
        type',
        text,
        limit,
        endptr
      ) =
      (
        GLibVariantTypeRecord.FFI.withOptPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        variantParse_
        (
          type'
           & text
           & limit
           & endptr
           & []
        )
    fun variantTypeChecked arg0 = (Utf8.FFI.withPtr ---> GLibVariantTypeRecord.FFI.fromPtr false) variantTypeChecked_ arg0
    fun variantTypeStringIsValid typeString = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) variantTypeStringIsValid_ typeString
    fun variantTypeStringScan (string, limit) =
      let
        val endptr & retVal =
          (
            Utf8.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             ---> Utf8.FFI.fromPtr 1 && GBool.FFI.fromVal
          )
            variantTypeStringScan_
            (
              string
               & limit
               & NONE
            )
      in
        if retVal then SOME endptr else NONE
      end
  end
