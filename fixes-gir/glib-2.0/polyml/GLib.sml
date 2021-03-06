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
    fun assertWarning
      (
        logDomain,
        file,
        line,
        prettyFunction,
        expression
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        val outLen & retVal = (Utf8.FFI.withPtr 0 &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr ~1) base64Decode_ (text & GSize.null)
      in
        retVal outLen
      end
    fun base64Encode data =
      let
        val len = GUInt8CArrayN.length data
        val retVal = (GUInt8CArrayN.FFI.withPtr 0 &&&> GSize.FFI.withVal ---> Utf8.FFI.fromPtr ~1) base64Encode_ (data & len)
      in
        retVal
      end
    fun buildFilenamev args = (Utf8CPtrArray.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) buildFilenamev_ args
    fun buildPathv (separator, args) = (Utf8.FFI.withPtr 0 &&&> Utf8CPtrArray.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) buildPathv_ (separator & args)
    fun canonicalizeFilename (filename, relativeTo) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withOptPtr 0 ---> Utf8.FFI.fromPtr ~1) canonicalizeFilename_ (filename & relativeTo)
    fun chdir path = (Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal) chdir_ path
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
         &&&> GLibChildWatchFunc.FFI.withDispatchPtr false
         &&&> GLibChildWatchFunc.FFI.withPtr false
         &&&> GLibChildWatchFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
      )
        childWatchAdd_
        (
          priority
           & pid
           & ()
           & function
           & ()
        )
    fun childWatchSourceNew pid = (GLibPid.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) childWatchSourceNew_ pid
    fun close fd = (GFileDesc.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore) close_ (fd & [])
    fun computeChecksumForBytes (checksumType, data) = (GLibChecksumType.FFI.withVal &&&> GLibBytesRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) computeChecksumForBytes_ (checksumType & data)
    fun computeChecksumForData (checksumType, data) =
      let
        val length = GUInt8CArrayN.length data
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             ---> Utf8.FFI.fromPtr ~1
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
         &&&> Utf8.FFI.withPtr 0
         &&&> GSSize.FFI.withVal
         ---> Utf8.FFI.fromPtr ~1
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
         &&&> GLibBytesRecord.FFI.withPtr false
         &&&> GLibBytesRecord.FFI.withPtr false
         ---> Utf8.FFI.fromPtr ~1
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
        val keyLen = GUInt8CArrayN.length key
        val length = GUInt8CArrayN.length data
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             ---> Utf8.FFI.fromPtr ~1
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
        val keyLen = GUInt8CArrayN.length key
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> Utf8.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             ---> Utf8.FFI.fromPtr ~1
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
        toCodeset,
        fromCodeset
      ) =
      let
        val len = GUInt8CArrayN.length str
        val bytesRead
         & bytesWritten
         & retVal =
          (
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
        (retVal bytesWritten, bytesRead)
      end
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
          (
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
          )
            convertWithFallback_
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
    fun dcgettext
      (
        domain,
        msgid,
        category
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        dcgettext_
        (
          domain
           & msgid
           & category
        )
       before Utf8.FFI.touchOptPtr domain
       before Utf8.FFI.touchPtr msgid
    fun dgettext (domain, msgid) = (Utf8.FFI.withOptPtr 0 &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) dgettext_ (domain & msgid) before Utf8.FFI.touchOptPtr domain before Utf8.FFI.touchPtr msgid
    fun dngettext
      (
        domain,
        msgid,
        msgidPlural,
        n
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
       before Utf8.FFI.touchOptPtr domain
       before Utf8.FFI.touchPtr msgid
       before Utf8.FFI.touchPtr msgidPlural
    fun dpgettext
      (
        domain,
        msgctxtid,
        msgidoffset
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GSize.FFI.withVal
         ---> Utf8.FFI.fromPtr 0
      )
        dpgettext_
        (
          domain
           & msgctxtid
           & msgidoffset
        )
       before Utf8.FFI.touchOptPtr domain
       before Utf8.FFI.touchPtr msgctxtid
    fun dpgettext2
      (
        domain,
        context,
        msgid
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> Utf8.FFI.fromPtr 0
      )
        dpgettext2_
        (
          domain
           & context
           & msgid
        )
       before Utf8.FFI.touchOptPtr domain
       before Utf8.FFI.touchPtr context
       before Utf8.FFI.touchPtr msgid
    fun environGetenv (envp, variable) = (Utf8CPtrArray.FFI.withOptPtr 0 &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) environGetenv_ (envp & variable) before Utf8CPtrArray.FFI.touchOptPtr envp before Utf8.FFI.touchPtr variable
    fun environSetenv
      (
        envp,
        variable,
        value,
        overwrite
      ) =
      (
        Utf8CPtrArray.FFI.withOptPtr ~1
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> Utf8CPtrArray.FFI.fromPtr ~1
      )
        environSetenv_
        (
          envp
           & variable
           & value
           & overwrite
        )
    fun environUnsetenv (envp, variable) = (Utf8CPtrArray.FFI.withOptPtr ~1 &&&> Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) environUnsetenv_ (envp & variable)
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
          (
            Utf8.FFI.withPtr 0
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             &&&> GLibFileSetContentsFlags.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> ignore
          )
            fileSetContentsFull_
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
    fun filenameDisplayBasename filename = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) filenameDisplayBasename_ filename
    fun filenameDisplayName filename = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) filenameDisplayName_ filename
    fun filenameFromUri uri =
      let
        val hostname & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromOptPtr ~1 && Utf8.FFI.fromPtr ~1
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
            Utf8.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            filenameFromUtf8_
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
    fun filenameToUri (filename, hostname) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr ~1
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
            Utf8.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            filenameToUtf8_
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
    fun findProgramInPath program = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr ~1) findProgramInPath_ program
    fun formatSize size = (GUInt64.FFI.withVal ---> Utf8.FFI.fromPtr ~1) formatSize_ size
    fun formatSizeForDisplay size = (GInt64.FFI.withVal ---> Utf8.FFI.fromPtr ~1) formatSizeForDisplay_ size
    fun formatSizeFull (size, flags) = (GUInt64.FFI.withVal &&&> GLibFormatSizeFlags.FFI.withVal ---> Utf8.FFI.fromPtr ~1) formatSizeFull_ (size & flags)
    fun getApplicationName () = (I ---> Utf8.FFI.fromOptPtr 0) getApplicationName_ ()
    fun getCodeset () = (I ---> Utf8.FFI.fromPtr ~1) getCodeset_ ()
    fun getConsoleCharset () =
      let
        val charset & retVal = (Utf8.FFI.withRefOptPtr 0 ---> Utf8.FFI.fromPtr 0 && GBool.FFI.fromVal) getConsoleCharset_ NONE
      in
        (if retVal then SOME charset else NONE)
      end
    fun getCurrentDir () = (I ---> Utf8.FFI.fromPtr ~1) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.FFI.withPtr false ---> I) getCurrentTime_ result
    fun getEnviron () = (I ---> Utf8CPtrArray.FFI.fromPtr ~1) getEnviron_ ()
    fun getHomeDir () = (I ---> Utf8.FFI.fromPtr 0) getHomeDir_ ()
    fun getHostName () = (I ---> Utf8.FFI.fromPtr 0) getHostName_ ()
    fun getLanguageNames () = (I ---> Utf8CPtrArray.FFI.fromPtr 0) getLanguageNames_ ()
    fun getLanguageNamesWithCategory categoryName = (Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr 0) getLanguageNamesWithCategory_ categoryName before Utf8.FFI.touchPtr categoryName
    fun getLocaleVariants locale = (Utf8.FFI.withPtr 0 ---> Utf8CPtrArray.FFI.fromPtr ~1) getLocaleVariants_ locale
    fun getMonotonicTime () = (I ---> GInt64.FFI.fromVal) getMonotonicTime_ ()
    fun getNumProcessors () = (I ---> GUInt.FFI.fromVal) getNumProcessors_ ()
    fun getOsInfo keyName = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr ~1) getOsInfo_ keyName
    fun getPrgname () = (I ---> Utf8.FFI.fromOptPtr 0) getPrgname_ ()
    fun getRealName () = (I ---> Utf8.FFI.fromPtr 0) getRealName_ ()
    fun getRealTime () = (I ---> GInt64.FFI.fromVal) getRealTime_ ()
    fun getSystemConfigDirs () = (I ---> Utf8CPtrArray.FFI.fromPtr 0) getSystemConfigDirs_ ()
    fun getSystemDataDirs () = (I ---> Utf8CPtrArray.FFI.fromPtr 0) getSystemDataDirs_ ()
    fun getTmpDir () = (I ---> Utf8.FFI.fromPtr 0) getTmpDir_ ()
    fun getUserCacheDir () = (I ---> Utf8.FFI.fromPtr 0) getUserCacheDir_ ()
    fun getUserConfigDir () = (I ---> Utf8.FFI.fromPtr 0) getUserConfigDir_ ()
    fun getUserDataDir () = (I ---> Utf8.FFI.fromPtr 0) getUserDataDir_ ()
    fun getUserName () = (I ---> Utf8.FFI.fromPtr 0) getUserName_ ()
    fun getUserRuntimeDir () = (I ---> Utf8.FFI.fromPtr 0) getUserRuntimeDir_ ()
    fun getUserSpecialDir directory = (GLibUserDirectory.FFI.withVal ---> Utf8.FFI.fromPtr 0) getUserSpecialDir_ directory
    fun getenv variable = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) getenv_ variable before Utf8.FFI.touchPtr variable
    fun hostnameIsAsciiEncoded hostname = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) hostnameToUnicode_ hostname
    fun idleSourceNew () = (I ---> GLibSourceRecord.FFI.fromPtr true) idleSourceNew_ ()
    fun idleAdd (priority, function) =
      (
        GInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
      )
        idleAdd_
        (
          priority
           & ()
           & function
           & ()
        )
    fun ioAddWatch (channel, priority, condition, func) =
      (
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibIOCondition.FFI.withVal
         &&&> GLibIOFunc.FFI.withDispatchPtr false
         &&&> GLibIOFunc.FFI.withPtr false
         &&&> GLibIOFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
      )
        ioAddWatch_
        (
          channel
           & priority
           & condition
           & ()
           & func
           & ()
        )
    fun ioCreateWatch (channel, condition) = (GLibIOChannelRecord.FFI.withPtr false &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) ioCreateWatch_ (channel & condition)
    fun listenv () = (I ---> Utf8CPtrArray.FFI.fromPtr ~1) listenv_ ()
    fun localeFromUtf8 (utf8string, len) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && GUInt8CArrayN.FFI.fromPtr ~1
          )
            localeFromUtf8_
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
    fun localeToUtf8 opsysstring =
      let
        val len = GUInt8CArrayN.length opsysstring
        val bytesRead
         & bytesWritten
         & retVal =
          (
            GUInt8CArrayN.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
          )
            localeToUtf8_
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
    fun log (logDomain, logLevel, format) =
      (
        Utf8.FFI.withPtr 0
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        log_
        (
          logDomain
           & logLevel
           & format
        )
    fun logRemoveHandler (logDomain, handlerId) = (Utf8.FFI.withPtr 0 &&&> GUInt.FFI.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask (logDomain, fatalMask) = (Utf8.FFI.withPtr 0 &&&> GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun logVariant
      (
        logDomain,
        logLevel,
        fields
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> GLibVariantRecord.FFI.withPtr false
         ---> I
      )
        logVariant_
        (
          logDomain
           & logLevel
           & fields
        )
    fun logWriterIsJournald outputFd = (GInt.FFI.withVal ---> GBool.FFI.fromVal) logWriterIsJournald_ outputFd
    fun logWriterSupportsColor outputFd = (GInt.FFI.withVal ---> GBool.FFI.fromVal) logWriterSupportsColor_ outputFd
    fun mainCurrentSource () = (I ---> GLibSourceRecord.FFI.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> GInt.FFI.fromVal) mainDepth_ ()
    fun markupEscapeText (text, length) = (Utf8.FFI.withPtr 0 &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr ~1) markupEscapeText_ (text & length)
    fun mkdirWithParents (pathname, mode) = (Utf8.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) mkdirWithParents_ (pathname & mode)
    fun onErrorQuery prgName = (Utf8.FFI.withPtr 0 ---> I) onErrorQuery_ prgName
    fun onErrorStackTrace prgName = (Utf8.FFI.withPtr 0 ---> I) onErrorStackTrace_ prgName
    fun pathGetBasename fileName = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) pathGetBasename_ fileName
    fun pathGetDirname fileName = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) pathGetDirname_ fileName
    fun pathIsAbsolute fileName = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) pathIsAbsolute_ fileName
    fun pathSkipRoot fileName = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr 0) pathSkipRoot_ fileName before Utf8.FFI.touchPtr fileName
    fun patternMatchSimple (pattern, string) = (Utf8.FFI.withPtr 0 &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) patternMatchSimple_ (pattern & string)
    fun quarkFromString string = (Utf8.FFI.withOptPtr 0 ---> GLibQuark.FFI.fromVal) quarkFromString_ string
    fun quarkToString quark = (GLibQuark.FFI.withVal ---> Utf8.FFI.fromPtr 0) quarkToString_ quark
    fun randomDouble () = (I ---> GDouble.FFI.fromVal) randomDouble_ ()
    fun randomDoubleRange (begin, end') = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal) randomDoubleRange_ (begin & end')
    fun randomInt () = (I ---> GUInt32.FFI.fromVal) randomInt_ ()
    fun randomIntRange (begin, end') = (GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) randomIntRange_ (begin & end')
    fun randomSetSeed seed = (GUInt32.FFI.withVal ---> I) randomSetSeed_ seed
    fun refStringAcquire str = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) refStringAcquire_ str
    fun refStringLength str = (Utf8.FFI.withPtr 0 ---> GSize.FFI.fromVal) refStringLength_ str
    fun refStringNew str = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) refStringNew_ str
    fun refStringNewIntern str = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) refStringNewIntern_ str
    fun refStringNewLen (str, len) = (Utf8.FFI.withPtr 0 &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr ~1) refStringNewLen_ (str & len)
    fun refStringRelease str = (Utf8.FFI.withPtr 0 ---> I) refStringRelease_ str
    fun reloadUserSpecialDirsCache () = (I ---> I) reloadUserSpecialDirsCache_ ()
    fun rmdir filename = (Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal) rmdir_ filename
    fun setApplicationName applicationName = (Utf8.FFI.withPtr 0 ---> I) setApplicationName_ applicationName
    fun setPrgname prgname = (Utf8.FFI.withPtr 0 ---> I) setPrgname_ prgname
    fun setenv
      (
        variable,
        value,
        overwrite
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        val _
         & argvp
         & () =
          (
            Utf8.FFI.withPtr 0
             &&&> GInt.FFI.withRefVal
             &&&> Utf8CPtrArray.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal
                   && Utf8CPtrArray.FFI.fromPtr ~1
                   && ignore
          )
            shellParseArgv_
            (
              commandLine
               & GInt.null
               & NONE
               & [GLibShellError.handler]
            )
      in
        argvp
      end
    fun shellQuote unquotedString = (Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr ~1) shellUnquote_ (quotedString & [])
    fun sliceGetConfig ckey = (GLibSliceConfig.FFI.withVal ---> GInt64.FFI.fromVal) sliceGetConfig_ ckey
    fun sliceSetConfig (ckey, value) = (GLibSliceConfig.FFI.withVal &&&> GInt64.FFI.withVal ---> I) sliceSetConfig_ (ckey & value)
    fun spawnAsyncWithPipes (workingDirectory, argv, envp, flags, childSetup) =
      let
        val
          childPid
           & standardInput
           & standardOutput
           & standardError
           & () =
          (
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
          )
            spawnAsyncWithPipes_
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
    fun spawnCheckExitStatus exitStatus = (GInt.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore) spawnCheckExitStatus_ (exitStatus & [])
    fun spawnClosePid pid = (GLibPid.FFI.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> ignore) spawnCommandLineAsync_ (commandLine & [])
    fun spawnCommandLineSync commandLine =
      let
        val standardOutput
         & standardError
         & exitStatus
         & () =
          (
            Utf8.FFI.withPtr 0
             &&&> GUInt8CArray.FFI.withRefOptPtr 0
             &&&> GUInt8CArray.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArray.FFI.fromPtr ~1
                   && GUInt8CArray.FFI.fromPtr ~1
                   && GInt.FFI.fromVal
                   && ignore
          )
            spawnCommandLineSync_
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
    fun testAssertExpectedMessagesInternal
      (
        domain,
        file,
        line,
        func
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        testAssertExpectedMessagesInternal_
        (
          domain
           & file
           & line
           & func
        )
    fun testBug bugUriSnippet = (Utf8.FFI.withPtr 0 ---> I) testBug_ bugUriSnippet
    fun testBugBase uriPattern = (Utf8.FFI.withPtr 0 ---> I) testBugBase_ uriPattern
    fun testExpectMessage
      (
        logDomain,
        logLevel,
        pattern
      ) =
      (
        Utf8.FFI.withOptPtr 0
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
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
    fun testIncomplete msg = (Utf8.FFI.withOptPtr 0 ---> I) testIncomplete_ msg
    fun testLogTypeName logType = (GLibTestLogType.FFI.withVal ---> Utf8.FFI.fromPtr 0) testLogTypeName_ logType
    fun testRandDouble () = (I ---> GDouble.FFI.fromVal) testRandDouble_ ()
    fun testRandDoubleRange (rangeStart, rangeEnd) = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal) testRandDoubleRange_ (rangeStart & rangeEnd)
    fun testRandInt () = (I ---> GInt32.FFI.fromVal) testRandInt_ ()
    fun testRandIntRange (begin, end') = (GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) testRandIntRange_ (begin & end')
    fun testRun () = (I ---> GInt.FFI.fromVal) testRun_ ()
    fun testSetNonfatalAssertions () = (I ---> I) testSetNonfatalAssertions_ ()
    fun testSkip msg = (Utf8.FFI.withOptPtr 0 ---> I) testSkip_ msg
    fun testSubprocess () = (I ---> GBool.FFI.fromVal) testSubprocess_ ()
    fun testSummary summary = (Utf8.FFI.withPtr 0 ---> I) testSummary_ summary
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
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GUInt64.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
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
        Utf8.FFI.withOptPtr 0
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
    fun timeoutAdd (priority, interval, function) =
      (
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
      )
        timeoutAdd_
        (
          priority
           & interval
           & ()
           & function
           & ()
        )
    fun timeoutAddSeconds (priority, interval, function) =
      (
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withDispatchPtr false
         &&&> GLibSourceFunc.FFI.withPtr false
         &&&> GLibSourceFunc.FFI.withDestroyNotifyPtr
         ---> GUInt.FFI.fromVal
      )
        timeoutAddSeconds_
        (
          priority
           & interval
           & ()
           & function
           & ()
        )
    fun timeoutSourceNew interval = (GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) timeoutSourceNew_ interval
    fun timeoutSourceNewSeconds interval = (GUInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) timeoutSourceNewSeconds_ interval
    fun unixFdSourceNew (fd, condition) = (GInt.FFI.withVal &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) unixFdSourceNew_ (fd & condition)
    fun unixSetFdNonblocking (fd, nonblock) =
      (
        GInt.FFI.withVal
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
    fun unixSignalSourceNew signum = (GInt.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) unixSignalSourceNew_ signum
    fun unlink filename = (Utf8.FFI.withPtr 0 ---> GInt.FFI.fromVal) unlink_ filename
    fun unsetenv variable = (Utf8.FFI.withPtr 0 ---> I) unsetenv_ variable
    fun usleep microseconds = (GULong.FFI.withVal ---> I) usleep_ microseconds
    fun uuidStringIsValid str = (Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) uuidStringIsValid_ str
    fun uuidStringRandom () = (I ---> Utf8.FFI.fromPtr ~1) uuidStringRandom_ ()
    fun variantGetGtype () = (I ---> GObjectType.FFI.fromVal) variantGetGtype_ ()
  end
