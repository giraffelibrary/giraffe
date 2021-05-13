structure GLib : G_LIB =
  struct
    local
      open PolyMLFFI
    in
      val assertWarning_ =
        call (externalFunctionSymbol "g_assert_warning")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessage_ =
        call (externalFunctionSymbol "g_assertion_message")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val assertionMessageCmpstr_ =
        call (externalFunctionSymbol "g_assertion_message_cmpstr")
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
      val base64Decode_ = call (externalFunctionSymbol "g_base64_decode") (Utf8.PolyML.cInPtr &&> GSize.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutPtr)
      val base64Encode_ = call (externalFunctionSymbol "g_base64_encode") (GUInt8CArrayN.PolyML.cInPtr &&> GSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val buildFilenamev_ = call (externalFunctionSymbol "g_build_filenamev") (Utf8CPtrArray.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val buildPathv_ = call (externalFunctionSymbol "g_build_pathv") (Utf8.PolyML.cInPtr &&> Utf8CPtrArray.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val canonicalizeFilename_ = call (externalFunctionSymbol "g_canonicalize_filename") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInOptPtr --> Utf8.PolyML.cOutPtr)
      val chdir_ = call (externalFunctionSymbol "g_chdir") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val checkVersion_ =
        call (externalFunctionSymbol "glib_check_version")
          (
            GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val childWatchAdd_ =
        call (externalFunctionSymbol "g_child_watch_add_full")
          (
            GInt.PolyML.cVal
             &&> GLibPid.PolyML.cVal
             &&> GLibChildWatchFunc.PolyML.cDispatchPtr
             &&> GLibChildWatchFunc.PolyML.cPtr
             &&> GLibChildWatchFunc.PolyML.cDestroyNotifyPtr
             --> GUInt.PolyML.cVal
          )
      val childWatchSourceNew_ = call (externalFunctionSymbol "g_child_watch_source_new") (GLibPid.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val close_ = call (externalFunctionSymbol "g_close") (GFileDesc.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val computeChecksumForBytes_ = call (externalFunctionSymbol "g_compute_checksum_for_bytes") (GLibChecksumType.PolyML.cVal &&> GLibBytesRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val computeChecksumForData_ =
        call (externalFunctionSymbol "g_compute_checksum_for_data")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeChecksumForString_ =
        call (externalFunctionSymbol "g_compute_checksum_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForBytes_ =
        call (externalFunctionSymbol "g_compute_hmac_for_bytes")
          (
            GLibChecksumType.PolyML.cVal
             &&> GLibBytesRecord.PolyML.cPtr
             &&> GLibBytesRecord.PolyML.cPtr
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForData_ =
        call (externalFunctionSymbol "g_compute_hmac_for_data")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val computeHmacForString_ =
        call (externalFunctionSymbol "g_compute_hmac_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val convert_ =
        call (externalFunctionSymbol "g_convert")
          (
            GUInt8CArrayN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8CArrayN.PolyML.cOutPtr
          )
      val convertWithFallback_ =
        call (externalFunctionSymbol "g_convert_with_fallback")
          (
            GUInt8CArrayN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8CArrayN.PolyML.cOutPtr
          )
      val dcgettext_ =
        call (externalFunctionSymbol "g_dcgettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dgettext_ = call (externalFunctionSymbol "g_dgettext") (Utf8.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val dngettext_ =
        call (externalFunctionSymbol "g_dngettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GULong.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext_ =
        call (externalFunctionSymbol "g_dpgettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext2_ =
        call (externalFunctionSymbol "g_dpgettext2")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val environGetenv_ = call (externalFunctionSymbol "g_environ_getenv") (Utf8CPtrArray.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val environSetenv_ =
        call (externalFunctionSymbol "g_environ_setenv")
          (
            Utf8CPtrArray.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> Utf8CPtrArray.PolyML.cOutPtr
          )
      val environUnsetenv_ = call (externalFunctionSymbol "g_environ_unsetenv") (Utf8CPtrArray.PolyML.cInOptPtr &&> Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val fileSetContentsFull_ =
        call (externalFunctionSymbol "g_file_set_contents_full")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GLibFileSetContentsFlags.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val filenameDisplayBasename_ = call (externalFunctionSymbol "g_filename_display_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameDisplayName_ = call (externalFunctionSymbol "g_filename_display_name") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameFromUri_ =
        call (externalFunctionSymbol "g_filename_from_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutOptRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameFromUtf8_ =
        call (externalFunctionSymbol "g_filename_from_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameToUri_ =
        call (externalFunctionSymbol "g_filename_to_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameToUtf8_ =
        call (externalFunctionSymbol "g_filename_to_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val findProgramInPath_ = call (externalFunctionSymbol "g_find_program_in_path") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val formatSize_ = call (externalFunctionSymbol "g_format_size") (GUInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeForDisplay_ = call (externalFunctionSymbol "g_format_size_for_display") (GInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeFull_ = call (externalFunctionSymbol "g_format_size_full") (GUInt64.PolyML.cVal &&> GLibFormatSizeFlags.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getApplicationName_ = call (externalFunctionSymbol "g_get_application_name") (cVoid --> Utf8.PolyML.cOutOptPtr)
      val getCodeset_ = call (externalFunctionSymbol "g_get_codeset") (cVoid --> Utf8.PolyML.cOutPtr)
      val getConsoleCharset_ = call (externalFunctionSymbol "g_get_console_charset") (Utf8.PolyML.cOutRef --> GBool.PolyML.cVal)
      val getCurrentDir_ = call (externalFunctionSymbol "g_get_current_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentTime_ = call (externalFunctionSymbol "g_get_current_time") (GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val getEnviron_ = call (externalFunctionSymbol "g_get_environ") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val getHomeDir_ = call (externalFunctionSymbol "g_get_home_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getHostName_ = call (externalFunctionSymbol "g_get_host_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getLanguageNames_ = call (externalFunctionSymbol "g_get_language_names") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val getLanguageNamesWithCategory_ = call (externalFunctionSymbol "g_get_language_names_with_category") (Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getLocaleVariants_ = call (externalFunctionSymbol "g_get_locale_variants") (Utf8.PolyML.cInPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getMonotonicTime_ = call (externalFunctionSymbol "g_get_monotonic_time") (cVoid --> GInt64.PolyML.cVal)
      val getNumProcessors_ = call (externalFunctionSymbol "g_get_num_processors") (cVoid --> GUInt.PolyML.cVal)
      val getOsInfo_ = call (externalFunctionSymbol "g_get_os_info") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val getPrgname_ = call (externalFunctionSymbol "g_get_prgname") (cVoid --> Utf8.PolyML.cOutOptPtr)
      val getRealName_ = call (externalFunctionSymbol "g_get_real_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getRealTime_ = call (externalFunctionSymbol "g_get_real_time") (cVoid --> GInt64.PolyML.cVal)
      val getSystemConfigDirs_ = call (externalFunctionSymbol "g_get_system_config_dirs") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val getSystemDataDirs_ = call (externalFunctionSymbol "g_get_system_data_dirs") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val getTmpDir_ = call (externalFunctionSymbol "g_get_tmp_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserCacheDir_ = call (externalFunctionSymbol "g_get_user_cache_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserConfigDir_ = call (externalFunctionSymbol "g_get_user_config_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserDataDir_ = call (externalFunctionSymbol "g_get_user_data_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserName_ = call (externalFunctionSymbol "g_get_user_name") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserRuntimeDir_ = call (externalFunctionSymbol "g_get_user_runtime_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getUserSpecialDir_ = call (externalFunctionSymbol "g_get_user_special_dir") (GLibUserDirectory.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getenv_ = call (externalFunctionSymbol "g_getenv") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hostnameIsAsciiEncoded_ = call (externalFunctionSymbol "g_hostname_is_ascii_encoded") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameIsIpAddress_ = call (externalFunctionSymbol "g_hostname_is_ip_address") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameIsNonAscii_ = call (externalFunctionSymbol "g_hostname_is_non_ascii") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hostnameToAscii_ = call (externalFunctionSymbol "g_hostname_to_ascii") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hostnameToUnicode_ = call (externalFunctionSymbol "g_hostname_to_unicode") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val idleSourceNew_ = call (externalFunctionSymbol "g_idle_source_new") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val idleAdd_ =
        call
          (externalFunctionSymbol "g_idle_add_full")
          (
            GInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.cDispatchPtr
             &&> GLibSourceFunc.PolyML.cPtr
             &&> GLibSourceFunc.PolyML.cDestroyNotifyPtr
             --> GUInt.PolyML.cVal
          )
      val ioAddWatch_ =
        call
          (externalFunctionSymbol "g_io_add_watch_full")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibIOCondition.PolyML.cVal
             &&> GLibIOFunc.PolyML.cDispatchPtr
             &&> GLibIOFunc.PolyML.cPtr
             &&> GLibIOFunc.PolyML.cDestroyNotifyPtr
             --> GUInt.PolyML.cVal
          )
      val ioCreateWatch_ = call (externalFunctionSymbol "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val listenv_ = call (externalFunctionSymbol "g_listenv") (cVoid --> Utf8CPtrArray.PolyML.cOutPtr)
      val localeFromUtf8_ =
        call (externalFunctionSymbol "g_locale_from_utf8")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8CArrayN.PolyML.cOutPtr
          )
      val localeToUtf8_ =
        call (externalFunctionSymbol "g_locale_to_utf8")
          (
            GUInt8CArrayN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val log_ =
        call (externalFunctionSymbol "giraffe_g_log")
          (
            Utf8.PolyML.cInPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val logRemoveHandler_ = call (externalFunctionSymbol "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> GUInt.PolyML.cVal --> cVoid)
      val logSetAlwaysFatal_ = call (externalFunctionSymbol "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (externalFunctionSymbol "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logVariant_ =
        call (externalFunctionSymbol "g_log_variant")
          (
            Utf8.PolyML.cInOptPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> GLibVariantRecord.PolyML.cPtr
             --> cVoid
          )
      val logWriterIsJournald_ = call (externalFunctionSymbol "g_log_writer_is_journald") (GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val logWriterSupportsColor_ = call (externalFunctionSymbol "g_log_writer_supports_color") (GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val mainCurrentSource_ = call (externalFunctionSymbol "g_main_current_source") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (externalFunctionSymbol "g_main_depth") (cVoid --> GInt.PolyML.cVal)
      val markupEscapeText_ = call (externalFunctionSymbol "g_markup_escape_text") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val mkdirWithParents_ = call (externalFunctionSymbol "g_mkdir_with_parents") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val onErrorQuery_ = call (externalFunctionSymbol "g_on_error_query") (Utf8.PolyML.cInPtr --> cVoid)
      val onErrorStackTrace_ = call (externalFunctionSymbol "g_on_error_stack_trace") (Utf8.PolyML.cInPtr --> cVoid)
      val pathGetBasename_ = call (externalFunctionSymbol "g_path_get_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathGetDirname_ = call (externalFunctionSymbol "g_path_get_dirname") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathIsAbsolute_ = call (externalFunctionSymbol "g_path_is_absolute") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val pathSkipRoot_ = call (externalFunctionSymbol "g_path_skip_root") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val patternMatchSimple_ = call (externalFunctionSymbol "g_pattern_match_simple") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val quarkFromString_ = call (externalFunctionSymbol "g_quark_from_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val quarkToString_ = call (externalFunctionSymbol "g_quark_to_string") (GLibQuark.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val randomDouble_ = call (externalFunctionSymbol "g_random_double") (cVoid --> GDouble.PolyML.cVal)
      val randomDoubleRange_ = call (externalFunctionSymbol "g_random_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val randomInt_ = call (externalFunctionSymbol "g_random_int") (cVoid --> GUInt32.PolyML.cVal)
      val randomIntRange_ = call (externalFunctionSymbol "g_random_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val randomSetSeed_ = call (externalFunctionSymbol "g_random_set_seed") (GUInt32.PolyML.cVal --> cVoid)
      val refStringAcquire_ = call (externalFunctionSymbol "g_ref_string_acquire") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val refStringLength_ = call (externalFunctionSymbol "g_ref_string_length") (Utf8.PolyML.cInPtr --> GSize.PolyML.cVal)
      val refStringNew_ = call (externalFunctionSymbol "g_ref_string_new") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val refStringNewIntern_ = call (externalFunctionSymbol "g_ref_string_new_intern") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val refStringNewLen_ = call (externalFunctionSymbol "g_ref_string_new_len") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val refStringRelease_ = call (externalFunctionSymbol "g_ref_string_release") (Utf8.PolyML.cInPtr --> cVoid)
      val reloadUserSpecialDirsCache_ = call (externalFunctionSymbol "g_reload_user_special_dirs_cache") (cVoid --> cVoid)
      val rmdir_ = call (externalFunctionSymbol "g_rmdir") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val setApplicationName_ = call (externalFunctionSymbol "g_set_application_name") (Utf8.PolyML.cInPtr --> cVoid)
      val setPrgname_ = call (externalFunctionSymbol "g_set_prgname") (Utf8.PolyML.cInPtr --> cVoid)
      val setenv_ =
        call (externalFunctionSymbol "g_setenv")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val shellParseArgv_ =
        call (externalFunctionSymbol "g_shell_parse_argv")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cRef
             &&> Utf8CPtrArray.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shellQuote_ = call (externalFunctionSymbol "g_shell_quote") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val shellUnquote_ = call (externalFunctionSymbol "g_shell_unquote") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val sliceGetConfig_ = call (externalFunctionSymbol "g_slice_get_config") (GLibSliceConfig.PolyML.cVal --> GInt64.PolyML.cVal)
      val sliceSetConfig_ = call (externalFunctionSymbol "g_slice_set_config") (GLibSliceConfig.PolyML.cVal &&> GInt64.PolyML.cVal --> cVoid)
      val spawnAsyncWithPipes_ =
        call
          (externalFunctionSymbol "g_spawn_async_with_pipes")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8CPtrArray.PolyML.cInPtr
             &&> Utf8CPtrArray.PolyML.cInOptPtr
             &&> GLibSpawnFlags.PolyML.cVal
             &&> GLibSpawnChildSetupFunc.PolyML.cOptDispatchPtr
             &&> GLibSpawnChildSetupFunc.PolyML.cOptPtr
             &&> GLibPid.PolyML.cRef
             &&> GFileDesc.PolyML.cRef
             &&> GFileDesc.PolyML.cRef
             &&> GFileDesc.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val spawnCheckExitStatus_ = call (externalFunctionSymbol "g_spawn_check_exit_status") (GInt.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val spawnClosePid_ = call (externalFunctionSymbol "g_spawn_close_pid") (GLibPid.PolyML.cVal --> cVoid)
      val spawnCommandLineAsync_ = call (externalFunctionSymbol "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val spawnCommandLineSync_ =
        call (externalFunctionSymbol "g_spawn_command_line_sync")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt8CArray.PolyML.cOutRef
             &&> GUInt8CArray.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val testAssertExpectedMessagesInternal_ =
        call (externalFunctionSymbol "g_test_assert_expected_messages_internal")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testBug_ = call (externalFunctionSymbol "g_test_bug") (Utf8.PolyML.cInPtr --> cVoid)
      val testBugBase_ = call (externalFunctionSymbol "g_test_bug_base") (Utf8.PolyML.cInPtr --> cVoid)
      val testExpectMessage_ =
        call (externalFunctionSymbol "g_test_expect_message")
          (
            Utf8.PolyML.cInOptPtr
             &&> GLibLogLevelFlags.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testFail_ = call (externalFunctionSymbol "g_test_fail") (cVoid --> cVoid)
      val testFailed_ = call (externalFunctionSymbol "g_test_failed") (cVoid --> GBool.PolyML.cVal)
      val testGetDir_ = call (externalFunctionSymbol "g_test_get_dir") (GLibTestFileType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val testIncomplete_ = call (externalFunctionSymbol "g_test_incomplete") (Utf8.PolyML.cInOptPtr --> cVoid)
      val testLogTypeName_ = call (externalFunctionSymbol "g_test_log_type_name") (GLibTestLogType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val testRandDouble_ = call (externalFunctionSymbol "g_test_rand_double") (cVoid --> GDouble.PolyML.cVal)
      val testRandDoubleRange_ = call (externalFunctionSymbol "g_test_rand_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val testRandInt_ = call (externalFunctionSymbol "g_test_rand_int") (cVoid --> GInt32.PolyML.cVal)
      val testRandIntRange_ = call (externalFunctionSymbol "g_test_rand_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val testRun_ = call (externalFunctionSymbol "g_test_run") (cVoid --> GInt.PolyML.cVal)
      val testSetNonfatalAssertions_ = call (externalFunctionSymbol "g_test_set_nonfatal_assertions") (cVoid --> cVoid)
      val testSkip_ = call (externalFunctionSymbol "g_test_skip") (Utf8.PolyML.cInOptPtr --> cVoid)
      val testSubprocess_ = call (externalFunctionSymbol "g_test_subprocess") (cVoid --> GBool.PolyML.cVal)
      val testSummary_ = call (externalFunctionSymbol "g_test_summary") (Utf8.PolyML.cInPtr --> cVoid)
      val testTimerElapsed_ = call (externalFunctionSymbol "g_test_timer_elapsed") (cVoid --> GDouble.PolyML.cVal)
      val testTimerLast_ = call (externalFunctionSymbol "g_test_timer_last") (cVoid --> GDouble.PolyML.cVal)
      val testTimerStart_ = call (externalFunctionSymbol "g_test_timer_start") (cVoid --> cVoid)
      val testTrapAssertions_ =
        call (externalFunctionSymbol "g_test_trap_assertions")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val testTrapFork_ = call (externalFunctionSymbol "g_test_trap_fork") (GUInt64.PolyML.cVal &&> GLibTestTrapFlags.PolyML.cVal --> GBool.PolyML.cVal)
      val testTrapHasPassed_ = call (externalFunctionSymbol "g_test_trap_has_passed") (cVoid --> GBool.PolyML.cVal)
      val testTrapReachedTimeout_ = call (externalFunctionSymbol "g_test_trap_reached_timeout") (cVoid --> GBool.PolyML.cVal)
      val testTrapSubprocess_ =
        call (externalFunctionSymbol "g_test_trap_subprocess")
          (
            Utf8.PolyML.cInOptPtr
             &&> GUInt64.PolyML.cVal
             &&> GLibTestSubprocessFlags.PolyML.cVal
             --> cVoid
          )
      val timeoutAdd_ =
        call
          (externalFunctionSymbol "g_timeout_add_full")
          (
            GInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.cDispatchPtr
             &&> GLibSourceFunc.PolyML.cPtr
             &&> GLibSourceFunc.PolyML.cDestroyNotifyPtr
             --> GUInt.PolyML.cVal
          )
      val timeoutAddSeconds_ =
        call
          (externalFunctionSymbol "g_timeout_add_seconds_full")
          (
            GInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GLibSourceFunc.PolyML.cDispatchPtr
             &&> GLibSourceFunc.PolyML.cPtr
             &&> GLibSourceFunc.PolyML.cDestroyNotifyPtr
             --> GUInt.PolyML.cVal
          )
      val timeoutSourceNew_ = call (externalFunctionSymbol "g_timeout_source_new") (GUInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val timeoutSourceNewSeconds_ = call (externalFunctionSymbol "g_timeout_source_new_seconds") (GUInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val unixFdSourceNew_ = call (externalFunctionSymbol "g_unix_fd_source_new") (GInt.PolyML.cVal &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val unixSetFdNonblocking_ =
        call (externalFunctionSymbol "g_unix_set_fd_nonblocking")
          (
            GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val unixSignalSourceNew_ = call (externalFunctionSymbol "g_unix_signal_source_new") (GInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val unlink_ = call (externalFunctionSymbol "g_unlink") (Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val unsetenv_ = call (externalFunctionSymbol "g_unsetenv") (Utf8.PolyML.cInPtr --> cVoid)
      val usleep_ = call (externalFunctionSymbol "g_usleep") (GULong.PolyML.cVal --> cVoid)
      val uuidStringIsValid_ = call (externalFunctionSymbol "g_uuid_string_is_valid") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val uuidStringRandom_ = call (externalFunctionSymbol "g_uuid_string_random") (cVoid --> Utf8.PolyML.cOutPtr)
      val variantGetGtype_ = call (externalFunctionSymbol "g_variant_get_gtype") (cVoid --> GObjectType.PolyML.cVal)
    end
    structure PidType = GLibPidType
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure DateDay = GLibDateDay
    structure DateYear = GLibDateYear
    structure Quark = GLibQuark
    structure RefString = GLibRefString
    structure Strv = GLibStrv
    structure Time = GLibTime
    structure TimeSpan = GLibTimeSpan
    structure BytesRecord = GLibBytesRecord
    structure ChecksumRecord = GLibChecksumRecord
    structure ChecksumType = GLibChecksumType
    structure DateRecord = GLibDateRecord
    structure DateDMY = GLibDateDMY
    structure DateMonth = GLibDateMonth
    structure DateTimeRecord = GLibDateTimeRecord
    structure DateWeekday = GLibDateWeekday
    structure ErrorType = GLibErrorType
    structure FileSetContentsFlags = GLibFileSetContentsFlags
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
    structure MainLoopRecord = GLibMainLoopRecord
    structure MappedFileRecord = GLibMappedFileRecord
    structure MarkupCollectType = GLibMarkupCollectType
    structure MarkupParseContextRecord = GLibMarkupParseContextRecord
    structure MarkupParseFlags = GLibMarkupParseFlags
    structure MatchInfoRecord = GLibMatchInfoRecord
    structure NormalizeMode = GLibNormalizeMode
    structure OnceStatus = GLibOnceStatus
    structure OptionArg = GLibOptionArg
    structure OptionFlags = GLibOptionFlags
    structure OptionGroupRecord = GLibOptionGroupRecord
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SliceConfig = GLibSliceConfig
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure StringRecord = GLibStringRecord
    structure TestConfigRecord = GLibTestConfigRecord
    structure TestFileType = GLibTestFileType
    structure TestLogType = GLibTestLogType
    structure TestResult = GLibTestResult
    structure TestSubprocessFlags = GLibTestSubprocessFlags
    structure TestTrapFlags = GLibTestTrapFlags
    structure ThreadRecord = GLibThreadRecord
    structure TimeType = GLibTimeType
    structure TimeValRecord = GLibTimeValRecord
    structure TimeZoneRecord = GLibTimeZoneRecord
    structure TokenType = GLibTokenType
    structure TraverseFlags = GLibTraverseFlags
    structure TraverseType = GLibTraverseType
    structure UnicodeType = GLibUnicodeType
    structure UriRecord = GLibUriRecord
    structure UriFlags = GLibUriFlags
    structure UriHideFlags = GLibUriHideFlags
    structure UriParamsFlags = GLibUriParamsFlags
    structure UserDirectory = GLibUserDirectory
    structure VariantRecord = GLibVariantRecord
    structure VariantBuilderRecord = GLibVariantBuilderRecord
    structure VariantClass = GLibVariantClass
    structure VariantDictRecord = GLibVariantDictRecord
    structure VariantTypeRecord = GLibVariantTypeRecord
    structure IOFunc = GLibIOFunc
    structure Pid = GLibPid
    structure Bytes = GLibBytes
    structure Checksum = GLibChecksum
    structure Date = GLibDate
    structure DateTime = GLibDateTime
    structure ErrorRecord = GLibErrorRecord
    structure KeyFile = GLibKeyFile
    structure MainContext = GLibMainContext
    structure MainLoop = GLibMainLoop
    structure MappedFile = GLibMappedFile
    structure MarkupParseContext = GLibMarkupParseContext
    structure MatchInfo = GLibMatchInfo
    structure OptionGroup = GLibOptionGroup
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure String = GLibString
    structure TestConfig = GLibTestConfig
    structure Thread = GLibThread
    structure TimeVal = GLibTimeVal
    structure TimeZone = GLibTimeZone
    structure Uri = GLibUri
    structure VariantRecordCPtrArrayN = GLibVariantRecordCPtrArrayN
    structure VariantBuilder = GLibVariantBuilder
    structure VariantDict = GLibVariantDict
    structure VariantTypeRecordCPtrArrayN = GLibVariantTypeRecordCPtrArrayN
    structure ChildWatchFunc = GLibChildWatchFunc
    structure BookmarkFileError = GLibBookmarkFileError
    exception BookmarkFileError = GLibBookmarkFileError
    structure ConvertError = GLibConvertError
    exception ConvertError = GLibConvertError
    structure Error = GLibError
    exception Error = GLibError
    structure FileError = GLibFileError
    exception FileError = GLibFileError
    structure IOChannelError = GLibIOChannelError
    exception IOChannelError = GLibIOChannelError
    structure KeyFileError = GLibKeyFileError
    exception KeyFileError = GLibKeyFileError
    structure MarkupError = GLibMarkupError
    exception MarkupError = GLibMarkupError
    structure NumberParserError = GLibNumberParserError
    exception NumberParserError = GLibNumberParserError
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
    structure UriError = GLibUriError
    exception UriError = GLibUriError
    structure Variant = GLibVariant
    structure VariantParseError = GLibVariantParseError
    exception VariantParseError = GLibVariantParseError
    structure VariantType = GLibVariantType
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
    val MICRO_VERSION = 1
    val MININT16 = ~32768
    val MININT32 = ~2147483648
    val MININT64 = ~9223372036854775808
    val MININT8 = ~128
    val MINOR_VERSION = 66
    val PRIORITY_DEFAULT = 0
    val PRIORITY_DEFAULT_IDLE = 200
    val PRIORITY_HIGH = ~100
    val PRIORITY_HIGH_IDLE = 100
    val PRIORITY_LOW = 300
    val SOURCE_CONTINUE = true
    val SOURCE_REMOVE = false
    val TEST_OPTION_ISOLATE_DIRS = "isolate_dirs"
    val TIME_SPAN_DAY = 86400000000
    val TIME_SPAN_HOUR = 3600000000
    val TIME_SPAN_MILLISECOND = 1000
    val TIME_SPAN_MINUTE = 60000000
    val TIME_SPAN_SECOND = 1000000
    val UNICHAR_MAX_DECOMPOSITION_LENGTH = 18
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
    val VERSION_MIN_REQUIRED = 2
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun assertWarning
        (
          logDomain,
          file,
          line,
          prettyFunction,
          expression
        ) =
        call assertWarning_
          (
            logDomain
             & file
             & line
             & prettyFunction
             & expression
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun assertionMessage
        (
          domain,
          file,
          line,
          func,
          message
        ) =
        call assertionMessage_
          (
            domain
             & file
             & line
             & func
             & message
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
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
        call assertionMessageCmpstr_
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
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr ~1
    in
      fun base64Decode text =
        let
          val outLen & retVal = call base64Decode_ (text & GSize.null)
        in
          retVal outLen
        end
    end
    local
      val call = GUInt8CArrayN.FFI.withPtr 0 &&&> GSize.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun base64Encode data =
        let
          val len = GUInt8CArrayN.length data
          val retVal = call base64Encode_ (data & len)
        in
          retVal
        end
    end
    local
      val call = Utf8CPtrArray.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun buildFilenamev args = call buildFilenamev_ args
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> Utf8CPtrArray.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun buildPathv (separator, args) = call buildPathv_ (separator & args)
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withOptPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun canonicalizeFilename (filename, relativeTo) = call canonicalizeFilename_ (filename & relativeTo)
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal
    in
      fun chdir path = call chdir_ path
    end
    local
      val call =
        GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
    in
      fun checkVersion
        (
          requiredMajor,
          requiredMinor,
          requiredMicro
        ) =
        call checkVersion_
          (
            requiredMajor
             & requiredMinor
             & requiredMicro
          )
    end
    local
      val call =
        GInt.FFI.withVal
         &&&> GLibPid.FFI.withVal
         &&&> GLibChildWatchFunc.FFI.withDispatchPtr false
         &&&> GLibChildWatchFunc.FFI.withPtr false
         &&&> GLibChildWatchFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
    in
      fun childWatchAdd (priority, pid, function) =
        call childWatchAdd_
          (
            priority
             & pid
             & ()
             & function
             & ()
          )
    end
    local
      val call = GLibPid.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun childWatchSourceNew pid = call childWatchSourceNew_ pid
    end
    local
      val call = GFileDesc.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore
    in
      fun close fd = call close_ (fd & [])
    end
    local
      val call = GLibChecksumType.FFI.withVal &&&> GLibBytesRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1
    in
      fun computeChecksumForBytes (checksumType, data) = call computeChecksumForBytes_ (checksumType & data)
    end
    local
      val call =
        GLibChecksumType.FFI.withVal
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> Utf8.FFI.fromPtr ~1
    in
      fun computeChecksumForData (checksumType, data) =
        let
          val length = GUInt8CArrayN.length data
          val retVal =
            call computeChecksumForData_
              (
                checksumType
                 & data
                 & length
              )
        in
          retVal
        end
    end
    local
      val call =
        GLibChecksumType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         ---> Utf8.FFI.fromPtr ~1
    in
      fun computeChecksumForString
        (
          checksumType,
          str,
          length
        ) =
        call computeChecksumForString_
          (
            checksumType
             & str
             & length
          )
    end
    local
      val call =
        GLibChecksumType.FFI.withVal
         &&&> GLibBytesRecord.FFI.withPtr false
         &&&> GLibBytesRecord.FFI.withPtr false
         ---> Utf8.FFI.fromPtr ~1
    in
      fun computeHmacForBytes
        (
          digestType,
          key,
          data
        ) =
        call computeHmacForBytes_
          (
            digestType
             & key
             & data
          )
    end
    local
      val call =
        GLibChecksumType.FFI.withVal
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> Utf8.FFI.fromPtr ~1
    in
      fun computeHmacForData
        (
          digestType,
          key,
          data
        ) =
        let
          val keyLen = GUInt8CArrayN.length key
          val length = GUInt8CArrayN.length data
          val retVal =
            call computeHmacForData_
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
    end
    local
      val call =
        GLibChecksumType.FFI.withVal
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         ---> Utf8.FFI.fromPtr ~1
    in
      fun computeHmacForString
        (
          digestType,
          key,
          str,
          length
        ) =
        let
          val keyLen = GUInt8CArrayN.length key
          val retVal =
            call computeHmacForString_
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
    end
    local
      val call =
        GUInt8CArrayN.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && GUInt8CArrayN.FFI.fromPtr ~1
    in
      fun convert
        (
          str,
          toCodeset,
          fromCodeset
        ) =
        let
          val len = GUInt8CArrayN.length str
          val bytesRead
           & bytesWritten
           & retVal =
            call convert_
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
          (retVal bytesWritten, bytesRead)
        end
    end
    local
      val call =
        GUInt8CArrayN.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && GUInt8CArrayN.FFI.fromPtr ~1
    in
      fun convertWithFallback
        (
          str,
          toCodeset,
          fromCodeset,
          fallback
        ) =
        let
          val len = GUInt8CArrayN.length str
          val bytesRead
           & bytesWritten
           & retVal =
            call convertWithFallback_
              (
                str
                 & len
                 & toCodeset
                 & fromCodeset
                 & fallback
                 & GSize.null
                 & GSize.null
                 & []
              )
        in
          (retVal bytesWritten, bytesRead)
        end
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
    in
      fun dcgettext
        (
          domain,
          msgid,
          category
        ) =
        call dcgettext_
          (
            domain
             & msgid
             & category
          )
         before Utf8.FFI.touchOptPtr domain
         before Utf8.FFI.touchPtr msgid
    end
    local
      val call = Utf8.FFI.withOptPtr 0 &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0
    in
      fun dgettext (domain, msgid) = call dgettext_ (domain & msgid) before Utf8.FFI.touchOptPtr domain before Utf8.FFI.touchPtr msgid
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GULong.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
    in
      fun dngettext
        (
          domain,
          msgid,
          msgidPlural,
          n
        ) =
        call dngettext_
          (
            domain
             & msgid
             & msgidPlural
             & n
          )
         before Utf8.FFI.touchOptPtr domain
         before Utf8.FFI.touchPtr msgid
         before Utf8.FFI.touchPtr msgidPlural
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
    in
      fun dpgettext
        (
          domain,
          msgctxtid,
          msgidoffset
        ) =
        call dpgettext_
          (
            domain
             & msgctxtid
             & msgidoffset
          )
         before Utf8.FFI.touchOptPtr domain
         before Utf8.FFI.touchPtr msgctxtid
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> Utf8.FFI.fromPtr 0
    in
      fun dpgettext2
        (
          domain,
          context,
          msgid
        ) =
        call dpgettext2_
          (
            domain
             & context
             & msgid
          )
         before Utf8.FFI.touchOptPtr domain
         before Utf8.FFI.touchPtr context
         before Utf8.FFI.touchPtr msgid
    end
    local
      val call = Utf8CPtrArray.FFI.withOptPtr 0 &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0
    in
      fun environGetenv (envp, variable) = call environGetenv_ (envp & variable) before Utf8CPtrArray.FFI.touchOptPtr envp before Utf8.FFI.touchPtr variable
    end
    local
      val call =
        Utf8CPtrArray.FFI.withOptPtr ~1
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> Utf8CPtrArray.FFI.fromPtr ~1
    in
      fun environSetenv
        (
          envp,
          variable,
          value,
          overwrite
        ) =
        call environSetenv_
          (
            envp
             & variable
             & value
             & overwrite
          )
    end
    local
      val call = Utf8CPtrArray.FFI.withOptPtr ~1 &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1
    in
      fun environUnsetenv (envp, variable) = call environUnsetenv_ (envp & variable)
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GUInt8CArrayN.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> GLibFileSetContentsFlags.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
    in
      fun fileSetContentsFull
        (
          filename,
          contents,
          flags,
          mode
        ) =
        let
          val length = GUInt8CArrayN.length contents
          val () =
            call fileSetContentsFull_
              (
                filename
                 & contents
                 & length
                 & flags
                 & mode
                 & []
              )
        in
          ()
        end
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun filenameDisplayBasename filename = call filenameDisplayBasename_ filename
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun filenameDisplayName filename = call filenameDisplayName_ filename
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withRefOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromOptPtr ~1 && Utf8.FFI.fromPtr ~1
    in
      fun filenameFromUri uri =
        let
          val hostname & retVal =
            call filenameFromUri_
              (
                uri
                 & NONE
                 & []
              )
        in
          (retVal, hostname)
        end
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && Utf8.FFI.fromPtr ~1
    in
      fun filenameFromUtf8 (utf8string, len) =
        let
          val bytesRead
           & bytesWritten
           & retVal =
            call filenameFromUtf8_
              (
                utf8string
                 & len
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
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr ~1
    in
      fun filenameToUri (filename, hostname) =
        call filenameToUri_
          (
            filename
             & hostname
             & []
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && Utf8.FFI.fromPtr ~1
    in
      fun filenameToUtf8 (opsysstring, len) =
        let
          val bytesRead
           & bytesWritten
           & retVal =
            call filenameToUtf8_
              (
                opsysstring
                 & len
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
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr ~1
    in
      fun findProgramInPath program = call findProgramInPath_ program
    end
    local
      val call = GUInt64.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun formatSize size = call formatSize_ size
    end
    local
      val call = GInt64.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun formatSizeForDisplay size = call formatSizeForDisplay_ size
    end
    local
      val call = GUInt64.FFI.withVal &&&> GLibFormatSizeFlags.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun formatSizeFull (size, flags) = call formatSizeFull_ (size & flags)
    end
    local
      val call = I ---> Utf8.FFI.fromOptPtr 0
    in
      fun getApplicationName () = call getApplicationName_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr ~1
    in
      fun getCodeset () = call getCodeset_ ()
    end
    local
      val call = Utf8.FFI.withRefOptPtr 0 ---> Utf8.FFI.fromPtr 0 && GBool.FFI.fromVal
    in
      fun getConsoleCharset () =
        let
          val charset & retVal = call getConsoleCharset_ NONE
        in
          (if retVal then SOME charset else NONE)
        end
    end
    local
      val call = I ---> Utf8.FFI.fromPtr ~1
    in
      fun getCurrentDir () = call getCurrentDir_ ()
    end
    local
      val call = GLibTimeValRecord.FFI.withPtr false ---> I
    in
      fun getCurrentTime result = call getCurrentTime_ result
    end
    local
      val call = I ---> Utf8CPtrArray.FFI.fromPtr ~1
    in
      fun getEnviron () = call getEnviron_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getHomeDir () = call getHomeDir_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getHostName () = call getHostName_ ()
    end
    local
      val call = I ---> Utf8CPtrArray.FFI.fromPtr 0
    in
      fun getLanguageNames () = call getLanguageNames_ ()
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr 0
    in
      fun getLanguageNamesWithCategory categoryName = call getLanguageNamesWithCategory_ categoryName before Utf8.FFI.touchPtr categoryName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1
    in
      fun getLocaleVariants locale = call getLocaleVariants_ locale
    end
    local
      val call = I ---> GInt64.FFI.fromVal
    in
      fun getMonotonicTime () = call getMonotonicTime_ ()
    end
    local
      val call = I ---> GUInt.FFI.fromVal
    in
      fun getNumProcessors () = call getNumProcessors_ ()
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr ~1
    in
      fun getOsInfo keyName = call getOsInfo_ keyName
    end
    local
      val call = I ---> Utf8.FFI.fromOptPtr 0
    in
      fun getPrgname () = call getPrgname_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getRealName () = call getRealName_ ()
    end
    local
      val call = I ---> GInt64.FFI.fromVal
    in
      fun getRealTime () = call getRealTime_ ()
    end
    local
      val call = I ---> Utf8CPtrArray.FFI.fromPtr 0
    in
      fun getSystemConfigDirs () = call getSystemConfigDirs_ ()
    end
    local
      val call = I ---> Utf8CPtrArray.FFI.fromPtr 0
    in
      fun getSystemDataDirs () = call getSystemDataDirs_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getTmpDir () = call getTmpDir_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getUserCacheDir () = call getUserCacheDir_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getUserConfigDir () = call getUserConfigDir_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getUserDataDir () = call getUserDataDir_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getUserName () = call getUserName_ ()
    end
    local
      val call = I ---> Utf8.FFI.fromPtr 0
    in
      fun getUserRuntimeDir () = call getUserRuntimeDir_ ()
    end
    local
      val call = GLibUserDirectory.FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun getUserSpecialDir directory = call getUserSpecialDir_ directory
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0
    in
      fun getenv variable = call getenv_ variable before Utf8.FFI.touchPtr variable
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun hostnameIsAsciiEncoded hostname = call hostnameIsAsciiEncoded_ hostname
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun hostnameIsIpAddress hostname = call hostnameIsIpAddress_ hostname
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun hostnameIsNonAscii hostname = call hostnameIsNonAscii_ hostname
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun hostnameToAscii hostname = call hostnameToAscii_ hostname
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun hostnameToUnicode hostname = call hostnameToUnicode_ hostname
    end
    local
      val call = I ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun idleSourceNew () = call idleSourceNew_ ()
    end
    local
      val call =
        GInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
    in
      fun idleAdd (priority, function) =
        call idleAdd_
          (
            priority
             & ()
             & function
             & ()
          )
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibIOCondition.FFI.withVal
         &&&> GLibIOFunc.FFI.withDispatchPtr false
         &&&> GLibIOFunc.FFI.withPtr false
         &&&> GLibIOFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
    in
      fun ioAddWatch (channel, priority, condition, func) =
        call ioAddWatch_
          (
            channel
             & priority
             & condition
             & ()
             & func
             & ()
          )
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun ioCreateWatch (channel, condition) = call ioCreateWatch_ (channel & condition)
    end
    local
      val call = I ---> Utf8CPtrArray.FFI.fromPtr ~1
    in
      fun listenv () = call listenv_ ()
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && GUInt8CArrayN.FFI.fromPtr ~1
    in
      fun localeFromUtf8 (utf8string, len) =
        let
          val bytesRead
           & bytesWritten
           & retVal =
            call localeFromUtf8_
              (
                utf8string
                 & len
                 & GSize.null
                 & GSize.null
                 & []
              )
        in
          (retVal bytesWritten, bytesRead)
        end
    end
    local
      val call =
        GUInt8CArrayN.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && Utf8.FFI.fromPtr ~1
    in
      fun localeToUtf8 opsysstring =
        let
          val len = GUInt8CArrayN.length opsysstring
          val bytesRead
           & bytesWritten
           & retVal =
            call localeToUtf8_
              (
                opsysstring
                 & len
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
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun log (logDomain, logLevel, format) =
        call log_
          (
            logDomain
             & logLevel
             & format
          )
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GUInt.FFI.withVal ---> I
    in
      fun logRemoveHandler (logDomain, handlerId) = call logRemoveHandler_ (logDomain & handlerId)
    end
    local
      val call = GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal
    in
      fun logSetAlwaysFatal fatalMask = call logSetAlwaysFatal_ fatalMask
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal
    in
      fun logSetFatalMask (logDomain, fatalMask) = call logSetFatalMask_ (logDomain & fatalMask)
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> GLibVariantRecord.FFI.withPtr false
         ---> I
    in
      fun logVariant
        (
          logDomain,
          logLevel,
          fields
        ) =
        call logVariant_
          (
            logDomain
             & logLevel
             & fields
          )
    end
    local
      val call = GInt.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun logWriterIsJournald outputFd = call logWriterIsJournald_ outputFd
    end
    local
      val call = GInt.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun logWriterSupportsColor outputFd = call logWriterSupportsColor_ outputFd
    end
    local
      val call = I ---> GLibSourceRecord.FFI.fromPtr false
    in
      fun mainCurrentSource () = call mainCurrentSource_ ()
    end
    local
      val call = I ---> GInt.FFI.fromVal
    in
      fun mainDepth () = call mainDepth_ ()
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun markupEscapeText (text, length) = call markupEscapeText_ (text & length)
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal
    in
      fun mkdirWithParents (pathname, mode) = call mkdirWithParents_ (pathname & mode)
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun onErrorQuery prgName = call onErrorQuery_ prgName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun onErrorStackTrace prgName = call onErrorStackTrace_ prgName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun pathGetBasename fileName = call pathGetBasename_ fileName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun pathGetDirname fileName = call pathGetDirname_ fileName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun pathIsAbsolute fileName = call pathIsAbsolute_ fileName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr 0
    in
      fun pathSkipRoot fileName = call pathSkipRoot_ fileName before Utf8.FFI.touchPtr fileName
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun patternMatchSimple (pattern, string) = call patternMatchSimple_ (pattern & string)
    end
    local
      val call = Utf8.FFI.withOptPtr 0 ---> GLibQuark.FFI.fromVal
    in
      fun quarkFromString string = call quarkFromString_ string
    end
    local
      val call = GLibQuark.FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun quarkToString quark = call quarkToString_ quark
    end
    local
      val call = I ---> GDouble.FFI.fromVal
    in
      fun randomDouble () = call randomDouble_ ()
    end
    local
      val call = GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal
    in
      fun randomDoubleRange (begin, end') = call randomDoubleRange_ (begin & end')
    end
    local
      val call = I ---> GUInt32.FFI.fromVal
    in
      fun randomInt () = call randomInt_ ()
    end
    local
      val call = GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal
    in
      fun randomIntRange (begin, end') = call randomIntRange_ (begin & end')
    end
    local
      val call = GUInt32.FFI.withVal ---> I
    in
      fun randomSetSeed seed = call randomSetSeed_ seed
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun refStringAcquire str = call refStringAcquire_ str
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GSize.FFI.fromVal
    in
      fun refStringLength str = call refStringLength_ str
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun refStringNew str = call refStringNew_ str
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun refStringNewIntern str = call refStringNewIntern_ str
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr ~1
    in
      fun refStringNewLen (str, len) = call refStringNewLen_ (str & len)
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun refStringRelease str = call refStringRelease_ str
    end
    local
      val call = I ---> I
    in
      fun reloadUserSpecialDirsCache () = call reloadUserSpecialDirsCache_ ()
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal
    in
      fun rmdir filename = call rmdir_ filename
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun setApplicationName applicationName = call setApplicationName_ applicationName
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun setPrgname prgname = call setPrgname_ prgname
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
    in
      fun setenv
        (
          variable,
          value,
          overwrite
        ) =
        call setenv_
          (
            variable
             & value
             & overwrite
          )
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withRefVal
         &&&> Utf8CPtrArray.FFI.withRefOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
               && Utf8CPtrArray.FFI.fromPtr ~1
               && ignore
    in
      fun shellParseArgv commandLine =
        let
          val _
           & argvp
           & () =
            call shellParseArgv_
              (
                commandLine
                 & GInt.null
                 & NONE
                 & [GLibShellError.handler]
              )
        in
          argvp
        end
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1
    in
      fun shellQuote unquotedString = call shellQuote_ unquotedString
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr ~1
    in
      fun shellUnquote quotedString = call shellUnquote_ (quotedString & [])
    end
    local
      val call = GLibSliceConfig.FFI.withVal ---> GInt64.FFI.fromVal
    in
      fun sliceGetConfig ckey = call sliceGetConfig_ ckey
    end
    local
      val call = GLibSliceConfig.FFI.withVal &&&> GInt64.FFI.withVal ---> I
    in
      fun sliceSetConfig (ckey, value) = call sliceSetConfig_ (ckey & value)
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> Utf8CPtrArray.FFI.withPtr 0
         &&&> Utf8CPtrArray.FFI.withOptPtr 0
         &&&> GLibSpawnFlags.FFI.withVal
         &&&> GLibSpawnChildSetupFunc.FFI.withOptDispatchPtr true
         &&&> GLibSpawnChildSetupFunc.FFI.withOptPtr false
         &&&> GLibPid.FFI.withRefVal
         &&&> GFileDesc.FFI.withRefVal
         &&&> GFileDesc.FFI.withRefVal
         &&&> GFileDesc.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GLibPid.FFI.fromVal
               && GFileDesc.FFI.fromVal
               && GFileDesc.FFI.fromVal
               && GFileDesc.FFI.fromVal
               && ignore
    in
      fun spawnAsyncWithPipes (workingDirectory, argv, envp, flags, childSetup) =
        let
          val
            childPid
             & standardInput
             & standardOutput
             & standardError
             & () =
            call spawnAsyncWithPipes_
              (
                workingDirectory
                 & argv
                 & envp
                 & flags
                 & isSome childSetup
                 & childSetup
                 & GLibPid.null
                 & GFileDesc.null
                 & GFileDesc.null
                 & GFileDesc.null
                 & [GLibSpawnError.handler]
              )
        in
          (childPid, standardInput, standardOutput, standardError)
        end
    end
    local
      val call = GInt.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore
    in
      fun spawnCheckExitStatus exitStatus = call spawnCheckExitStatus_ (exitStatus & [])
    end
    local
      val call = GLibPid.FFI.withVal ---> I
    in
      fun spawnClosePid pid = call spawnClosePid_ pid
    end
    local
      val call = Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> ignore
    in
      fun spawnCommandLineAsync commandLine = call spawnCommandLineAsync_ (commandLine & [])
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> GUInt8CArray.FFI.withRefOptPtr 0
         &&&> GUInt8CArray.FFI.withRefOptPtr 0
         &&&> GInt.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt8CArray.FFI.fromPtr ~1
               && GUInt8CArray.FFI.fromPtr ~1
               && GInt.FFI.fromVal
               && ignore
    in
      fun spawnCommandLineSync commandLine =
        let
          val standardOutput
           & standardError
           & exitStatus
           & () =
            call spawnCommandLineSync_
              (
                commandLine
                 & NONE
                 & NONE
                 & GInt.null
                 & []
              )
        in
          (
            standardOutput,
            standardError,
            exitStatus
          )
        end
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun testAssertExpectedMessagesInternal
        (
          domain,
          file,
          line,
          func
        ) =
        call testAssertExpectedMessagesInternal_
          (
            domain
             & file
             & line
             & func
          )
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun testBug bugUriSnippet = call testBug_ bugUriSnippet
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun testBugBase uriPattern = call testBugBase_ uriPattern
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun testExpectMessage
        (
          logDomain,
          logLevel,
          pattern
        ) =
        call testExpectMessage_
          (
            logDomain
             & logLevel
             & pattern
          )
    end
    local
      val call = I ---> I
    in
      fun testFail () = call testFail_ ()
    end
    local
      val call = I ---> GBool.FFI.fromVal
    in
      fun testFailed () = call testFailed_ ()
    end
    local
      val call = GLibTestFileType.FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun testGetDir fileType = call testGetDir_ fileType
    end
    local
      val call = Utf8.FFI.withOptPtr 0 ---> I
    in
      fun testIncomplete msg = call testIncomplete_ msg
    end
    local
      val call = GLibTestLogType.FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun testLogTypeName logType = call testLogTypeName_ logType
    end
    local
      val call = I ---> GDouble.FFI.fromVal
    in
      fun testRandDouble () = call testRandDouble_ ()
    end
    local
      val call = GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal
    in
      fun testRandDoubleRange (rangeStart, rangeEnd) = call testRandDoubleRange_ (rangeStart & rangeEnd)
    end
    local
      val call = I ---> GInt32.FFI.fromVal
    in
      fun testRandInt () = call testRandInt_ ()
    end
    local
      val call = GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal
    in
      fun testRandIntRange (begin, end') = call testRandIntRange_ (begin & end')
    end
    local
      val call = I ---> GInt.FFI.fromVal
    in
      fun testRun () = call testRun_ ()
    end
    local
      val call = I ---> I
    in
      fun testSetNonfatalAssertions () = call testSetNonfatalAssertions_ ()
    end
    local
      val call = Utf8.FFI.withOptPtr 0 ---> I
    in
      fun testSkip msg = call testSkip_ msg
    end
    local
      val call = I ---> GBool.FFI.fromVal
    in
      fun testSubprocess () = call testSubprocess_ ()
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun testSummary summary = call testSummary_ summary
    end
    local
      val call = I ---> GDouble.FFI.fromVal
    in
      fun testTimerElapsed () = call testTimerElapsed_ ()
    end
    local
      val call = I ---> GDouble.FFI.fromVal
    in
      fun testTimerLast () = call testTimerLast_ ()
    end
    local
      val call = I ---> I
    in
      fun testTimerStart () = call testTimerStart_ ()
    end
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
    in
      fun testTrapAssertions
        (
          domain,
          file,
          line,
          func,
          assertionFlags,
          pattern
        ) =
        call testTrapAssertions_
          (
            domain
             & file
             & line
             & func
             & assertionFlags
             & pattern
          )
    end
    local
      val call = GUInt64.FFI.withVal &&&> GLibTestTrapFlags.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun testTrapFork (usecTimeout, testTrapFlags) = call testTrapFork_ (usecTimeout & testTrapFlags)
    end
    local
      val call = I ---> GBool.FFI.fromVal
    in
      fun testTrapHasPassed () = call testTrapHasPassed_ ()
    end
    local
      val call = I ---> GBool.FFI.fromVal
    in
      fun testTrapReachedTimeout () = call testTrapReachedTimeout_ ()
    end
    local
      val call =
        Utf8.FFI.withOptPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> GLibTestSubprocessFlags.FFI.withVal
         ---> I
    in
      fun testTrapSubprocess
        (
          testPath,
          usecTimeout,
          testFlags
        ) =
        call testTrapSubprocess_
          (
            testPath
             & usecTimeout
             & testFlags
          )
    end
    local
      val call =
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
    in
      fun timeoutAdd (priority, interval, function) =
        call timeoutAdd_
          (
            priority
             & interval
             & ()
             & function
             & ()
          )
    end
    local
      val call =
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
    in
      fun timeoutAddSeconds (priority, interval, function) =
        call timeoutAddSeconds_
          (
            priority
             & interval
             & ()
             & function
             & ()
          )
    end
    local
      val call = GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun timeoutSourceNew interval = call timeoutSourceNew_ interval
    end
    local
      val call = GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun timeoutSourceNewSeconds interval = call timeoutSourceNewSeconds_ interval
    end
    local
      val call = GInt.FFI.withVal &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun unixFdSourceNew (fd, condition) = call unixFdSourceNew_ (fd & condition)
    end
    local
      val call =
        GInt.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
    in
      fun unixSetFdNonblocking (fd, nonblock) =
        call unixSetFdNonblocking_
          (
            fd
             & nonblock
             & []
          )
    end
    local
      val call = GInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true
    in
      fun unixSignalSourceNew signum = call unixSignalSourceNew_ signum
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal
    in
      fun unlink filename = call unlink_ filename
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> I
    in
      fun unsetenv variable = call unsetenv_ variable
    end
    local
      val call = GULong.FFI.withVal ---> I
    in
      fun usleep microseconds = call usleep_ microseconds
    end
    local
      val call = Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal
    in
      fun uuidStringIsValid str = call uuidStringIsValid_ str
    end
    local
      val call = I ---> Utf8.FFI.fromPtr ~1
    in
      fun uuidStringRandom () = call uuidStringRandom_ ()
    end
    local
      val call = I ---> GObjectType.FFI.fromVal
    in
      fun variantGetGtype () = call variantGetGtype_ ()
    end
  end
