structure GLib : G_LIB =
  struct
    local
      open PolyMLFFI
    in
      val access_ = call (load_sym libglib "g_access") (Utf8.PolyML.cInPtr &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val asciiDigitValue_ = call (load_sym libglib "g_ascii_digit_value") (FFI.Char.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val asciiDtostr_ =
        call (load_sym libglib "g_ascii_dtostr")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val asciiFormatd_ =
        call (load_sym libglib "g_ascii_formatd")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val asciiStrcasecmp_ = call (load_sym libglib "g_ascii_strcasecmp") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val asciiStrdown_ = call (load_sym libglib "g_ascii_strdown") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val asciiStrncasecmp_ =
        call (load_sym libglib "g_ascii_strncasecmp")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val asciiStrtod_ = call (load_sym libglib "g_ascii_strtod") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Double.PolyML.cVal)
      val asciiStrtoll_ =
        call (load_sym libglib "g_ascii_strtoll")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             --> FFI.Int64.PolyML.cVal
          )
      val asciiStrtoull_ =
        call (load_sym libglib "g_ascii_strtoull")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             --> FFI.UInt64.PolyML.cVal
          )
      val asciiStrup_ = call (load_sym libglib "g_ascii_strup") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val asciiTolower_ = call (load_sym libglib "g_ascii_tolower") (FFI.Char.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val asciiToupper_ = call (load_sym libglib "g_ascii_toupper") (FFI.Char.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val asciiXdigitValue_ = call (load_sym libglib "g_ascii_xdigit_value") (FFI.Char.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val assertWarning_ =
        call (load_sym libglib "g_assert_warning")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val assertionMessage_ =
        call (load_sym libglib "g_assertion_message")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val assertionMessageCmpstr_ =
        call (load_sym libglib "g_assertion_message_cmpstr")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val assertionMessageExpr_ =
        call (load_sym libglib "g_assertion_message_expr")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val basename_ = call (load_sym libglib "g_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val bitNthLsf_ = call (load_sym libglib "g_bit_nth_lsf") (FFI.ULong.PolyML.cVal &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val bitNthMsf_ = call (load_sym libglib "g_bit_nth_msf") (FFI.ULong.PolyML.cVal &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val bitStorage_ = call (load_sym libglib "g_bit_storage") (FFI.ULong.PolyML.cVal --> FFI.UInt.PolyML.cVal)
      val blowChunks_ = call (load_sym libglib "g_blow_chunks") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val bookmarkFileErrorQuark_ = call (load_sym libglib "g_bookmark_file_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val chdir_ = call (load_sym libglib "g_chdir") (Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val checkVersion_ =
        call (load_sym libglib "glib_check_version")
          (
            FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.UInt.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val checksumTypeGetLength_ = call (load_sym libglib "g_checksum_type_get_length") (GLibChecksumType.PolyML.cVal --> FFI.SSize.PolyML.cVal)
      val childWatchSourceNew_ = call (load_sym libglib "g_child_watch_source_new") (GLibPid.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val clearError_ = call (load_sym libglib "g_clear_error") (GLibErrorRecord.PolyML.cOutOptRef --> FFI.PolyML.cVoid)
      val computeChecksumForString_ =
        call (load_sym libglib "g_compute_checksum_for_string")
          (
            GLibChecksumType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val convert_ =
        call (load_sym libglib "g_convert")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cRef
             &&> FFI.Size.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val convertErrorQuark_ = call (load_sym libglib "g_convert_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val datalistClear_ = call (load_sym libglib "g_datalist_clear") (GLibDataRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val datalistGetFlags_ = call (load_sym libglib "g_datalist_get_flags") (GLibDataRecord.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val datalistInit_ = call (load_sym libglib "g_datalist_init") (GLibDataRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val datalistSetFlags_ = call (load_sym libglib "g_datalist_set_flags") (GLibDataRecord.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val datalistUnsetFlags_ = call (load_sym libglib "g_datalist_unset_flags") (GLibDataRecord.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val dateGetDaysInMonth_ = call (load_sym libglib "g_date_get_days_in_month") (GLibDateMonth.PolyML.cVal &&> GLibDateYear.PolyML.cVal --> FFI.UInt8.PolyML.cVal)
      val dateGetMondayWeeksInYear_ = call (load_sym libglib "g_date_get_monday_weeks_in_year") (GLibDateYear.PolyML.cVal --> FFI.UInt8.PolyML.cVal)
      val dateGetSundayWeeksInYear_ = call (load_sym libglib "g_date_get_sunday_weeks_in_year") (GLibDateYear.PolyML.cVal --> FFI.UInt8.PolyML.cVal)
      val dateIsLeapYear_ = call (load_sym libglib "g_date_is_leap_year") (GLibDateYear.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val dateStrftime_ =
        call (load_sym libglib "g_date_strftime")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibDateRecord.PolyML.cPtr
             --> FFI.Size.PolyML.cVal
          )
      val dateValidDay_ = call (load_sym libglib "g_date_valid_day") (GLibDateDay.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val dateValidDmy_ =
        call (load_sym libglib "g_date_valid_dmy")
          (
            GLibDateDay.PolyML.cVal
             &&> GLibDateMonth.PolyML.cVal
             &&> GLibDateYear.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val dateValidJulian_ = call (load_sym libglib "g_date_valid_julian") (FFI.UInt32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val dateValidMonth_ = call (load_sym libglib "g_date_valid_month") (GLibDateMonth.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val dateValidWeekday_ = call (load_sym libglib "g_date_valid_weekday") (GLibDateWeekday.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val dateValidYear_ = call (load_sym libglib "g_date_valid_year") (GLibDateYear.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val dcgettext_ =
        call (load_sym libglib "g_dcgettext")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dgettext_ = call (load_sym libglib "g_dgettext") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val dirMakeTmp_ = call (load_sym libglib "g_dir_make_tmp") (Utf8.PolyML.cInOptPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val dngettext_ =
        call (load_sym libglib "g_dngettext")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.ULong.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext_ =
        call (load_sym libglib "g_dpgettext")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val dpgettext2_ =
        call (load_sym libglib "g_dpgettext2")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val dummyDecl_ = call (load_sym libglib "glib_dummy_decl") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val fileErrorFromErrno_ = call (load_sym libglib "g_file_error_from_errno") (FFI.Int.PolyML.cVal --> GLibFileError.PolyML.cVal)
      val fileErrorQuark_ = call (load_sym libglib "g_file_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val fileOpenTmp_ =
        call (load_sym libglib "g_file_open_tmp")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int.PolyML.cVal
          )
      val fileReadLink_ = call (load_sym libglib "g_file_read_link") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val fileTest_ = call (load_sym libglib "g_file_test") (Utf8.PolyML.cInPtr &&> GLibFileTest.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val filenameDisplayBasename_ = call (load_sym libglib "g_filename_display_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameDisplayName_ = call (load_sym libglib "g_filename_display_name") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val filenameFromUri_ =
        call (load_sym libglib "g_filename_from_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val filenameToUri_ =
        call (load_sym libglib "g_filename_to_uri")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val findProgramInPath_ = call (load_sym libglib "g_find_program_in_path") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val formatSize_ = call (load_sym libglib "g_format_size") (FFI.UInt64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeForDisplay_ = call (load_sym libglib "g_format_size_for_display") (FFI.Int64.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val formatSizeFull_ = call (load_sym libglib "g_format_size_full") (FFI.UInt64.PolyML.cVal &&> GLibFormatSizeFlags.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getApplicationName_ = call (load_sym libglib "g_get_application_name") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getCharset_ = call (load_sym libglib "g_get_charset") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getCurrentDir_ = call (load_sym libglib "g_get_current_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentTime_ = call (load_sym libglib "g_get_current_time") (GLibTimeValRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getFilenameCharsets_ = call (load_sym libglib "g_get_filename_charsets") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getHomeDir_ = call (load_sym libglib "g_get_home_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getHostName_ = call (load_sym libglib "g_get_host_name") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getMonotonicTime_ = call (load_sym libglib "g_get_monotonic_time") (FFI.PolyML.cVoid --> FFI.Int64.PolyML.cVal)
      val getPrgname_ = call (load_sym libglib "g_get_prgname") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getRealName_ = call (load_sym libglib "g_get_real_name") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getRealTime_ = call (load_sym libglib "g_get_real_time") (FFI.PolyML.cVoid --> FFI.Int64.PolyML.cVal)
      val getTmpDir_ = call (load_sym libglib "g_get_tmp_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getUserCacheDir_ = call (load_sym libglib "g_get_user_cache_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getUserConfigDir_ = call (load_sym libglib "g_get_user_config_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getUserDataDir_ = call (load_sym libglib "g_get_user_data_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getUserName_ = call (load_sym libglib "g_get_user_name") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getUserRuntimeDir_ = call (load_sym libglib "g_get_user_runtime_dir") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
      val getUserSpecialDir_ = call (load_sym libglib "g_get_user_special_dir") (GLibUserDirectory.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getenv_ = call (load_sym libglib "g_getenv") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hookDestroy_ = call (load_sym libglib "g_hook_destroy") (GLibHookListRecord.PolyML.cPtr &&> FFI.ULong.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val hookDestroyLink_ = call (load_sym libglib "g_hook_destroy_link") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hookFree_ = call (load_sym libglib "g_hook_free") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hookInsertBefore_ =
        call (load_sym libglib "g_hook_insert_before")
          (
            GLibHookListRecord.PolyML.cPtr
             &&> GLibHookRecord.PolyML.cPtr
             &&> GLibHookRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val hookPrepend_ = call (load_sym libglib "g_hook_prepend") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hookUnref_ = call (load_sym libglib "g_hook_unref") (GLibHookListRecord.PolyML.cPtr &&> GLibHookRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hostnameIsAsciiEncoded_ = call (load_sym libglib "g_hostname_is_ascii_encoded") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hostnameIsIpAddress_ = call (load_sym libglib "g_hostname_is_ip_address") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hostnameIsNonAscii_ = call (load_sym libglib "g_hostname_is_non_ascii") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hostnameToAscii_ = call (load_sym libglib "g_hostname_to_ascii") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hostnameToUnicode_ = call (load_sym libglib "g_hostname_to_unicode") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val idleSourceNew_ = call (load_sym libglib "g_idle_source_new") (FFI.PolyML.cVoid --> GLibSourceRecord.PolyML.cPtr)
      val internStaticString_ = call (load_sym libglib "g_intern_static_string") (Utf8.PolyML.cInOptPtr --> Utf8.PolyML.cOutPtr)
      val internString_ = call (load_sym libglib "g_intern_string") (Utf8.PolyML.cInOptPtr --> Utf8.PolyML.cOutPtr)
      val ioChannelErrorFromErrno_ = call (load_sym libglib "g_io_channel_error_from_errno") (FFI.Int.PolyML.cVal --> GLibIOChannelError.PolyML.cVal)
      val ioChannelErrorQuark_ = call (load_sym libglib "g_io_channel_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val ioCreateWatch_ = call (load_sym libglib "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val keyFileErrorQuark_ = call (load_sym libglib "g_key_file_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val listPopAllocator_ = call (load_sym libglib "g_list_pop_allocator") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val logRemoveHandler_ = call (load_sym libglib "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val logSetAlwaysFatal_ = call (load_sym libglib "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (load_sym libglib "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val mainContextDefault_ = call (load_sym libglib "g_main_context_default") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainContextGetThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val mainCurrentSource_ = call (load_sym libglib "g_main_current_source") (FFI.PolyML.cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (load_sym libglib "g_main_depth") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val markupErrorQuark_ = call (load_sym libglib "g_markup_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val markupEscapeText_ = call (load_sym libglib "g_markup_escape_text") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val memChunkInfo_ = call (load_sym libglib "g_mem_chunk_info") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val memIsSystemMalloc_ = call (load_sym libglib "g_mem_is_system_malloc") (FFI.PolyML.cVoid --> FFI.Bool.PolyML.cVal)
      val memProfile_ = call (load_sym libglib "g_mem_profile") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val memSetVtable_ = call (load_sym libglib "g_mem_set_vtable") (GLibMemVTableRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mkdirWithParents_ = call (load_sym libglib "g_mkdir_with_parents") (Utf8.PolyML.cInPtr &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val mkdtemp_ = call (load_sym libglib "g_mkdtemp") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val mkdtempFull_ = call (load_sym libglib "g_mkdtemp_full") (Utf8.PolyML.cInPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val mkstemp_ = call (load_sym libglib "g_mkstemp") (Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val mkstempFull_ =
        call (load_sym libglib "g_mkstemp_full")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val nodePopAllocator_ = call (load_sym libglib "g_node_pop_allocator") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val onErrorQuery_ = call (load_sym libglib "g_on_error_query") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val onErrorStackTrace_ = call (load_sym libglib "g_on_error_stack_trace") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val optionErrorQuark_ = call (load_sym libglib "g_option_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val pathGetBasename_ = call (load_sym libglib "g_path_get_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathGetDirname_ = call (load_sym libglib "g_path_get_dirname") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val pathIsAbsolute_ = call (load_sym libglib "g_path_is_absolute") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val pathSkipRoot_ = call (load_sym libglib "g_path_skip_root") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val patternMatch_ =
        call (load_sym libglib "g_pattern_match")
          (
            GLibPatternSpecRecord.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val patternMatchSimple_ = call (load_sym libglib "g_pattern_match_simple") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val patternMatchString_ = call (load_sym libglib "g_pattern_match_string") (GLibPatternSpecRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val poll_ =
        call (load_sym libglib "g_poll")
          (
            GLibPollFDRecord.PolyML.cPtr
             &&> FFI.UInt.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val quarkFromStaticString_ = call (load_sym libglib "g_quark_from_static_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val quarkFromString_ = call (load_sym libglib "g_quark_from_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val quarkToString_ = call (load_sym libglib "g_quark_to_string") (GLibQuark.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val quarkTryString_ = call (load_sym libglib "g_quark_try_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val randomDouble_ = call (load_sym libglib "g_random_double") (FFI.PolyML.cVoid --> FFI.Double.PolyML.cVal)
      val randomDoubleRange_ = call (load_sym libglib "g_random_double_range") (FFI.Double.PolyML.cVal &&> FFI.Double.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val randomInt_ = call (load_sym libglib "g_random_int") (FFI.PolyML.cVoid --> FFI.UInt32.PolyML.cVal)
      val randomIntRange_ = call (load_sym libglib "g_random_int_range") (FFI.Int32.PolyML.cVal &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val randomSetSeed_ = call (load_sym libglib "g_random_set_seed") (FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val regexCheckReplacement_ =
        call (load_sym libglib "g_regex_check_replacement")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val regexErrorQuark_ = call (load_sym libglib "g_regex_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val regexEscapeNul_ = call (load_sym libglib "g_regex_escape_nul") (Utf8.PolyML.cInPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val regexMatchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibRegexCompileFlags.PolyML.cVal
             &&> GLibRegexMatchFlags.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val reloadUserSpecialDirsCache_ = call (load_sym libglib "g_reload_user_special_dirs_cache") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val returnIfFailWarning_ =
        call (load_sym libglib "g_return_if_fail_warning")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val rmdir_ = call (load_sym libglib "g_rmdir") (Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val sequenceMove_ = call (load_sym libglib "g_sequence_move") (GLibSequenceIterRecord.PolyML.cPtr &&> GLibSequenceIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val sequenceMoveRange_ =
        call (load_sym libglib "g_sequence_move_range")
          (
            GLibSequenceIterRecord.PolyML.cPtr
             &&> GLibSequenceIterRecord.PolyML.cPtr
             &&> GLibSequenceIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val sequenceRemove_ = call (load_sym libglib "g_sequence_remove") (GLibSequenceIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val sequenceRemoveRange_ = call (load_sym libglib "g_sequence_remove_range") (GLibSequenceIterRecord.PolyML.cPtr &&> GLibSequenceIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val sequenceSwap_ = call (load_sym libglib "g_sequence_swap") (GLibSequenceIterRecord.PolyML.cPtr &&> GLibSequenceIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setApplicationName_ = call (load_sym libglib "g_set_application_name") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setPrgname_ = call (load_sym libglib "g_set_prgname") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setenv_ =
        call (load_sym libglib "g_setenv")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val shellErrorQuark_ = call (load_sym libglib "g_shell_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val shellQuote_ = call (load_sym libglib "g_shell_quote") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val shellUnquote_ = call (load_sym libglib "g_shell_unquote") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val sliceGetConfig_ = call (load_sym libglib "g_slice_get_config") (GLibSliceConfig.PolyML.cVal --> FFI.Int64.PolyML.cVal)
      val sliceSetConfig_ = call (load_sym libglib "g_slice_set_config") (GLibSliceConfig.PolyML.cVal &&> FFI.Int64.PolyML.cVal --> FFI.PolyML.cVoid)
      val sourceRemove_ = call (load_sym libglib "g_source_remove") (FFI.UInt.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val sourceSetNameById_ = call (load_sym libglib "g_source_set_name_by_id") (FFI.UInt.PolyML.cVal &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val spacedPrimesClosest_ = call (load_sym libglib "g_spaced_primes_closest") (FFI.UInt.PolyML.cVal --> FFI.UInt.PolyML.cVal)
      val spawnClosePid_ = call (load_sym libglib "g_spawn_close_pid") (GLibPid.PolyML.cVal --> FFI.PolyML.cVoid)
      val spawnCommandLineAsync_ = call (load_sym libglib "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
      val spawnErrorQuark_ = call (load_sym libglib "g_spawn_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val stpcpy_ = call (load_sym libglib "g_stpcpy") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strHasPrefix_ = call (load_sym libglib "g_str_has_prefix") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val strHasSuffix_ = call (load_sym libglib "g_str_has_suffix") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val strcanon_ =
        call (load_sym libglib "g_strcanon")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Char.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val strcasecmp_ = call (load_sym libglib "g_strcasecmp") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val strchomp_ = call (load_sym libglib "g_strchomp") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strchug_ = call (load_sym libglib "g_strchug") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strcmp0_ = call (load_sym libglib "g_strcmp0") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val strcompress_ = call (load_sym libglib "g_strcompress") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strdelimit_ =
        call (load_sym libglib "g_strdelimit")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Char.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val strdown_ = call (load_sym libglib "g_strdown") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strdup_ = call (load_sym libglib "g_strdup") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strerror_ = call (load_sym libglib "g_strerror") (FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strescape_ = call (load_sym libglib "g_strescape") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strfreev_ = call (load_sym libglib "g_strfreev") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val stringNew_ = call (load_sym libglib "g_string_new") (Utf8.PolyML.cInPtr --> GLibStringRecord.PolyML.cPtr)
      val stringNewLen_ = call (load_sym libglib "g_string_new_len") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val stringSizedNew_ = call (load_sym libglib "g_string_sized_new") (FFI.Size.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val stripContext_ = call (load_sym libglib "g_strip_context") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strjoinv_ = call (load_sym libglib "g_strjoinv") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strlcat_ =
        call (load_sym libglib "g_strlcat")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             --> FFI.Size.PolyML.cVal
          )
      val strlcpy_ =
        call (load_sym libglib "g_strlcpy")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             --> FFI.Size.PolyML.cVal
          )
      val strncasecmp_ =
        call (load_sym libglib "g_strncasecmp")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt.PolyML.cVal
             --> FFI.Int.PolyML.cVal
          )
      val strndup_ = call (load_sym libglib "g_strndup") (Utf8.PolyML.cInPtr &&> FFI.Size.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strnfill_ = call (load_sym libglib "g_strnfill") (FFI.Size.PolyML.cVal &&> FFI.Char.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strreverse_ = call (load_sym libglib "g_strreverse") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strrstr_ = call (load_sym libglib "g_strrstr") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strrstrLen_ =
        call (load_sym libglib "g_strrstr_len")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val strsignal_ = call (load_sym libglib "g_strsignal") (FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strstrLen_ =
        call (load_sym libglib "g_strstr_len")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val strtod_ = call (load_sym libglib "g_strtod") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Double.PolyML.cVal)
      val strup_ = call (load_sym libglib "g_strup") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strvLength_ = call (load_sym libglib "g_strv_length") (Utf8.PolyML.cInPtr --> FFI.UInt.PolyML.cVal)
      val testBug_ = call (load_sym libglib "g_test_bug") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val testBugBase_ = call (load_sym libglib "g_test_bug_base") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val testFail_ = call (load_sym libglib "g_test_fail") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val testLogTypeName_ = call (load_sym libglib "g_test_log_type_name") (GLibTestLogType.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val testRandDouble_ = call (load_sym libglib "g_test_rand_double") (FFI.PolyML.cVoid --> FFI.Double.PolyML.cVal)
      val testRandDoubleRange_ = call (load_sym libglib "g_test_rand_double_range") (FFI.Double.PolyML.cVal &&> FFI.Double.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val testRandInt_ = call (load_sym libglib "g_test_rand_int") (FFI.PolyML.cVoid --> FFI.Int32.PolyML.cVal)
      val testRandIntRange_ = call (load_sym libglib "g_test_rand_int_range") (FFI.Int32.PolyML.cVal &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val testRun_ = call (load_sym libglib "g_test_run") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val testRunSuite_ = call (load_sym libglib "g_test_run_suite") (GLibTestSuiteRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val testTimerElapsed_ = call (load_sym libglib "g_test_timer_elapsed") (FFI.PolyML.cVoid --> FFI.Double.PolyML.cVal)
      val testTimerLast_ = call (load_sym libglib "g_test_timer_last") (FFI.PolyML.cVoid --> FFI.Double.PolyML.cVal)
      val testTimerStart_ = call (load_sym libglib "g_test_timer_start") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val testTrapAssertions_ =
        call (load_sym libglib "g_test_trap_assertions")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val testTrapFork_ = call (load_sym libglib "g_test_trap_fork") (FFI.UInt64.PolyML.cVal &&> GLibTestTrapFlags.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val testTrapHasPassed_ = call (load_sym libglib "g_test_trap_has_passed") (FFI.PolyML.cVoid --> FFI.Bool.PolyML.cVal)
      val testTrapReachedTimeout_ = call (load_sym libglib "g_test_trap_reached_timeout") (FFI.PolyML.cVoid --> FFI.Bool.PolyML.cVal)
      val threadErrorQuark_ = call (load_sym libglib "g_thread_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val threadGetInitialized_ = call (load_sym libglib "g_thread_get_initialized") (FFI.PolyML.cVoid --> FFI.Bool.PolyML.cVal)
      val threadInit_ = call (load_sym libglib "g_thread_init") (GLibThreadFunctionsRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val threadInitWithErrorcheckMutexes_ = call (load_sym libglib "g_thread_init_with_errorcheck_mutexes") (GLibThreadFunctionsRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val threadPoolGetMaxIdleTime_ = call (load_sym libglib "g_thread_pool_get_max_idle_time") (FFI.PolyML.cVoid --> FFI.UInt.PolyML.cVal)
      val threadPoolGetMaxUnusedThreads_ = call (load_sym libglib "g_thread_pool_get_max_unused_threads") (FFI.PolyML.cVoid --> FFI.Int.PolyML.cVal)
      val threadPoolGetNumUnusedThreads_ = call (load_sym libglib "g_thread_pool_get_num_unused_threads") (FFI.PolyML.cVoid --> FFI.UInt.PolyML.cVal)
      val threadPoolSetMaxIdleTime_ = call (load_sym libglib "g_thread_pool_set_max_idle_time") (FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val threadPoolSetMaxUnusedThreads_ = call (load_sym libglib "g_thread_pool_set_max_unused_threads") (FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val threadPoolStopUnusedThreads_ = call (load_sym libglib "g_thread_pool_stop_unused_threads") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val timeValFromIso8601_ = call (load_sym libglib "g_time_val_from_iso8601") (Utf8.PolyML.cInPtr &&> GLibTimeValRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val timeoutSourceNew_ = call (load_sym libglib "g_timeout_source_new") (FFI.UInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val timeoutSourceNewSeconds_ = call (load_sym libglib "g_timeout_source_new_seconds") (FFI.UInt.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val trashStackHeight_ = call (load_sym libglib "g_trash_stack_height") (GLibTrashStackRecord.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val unicharBreakType_ = call (load_sym libglib "g_unichar_break_type") (FFI.Char.PolyML.cVal --> GLibUnicodeBreakType.PolyML.cVal)
      val unicharCombiningClass_ = call (load_sym libglib "g_unichar_combining_class") (FFI.Char.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val unicharDigitValue_ = call (load_sym libglib "g_unichar_digit_value") (FFI.Char.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val unicharGetScript_ = call (load_sym libglib "g_unichar_get_script") (FFI.Char.PolyML.cVal --> GLibUnicodeScript.PolyML.cVal)
      val unicharIsalnum_ = call (load_sym libglib "g_unichar_isalnum") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsalpha_ = call (load_sym libglib "g_unichar_isalpha") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIscntrl_ = call (load_sym libglib "g_unichar_iscntrl") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsdefined_ = call (load_sym libglib "g_unichar_isdefined") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsdigit_ = call (load_sym libglib "g_unichar_isdigit") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsgraph_ = call (load_sym libglib "g_unichar_isgraph") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIslower_ = call (load_sym libglib "g_unichar_islower") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsmark_ = call (load_sym libglib "g_unichar_ismark") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsprint_ = call (load_sym libglib "g_unichar_isprint") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIspunct_ = call (load_sym libglib "g_unichar_ispunct") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsspace_ = call (load_sym libglib "g_unichar_isspace") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIstitle_ = call (load_sym libglib "g_unichar_istitle") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsupper_ = call (load_sym libglib "g_unichar_isupper") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIswide_ = call (load_sym libglib "g_unichar_iswide") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIswideCjk_ = call (load_sym libglib "g_unichar_iswide_cjk") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIsxdigit_ = call (load_sym libglib "g_unichar_isxdigit") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharIszerowidth_ = call (load_sym libglib "g_unichar_iszerowidth") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharToUtf8_ = call (load_sym libglib "g_unichar_to_utf8") (FFI.Char.PolyML.cVal &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val unicharTolower_ = call (load_sym libglib "g_unichar_tolower") (FFI.Char.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val unicharTotitle_ = call (load_sym libglib "g_unichar_totitle") (FFI.Char.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val unicharToupper_ = call (load_sym libglib "g_unichar_toupper") (FFI.Char.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val unicharType_ = call (load_sym libglib "g_unichar_type") (FFI.Char.PolyML.cVal --> GLibUnicodeType.PolyML.cVal)
      val unicharValidate_ = call (load_sym libglib "g_unichar_validate") (FFI.Char.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val unicharXdigitValue_ = call (load_sym libglib "g_unichar_xdigit_value") (FFI.Char.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val unicodeScriptFromIso15924_ = call (load_sym libglib "g_unicode_script_from_iso15924") (FFI.UInt32.PolyML.cVal --> GLibUnicodeScript.PolyML.cVal)
      val unicodeScriptToIso15924_ = call (load_sym libglib "g_unicode_script_to_iso15924") (GLibUnicodeScript.PolyML.cVal --> FFI.UInt32.PolyML.cVal)
      val unlink_ = call (load_sym libglib "g_unlink") (Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val unsetenv_ = call (load_sym libglib "g_unsetenv") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val uriEscapeString_ =
        call (load_sym libglib "g_uri_escape_string")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val uriParseScheme_ = call (load_sym libglib "g_uri_parse_scheme") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val uriUnescapeSegment_ =
        call (load_sym libglib "g_uri_unescape_segment")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val uriUnescapeString_ = call (load_sym libglib "g_uri_unescape_string") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val usleep_ = call (load_sym libglib "g_usleep") (FFI.ULong.PolyML.cVal --> FFI.PolyML.cVoid)
      val utf8Casefold_ = call (load_sym libglib "g_utf8_casefold") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Collate_ = call (load_sym libglib "g_utf8_collate") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Int.PolyML.cVal)
      val utf8CollateKey_ = call (load_sym libglib "g_utf8_collate_key") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8CollateKeyForFilename_ = call (load_sym libglib "g_utf8_collate_key_for_filename") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8FindNextChar_ = call (load_sym libglib "g_utf8_find_next_char") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val utf8FindPrevChar_ = call (load_sym libglib "g_utf8_find_prev_char") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val utf8GetChar_ = call (load_sym libglib "g_utf8_get_char") (Utf8.PolyML.cInPtr --> FFI.Char.PolyML.cVal)
      val utf8GetCharValidated_ = call (load_sym libglib "g_utf8_get_char_validated") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> FFI.Char.PolyML.cVal)
      val utf8Normalize_ =
        call (load_sym libglib "g_utf8_normalize")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> GLibNormalizeMode.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8OffsetToPointer_ = call (load_sym libglib "g_utf8_offset_to_pointer") (Utf8.PolyML.cInPtr &&> FFI.Long.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8PointerToOffset_ = call (load_sym libglib "g_utf8_pointer_to_offset") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> FFI.Long.PolyML.cVal)
      val utf8PrevChar_ = call (load_sym libglib "g_utf8_prev_char") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val utf8Strchr_ =
        call (load_sym libglib "g_utf8_strchr")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> FFI.Char.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Strdown_ = call (load_sym libglib "g_utf8_strdown") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Strlen_ = call (load_sym libglib "g_utf8_strlen") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> FFI.Long.PolyML.cVal)
      val utf8Strncpy_ =
        call (load_sym libglib "g_utf8_strncpy")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Size.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Strrchr_ =
        call (load_sym libglib "g_utf8_strrchr")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> FFI.Char.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Strreverse_ = call (load_sym libglib "g_utf8_strreverse") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Strup_ = call (load_sym libglib "g_utf8_strup") (Utf8.PolyML.cInPtr &&> FFI.SSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Substring_ =
        call (load_sym libglib "g_utf8_substring")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Long.PolyML.cVal
             &&> FFI.Long.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Validate_ =
        call (load_sym libglib "g_utf8_validate")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> Utf8.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val variantGetType_ = call (load_sym libglib "g_variant_get_type") (GLibVariantRecord.PolyML.cPtr --> GLibVariantTypeRecord.PolyML.cPtr)
      val variantIsObjectPath_ = call (load_sym libglib "g_variant_is_object_path") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val variantIsSignature_ = call (load_sym libglib "g_variant_is_signature") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val variantParse_ =
        call (load_sym libglib "g_variant_parse")
          (
            GLibVariantTypeRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibVariantRecord.PolyML.cPtr
          )
      val variantParserGetErrorQuark_ = call (load_sym libglib "g_variant_parser_get_error_quark") (FFI.PolyML.cVoid --> GLibQuark.PolyML.cVal)
      val variantTypeStringIsValid_ = call (load_sym libglib "g_variant_type_string_is_valid") (Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val variantTypeStringScan_ =
        call (load_sym libglib "g_variant_type_string_scan")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cOutRef
             --> FFI.Bool.PolyML.cVal
          )
      val warnMessage_ =
        call (load_sym libglib "g_warn_message")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
    end
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure DateDay = GLibDateDay
    structure DateYear = GLibDateYear
    structure Pid = GLibPid
    structure Quark = GLibQuark
    structure Time = GLibTime
    structure TimeSpan = GLibTimeSpan
    structure AsciiType = GLibAsciiType
    structure ChecksumType = GLibChecksumType
    structure DateDMY = GLibDateDMY
    structure DateMonth = GLibDateMonth
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
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SliceConfig = GLibSliceConfig
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure TestLogType = GLibTestLogType
    structure TestTrapFlags = GLibTestTrapFlags
    structure ThreadPriority = GLibThreadPriority
    structure TimeType = GLibTimeType
    structure TimeValRecord = GLibTimeValRecord
    structure TokenType = GLibTokenType
    structure TraverseFlags = GLibTraverseFlags
    structure TraverseType = GLibTraverseType
    structure UnicodeBreakType = GLibUnicodeBreakType
    structure UnicodeScript = GLibUnicodeScript
    structure UnicodeType = GLibUnicodeType
    structure UserDirectory = GLibUserDirectory
    structure VariantClass = GLibVariantClass
    structure VariantParseError = GLibVariantParseError
    structure ChildWatchFunc = GLibChildWatchFunc
    structure IOFunc = GLibIOFunc
    structure ErrorRecord = GLibErrorRecord
    structure KeyFile = GLibKeyFile
    structure MatchInfo = GLibMatchInfo
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure TimeVal = GLibTimeVal
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
    fun access filename mode = (Utf8.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) access_ (filename & mode)
    fun asciiDigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) asciiDigitValue_ c
    fun asciiDtostr buffer bufLen d =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Double.C.withVal
         ---> Utf8.C.fromPtr true
      )
        asciiDtostr_
        (
          buffer
           & bufLen
           & d
        )
    fun asciiFormatd buffer bufLen format d =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.Double.C.withVal
         ---> Utf8.C.fromPtr true
      )
        asciiFormatd_
        (
          buffer
           & bufLen
           & format
           & d
        )
    fun asciiStrcasecmp s1 s2 = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) asciiStrcasecmp_ (s1 & s2)
    fun asciiStrdown str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) asciiStrdown_ (str & len)
    fun asciiStrncasecmp s1 s2 n =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         ---> FFI.Int.C.fromVal
      )
        asciiStrncasecmp_
        (
          s1
           & s2
           & n
        )
    fun asciiStrtod nptr endptr = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Double.C.fromVal) asciiStrtod_ (nptr & endptr)
    fun asciiStrtoll nptr endptr base =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.Int64.C.fromVal
      )
        asciiStrtoll_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrtoull nptr endptr base =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.UInt64.C.fromVal
      )
        asciiStrtoull_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrup str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) asciiStrup_ (str & len)
    fun asciiTolower c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) asciiTolower_ c
    fun asciiToupper c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) asciiToupper_ c
    fun asciiXdigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) asciiXdigitValue_ c
    fun assertWarning logDomain file line prettyFunction expression =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun assertionMessage domain file line func message =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun assertionMessageCmpstr domain file line func expr arg1 cmp arg2 =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun assertionMessageExpr domain file line func expr =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun basename fileName = (Utf8.C.withPtr ---> Utf8.C.fromPtr false) basename_ fileName
    fun bitNthLsf mask nthBit = (FFI.ULong.C.withVal &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) bitNthLsf_ (mask & nthBit)
    fun bitNthMsf mask nthBit = (FFI.ULong.C.withVal &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) bitNthMsf_ (mask & nthBit)
    fun bitStorage number = (FFI.ULong.C.withVal ---> FFI.UInt.C.fromVal) bitStorage_ number
    fun blowChunks () = (I ---> I) blowChunks_ ()
    fun bookmarkFileErrorQuark () = (I ---> GLibQuark.C.fromVal) bookmarkFileErrorQuark_ ()
    fun chdir path = (Utf8.C.withPtr ---> FFI.Int.C.fromVal) chdir_ path
    fun checkVersion requiredMajor requiredMinor requiredMicro =
      (
        FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> Utf8.C.fromPtr false
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun checksumTypeGetLength checksumType = (GLibChecksumType.C.withVal ---> FFI.SSize.C.fromVal) checksumTypeGetLength_ checksumType
    fun childWatchSourceNew pid = (GLibPid.C.withVal ---> GLibSourceRecord.C.fromPtr true) childWatchSourceNew_ pid
    fun clearError () = (GLibErrorRecord.handleError ---> I) clearError_ []
    fun computeChecksumForString checksumType str length =
      (
        GLibChecksumType.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         ---> Utf8.C.fromPtr true
      )
        computeChecksumForString_
        (
          checksumType
           & str
           & length
        )
    fun convert str len toCodeset fromCodeset =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.C.withPtr
             &&&> FFI.SSize.C.withVal
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.Size.C.withRefVal
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Size.C.fromVal
                   && FFI.Size.C.fromVal
                   && Utf8.C.fromPtr true
          )
            convert_
            (
              str
               & len
               & toCodeset
               & fromCodeset
               & FFI.Size.null
               & FFI.Size.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun convertErrorQuark () = (I ---> GLibQuark.C.fromVal) convertErrorQuark_ ()
    fun datalistClear datalist = (GLibDataRecord.C.withPtr ---> I) datalistClear_ datalist
    fun datalistGetFlags datalist = (GLibDataRecord.C.withPtr ---> FFI.UInt.C.fromVal) datalistGetFlags_ datalist
    fun datalistInit datalist = (GLibDataRecord.C.withPtr ---> I) datalistInit_ datalist
    fun datalistSetFlags datalist flags = (GLibDataRecord.C.withPtr &&&> FFI.UInt.C.withVal ---> I) datalistSetFlags_ (datalist & flags)
    fun datalistUnsetFlags datalist flags = (GLibDataRecord.C.withPtr &&&> FFI.UInt.C.withVal ---> I) datalistUnsetFlags_ (datalist & flags)
    fun dateGetDaysInMonth month year = (GLibDateMonth.C.withVal &&&> GLibDateYear.C.withVal ---> FFI.UInt8.C.fromVal) dateGetDaysInMonth_ (month & year)
    fun dateGetMondayWeeksInYear year = (GLibDateYear.C.withVal ---> FFI.UInt8.C.fromVal) dateGetMondayWeeksInYear_ year
    fun dateGetSundayWeeksInYear year = (GLibDateYear.C.withVal ---> FFI.UInt8.C.fromVal) dateGetSundayWeeksInYear_ year
    fun dateIsLeapYear year = (GLibDateYear.C.withVal ---> FFI.Bool.C.fromVal) dateIsLeapYear_ year
    fun dateStrftime s slen format date =
      (
        Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         &&&> Utf8.C.withPtr
         &&&> GLibDateRecord.C.withPtr
         ---> FFI.Size.C.fromVal
      )
        dateStrftime_
        (
          s
           & slen
           & format
           & date
        )
    fun dateValidDay day = (GLibDateDay.C.withVal ---> FFI.Bool.C.fromVal) dateValidDay_ day
    fun dateValidDmy day month year =
      (
        GLibDateDay.C.withVal
         &&&> GLibDateMonth.C.withVal
         &&&> GLibDateYear.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        dateValidDmy_
        (
          day
           & month
           & year
        )
    fun dateValidJulian julianDate = (FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) dateValidJulian_ julianDate
    fun dateValidMonth month = (GLibDateMonth.C.withVal ---> FFI.Bool.C.fromVal) dateValidMonth_ month
    fun dateValidWeekday weekday = (GLibDateWeekday.C.withVal ---> FFI.Bool.C.fromVal) dateValidWeekday_ weekday
    fun dateValidYear year = (GLibDateYear.C.withVal ---> FFI.Bool.C.fromVal) dateValidYear_ year
    fun dcgettext domain msgid category =
      (
        Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> Utf8.C.fromPtr false
      )
        dcgettext_
        (
          domain
           & msgid
           & category
        )
    fun dgettext domain msgid = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) dgettext_ (domain & msgid)
    fun dirMakeTmp tmpl = (Utf8.C.withOptPtr &&&> GLibErrorRecord.handleError ---> Utf8.C.fromPtr true) dirMakeTmp_ (tmpl & [])
    fun dngettext domain msgid msgidPlural n =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.ULong.C.withVal
         ---> Utf8.C.fromPtr false
      )
        dngettext_
        (
          domain
           & msgid
           & msgidPlural
           & n
        )
    fun dpgettext domain msgctxtid msgidoffset =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         ---> Utf8.C.fromPtr false
      )
        dpgettext_
        (
          domain
           & msgctxtid
           & msgidoffset
        )
    fun dpgettext2 domain context msgid =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> Utf8.C.fromPtr false
      )
        dpgettext2_
        (
          domain
           & context
           & msgid
        )
    fun dummyDecl () = (I ---> I) dummyDecl_ ()
    fun fileErrorFromErrno errNo = (FFI.Int.C.withVal ---> GLibFileError.C.fromVal) fileErrorFromErrno_ errNo
    fun fileErrorQuark () = (I ---> GLibQuark.C.fromVal) fileErrorQuark_ ()
    fun fileOpenTmp tmpl =
      let
        val nameUsed & retVal =
          (
            Utf8.C.withOptPtr
             &&&> Utf8.C.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.C.fromPtr true && FFI.Int.C.fromVal
          )
            fileOpenTmp_
            (
              tmpl
               & NONE
               & []
            )
      in
        (retVal, nameUsed)
      end
    fun fileReadLink filename = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.C.fromPtr true) fileReadLink_ (filename & [])
    fun fileTest filename test = (Utf8.C.withPtr &&&> GLibFileTest.C.withVal ---> FFI.Bool.C.fromVal) fileTest_ (filename & test)
    fun filenameDisplayBasename filename = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) filenameDisplayBasename_ filename
    fun filenameDisplayName filename = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) filenameDisplayName_ filename
    fun filenameFromUri uri hostname =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.C.fromPtr true
      )
        filenameFromUri_
        (
          uri
           & hostname
           & []
        )
    fun filenameToUri filename hostname =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> Utf8.C.fromPtr true
      )
        filenameToUri_
        (
          filename
           & hostname
           & []
        )
    fun findProgramInPath program = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) findProgramInPath_ program
    fun formatSize size = (FFI.UInt64.C.withVal ---> Utf8.C.fromPtr true) formatSize_ size
    fun formatSizeForDisplay size = (FFI.Int64.C.withVal ---> Utf8.C.fromPtr true) formatSizeForDisplay_ size
    fun formatSizeFull size flags = (FFI.UInt64.C.withVal &&&> GLibFormatSizeFlags.C.withVal ---> Utf8.C.fromPtr true) formatSizeFull_ (size & flags)
    fun getApplicationName () = (I ---> Utf8.C.fromPtr false) getApplicationName_ ()
    fun getCharset charset = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getCharset_ charset
    fun getCurrentDir () = (I ---> Utf8.C.fromPtr true) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.C.withPtr ---> I) getCurrentTime_ result
    fun getFilenameCharsets charsets = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getFilenameCharsets_ charsets
    fun getHomeDir () = (I ---> Utf8.C.fromPtr false) getHomeDir_ ()
    fun getHostName () = (I ---> Utf8.C.fromPtr false) getHostName_ ()
    fun getMonotonicTime () = (I ---> FFI.Int64.C.fromVal) getMonotonicTime_ ()
    fun getPrgname () = (I ---> Utf8.C.fromPtr true) getPrgname_ ()
    fun getRealName () = (I ---> Utf8.C.fromPtr false) getRealName_ ()
    fun getRealTime () = (I ---> FFI.Int64.C.fromVal) getRealTime_ ()
    fun getTmpDir () = (I ---> Utf8.C.fromPtr false) getTmpDir_ ()
    fun getUserCacheDir () = (I ---> Utf8.C.fromPtr false) getUserCacheDir_ ()
    fun getUserConfigDir () = (I ---> Utf8.C.fromPtr false) getUserConfigDir_ ()
    fun getUserDataDir () = (I ---> Utf8.C.fromPtr false) getUserDataDir_ ()
    fun getUserName () = (I ---> Utf8.C.fromPtr false) getUserName_ ()
    fun getUserRuntimeDir () = (I ---> Utf8.C.fromPtr false) getUserRuntimeDir_ ()
    fun getUserSpecialDir directory = (GLibUserDirectory.C.withVal ---> Utf8.C.fromPtr false) getUserSpecialDir_ directory
    fun getenv variable = (Utf8.C.withPtr ---> Utf8.C.fromPtr false) getenv_ variable
    fun hookDestroy hookList hookId = (GLibHookListRecord.C.withPtr &&&> FFI.ULong.C.withVal ---> FFI.Bool.C.fromVal) hookDestroy_ (hookList & hookId)
    fun hookDestroyLink hookList hook = (GLibHookListRecord.C.withPtr &&&> GLibHookRecord.C.withPtr ---> I) hookDestroyLink_ (hookList & hook)
    fun hookFree hookList hook = (GLibHookListRecord.C.withPtr &&&> GLibHookRecord.C.withPtr ---> I) hookFree_ (hookList & hook)
    fun hookInsertBefore hookList sibling hook =
      (
        GLibHookListRecord.C.withPtr
         &&&> GLibHookRecord.C.withPtr
         &&&> GLibHookRecord.C.withPtr
         ---> I
      )
        hookInsertBefore_
        (
          hookList
           & sibling
           & hook
        )
    fun hookPrepend hookList hook = (GLibHookListRecord.C.withPtr &&&> GLibHookRecord.C.withPtr ---> I) hookPrepend_ (hookList & hook)
    fun hookUnref hookList hook = (GLibHookListRecord.C.withPtr &&&> GLibHookRecord.C.withPtr ---> I) hookUnref_ (hookList & hook)
    fun hostnameIsAsciiEncoded hostname = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) hostnameToUnicode_ hostname
    fun idleSourceNew () = (I ---> GLibSourceRecord.C.fromPtr true) idleSourceNew_ ()
    fun internStaticString string = (Utf8.C.withOptPtr ---> Utf8.C.fromPtr false) internStaticString_ string
    fun internString string = (Utf8.C.withOptPtr ---> Utf8.C.fromPtr false) internString_ string
    fun ioChannelErrorFromErrno en = (FFI.Int.C.withVal ---> GLibIOChannelError.C.fromVal) ioChannelErrorFromErrno_ en
    fun ioChannelErrorQuark () = (I ---> GLibQuark.C.fromVal) ioChannelErrorQuark_ ()
    fun ioCreateWatch channel condition = (GLibIOChannelRecord.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibSourceRecord.C.fromPtr true) ioCreateWatch_ (channel & condition)
    fun keyFileErrorQuark () = (I ---> GLibQuark.C.fromVal) keyFileErrorQuark_ ()
    fun listPopAllocator () = (I ---> I) listPopAllocator_ ()
    fun logRemoveHandler logDomain handlerId = (Utf8.C.withPtr &&&> FFI.UInt.C.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask logDomain fatalMask = (Utf8.C.withPtr &&&> GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainContextDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextDefault_ ()
    fun mainContextGetThreadDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextGetThreadDefault_ ()
    fun mainCurrentSource () = (I ---> GLibSourceRecord.C.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> FFI.Int.C.fromVal) mainDepth_ ()
    fun markupErrorQuark () = (I ---> GLibQuark.C.fromVal) markupErrorQuark_ ()
    fun markupEscapeText text length = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) markupEscapeText_ (text & length)
    fun memChunkInfo () = (I ---> I) memChunkInfo_ ()
    fun memIsSystemMalloc () = (I ---> FFI.Bool.C.fromVal) memIsSystemMalloc_ ()
    fun memProfile () = (I ---> I) memProfile_ ()
    fun memSetVtable vtable = (GLibMemVTableRecord.C.withPtr ---> I) memSetVtable_ vtable
    fun mkdirWithParents pathname mode = (Utf8.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) mkdirWithParents_ (pathname & mode)
    fun mkdtemp tmpl = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) mkdtemp_ tmpl
    fun mkdtempFull tmpl mode = (Utf8.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) mkdtempFull_ (tmpl & mode)
    fun mkstemp tmpl = (Utf8.C.withPtr ---> FFI.Int.C.fromVal) mkstemp_ tmpl
    fun mkstempFull tmpl flags mode =
      (
        Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        mkstempFull_
        (
          tmpl
           & flags
           & mode
        )
    fun nodePopAllocator () = (I ---> I) nodePopAllocator_ ()
    fun onErrorQuery prgName = (Utf8.C.withPtr ---> I) onErrorQuery_ prgName
    fun onErrorStackTrace prgName = (Utf8.C.withPtr ---> I) onErrorStackTrace_ prgName
    fun optionErrorQuark () = (I ---> GLibQuark.C.fromVal) optionErrorQuark_ ()
    fun pathGetBasename fileName = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) pathGetBasename_ fileName
    fun pathGetDirname fileName = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) pathGetDirname_ fileName
    fun pathIsAbsolute fileName = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) pathIsAbsolute_ fileName
    fun pathSkipRoot fileName = (Utf8.C.withPtr ---> Utf8.C.fromPtr false) pathSkipRoot_ fileName
    fun patternMatch pspec stringLength string stringReversed =
      (
        GLibPatternSpecRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        patternMatch_
        (
          pspec
           & stringLength
           & string
           & stringReversed
        )
    fun patternMatchSimple pattern string = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) patternMatchSimple_ (pattern & string)
    fun patternMatchString pspec string = (GLibPatternSpecRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) patternMatchString_ (pspec & string)
    fun poll fds nfds timeout =
      (
        GLibPollFDRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        poll_
        (
          fds
           & nfds
           & timeout
        )
    fun quarkFromStaticString string = (Utf8.C.withOptPtr ---> GLibQuark.C.fromVal) quarkFromStaticString_ string
    fun quarkFromString string = (Utf8.C.withOptPtr ---> GLibQuark.C.fromVal) quarkFromString_ string
    fun quarkToString quark = (GLibQuark.C.withVal ---> Utf8.C.fromPtr false) quarkToString_ quark
    fun quarkTryString string = (Utf8.C.withOptPtr ---> GLibQuark.C.fromVal) quarkTryString_ string
    fun randomDouble () = (I ---> FFI.Double.C.fromVal) randomDouble_ ()
    fun randomDoubleRange begin end' = (FFI.Double.C.withVal &&&> FFI.Double.C.withVal ---> FFI.Double.C.fromVal) randomDoubleRange_ (begin & end')
    fun randomInt () = (I ---> FFI.UInt32.C.fromVal) randomInt_ ()
    fun randomIntRange begin end' = (FFI.Int32.C.withVal &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) randomIntRange_ (begin & end')
    fun randomSetSeed seed = (FFI.UInt32.C.withVal ---> I) randomSetSeed_ seed
    fun regexCheckReplacement replacement =
      let
        val hasReferences & retVal =
          (
            Utf8.C.withPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Bool.C.fromVal && FFI.Bool.C.fromVal
          )
            regexCheckReplacement_
            (
              replacement
               & FFI.Bool.null
               & []
            )
      in
        if retVal then SOME hasReferences else NONE
      end
    fun regexErrorQuark () = (I ---> GLibQuark.C.fromVal) regexErrorQuark_ ()
    fun regexEscapeNul string length = (Utf8.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) regexEscapeNul_ (string & length)
    fun regexMatchSimple pattern string compileOptions matchOptions =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun reloadUserSpecialDirsCache () = (I ---> I) reloadUserSpecialDirsCache_ ()
    fun returnIfFailWarning logDomain prettyFunction expression =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        returnIfFailWarning_
        (
          logDomain
           & prettyFunction
           & expression
        )
    fun rmdir filename = (Utf8.C.withPtr ---> FFI.Int.C.fromVal) rmdir_ filename
    fun sequenceMove src dest = (GLibSequenceIterRecord.C.withPtr &&&> GLibSequenceIterRecord.C.withPtr ---> I) sequenceMove_ (src & dest)
    fun sequenceMoveRange dest begin end' =
      (
        GLibSequenceIterRecord.C.withPtr
         &&&> GLibSequenceIterRecord.C.withPtr
         &&&> GLibSequenceIterRecord.C.withPtr
         ---> I
      )
        sequenceMoveRange_
        (
          dest
           & begin
           & end'
        )
    fun sequenceRemove iter = (GLibSequenceIterRecord.C.withPtr ---> I) sequenceRemove_ iter
    fun sequenceRemoveRange begin end' = (GLibSequenceIterRecord.C.withPtr &&&> GLibSequenceIterRecord.C.withPtr ---> I) sequenceRemoveRange_ (begin & end')
    fun sequenceSwap a b = (GLibSequenceIterRecord.C.withPtr &&&> GLibSequenceIterRecord.C.withPtr ---> I) sequenceSwap_ (a & b)
    fun setApplicationName applicationName = (Utf8.C.withPtr ---> I) setApplicationName_ applicationName
    fun setPrgname prgname = (Utf8.C.withPtr ---> I) setPrgname_ prgname
    fun setenv variable value overwrite =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setenv_
        (
          variable
           & value
           & overwrite
        )
    fun shellErrorQuark () = (I ---> GLibQuark.C.fromVal) shellErrorQuark_ ()
    fun shellQuote unquotedString = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.C.fromPtr true) shellUnquote_ (quotedString & [])
    fun sliceGetConfig ckey = (GLibSliceConfig.C.withVal ---> FFI.Int64.C.fromVal) sliceGetConfig_ ckey
    fun sliceSetConfig ckey value = (GLibSliceConfig.C.withVal &&&> FFI.Int64.C.withVal ---> I) sliceSetConfig_ (ckey & value)
    fun sourceRemove tag = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) sourceRemove_ tag
    fun sourceSetNameById tag name = (FFI.UInt.C.withVal &&&> Utf8.C.withPtr ---> I) sourceSetNameById_ (tag & name)
    fun spacedPrimesClosest num = (FFI.UInt.C.withVal ---> FFI.UInt.C.fromVal) spacedPrimesClosest_ num
    fun spawnClosePid pid = (GLibPid.C.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun spawnErrorQuark () = (I ---> GLibQuark.C.fromVal) spawnErrorQuark_ ()
    fun stpcpy dest src = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) stpcpy_ (dest & src)
    fun strHasPrefix str prefix = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) strHasPrefix_ (str & prefix)
    fun strHasSuffix str suffix = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) strHasSuffix_ (str & suffix)
    fun strcanon string validChars substitutor =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Char.C.withVal
         ---> Utf8.C.fromPtr true
      )
        strcanon_
        (
          string
           & validChars
           & substitutor
        )
    fun strcasecmp s1 s2 = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) strcasecmp_ (s1 & s2)
    fun strchomp string = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strchomp_ string
    fun strchug string = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strchug_ string
    fun strcmp0 str1 str2 = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) strcmp0_ (str1 & str2)
    fun strcompress source = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strcompress_ source
    fun strdelimit string delimiters newDelimiter =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Char.C.withVal
         ---> Utf8.C.fromPtr true
      )
        strdelimit_
        (
          string
           & delimiters
           & newDelimiter
        )
    fun strdown string = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strdown_ string
    fun strdup str = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strdup_ str
    fun strerror errnum = (FFI.Int.C.withVal ---> Utf8.C.fromPtr false) strerror_ errnum
    fun strescape source exceptions = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) strescape_ (source & exceptions)
    fun strfreev strArray = (Utf8.C.withPtr ---> I) strfreev_ strArray
    fun stringNew init = (Utf8.C.withPtr ---> GLibStringRecord.C.fromPtr true) stringNew_ init
    fun stringNewLen init len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> GLibStringRecord.C.fromPtr true) stringNewLen_ (init & len)
    fun stringSizedNew dflSize = (FFI.Size.C.withVal ---> GLibStringRecord.C.fromPtr true) stringSizedNew_ dflSize
    fun stripContext msgid msgval = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) stripContext_ (msgid & msgval)
    fun strjoinv separator strArray = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) strjoinv_ (separator & strArray)
    fun strlcat dest src destSize =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         ---> FFI.Size.C.fromVal
      )
        strlcat_
        (
          dest
           & src
           & destSize
        )
    fun strlcpy dest src destSize =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         ---> FFI.Size.C.fromVal
      )
        strlcpy_
        (
          dest
           & src
           & destSize
        )
    fun strncasecmp s1 s2 n =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.Int.C.fromVal
      )
        strncasecmp_
        (
          s1
           & s2
           & n
        )
    fun strndup str n = (Utf8.C.withPtr &&&> FFI.Size.C.withVal ---> Utf8.C.fromPtr true) strndup_ (str & n)
    fun strnfill length fillChar = (FFI.Size.C.withVal &&&> FFI.Char.C.withVal ---> Utf8.C.fromPtr true) strnfill_ (length & fillChar)
    fun strreverse string = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strreverse_ string
    fun strrstr haystack needle = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) strrstr_ (haystack & needle)
    fun strrstrLen haystack haystackLen needle =
      (
        Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> Utf8.C.withPtr
         ---> Utf8.C.fromPtr true
      )
        strrstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strsignal signum = (FFI.Int.C.withVal ---> Utf8.C.fromPtr false) strsignal_ signum
    fun strstrLen haystack haystackLen needle =
      (
        Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> Utf8.C.withPtr
         ---> Utf8.C.fromPtr true
      )
        strstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strtod nptr endptr = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Double.C.fromVal) strtod_ (nptr & endptr)
    fun strup string = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) strup_ string
    fun strvLength strArray = (Utf8.C.withPtr ---> FFI.UInt.C.fromVal) strvLength_ strArray
    fun testBug bugUriSnippet = (Utf8.C.withPtr ---> I) testBug_ bugUriSnippet
    fun testBugBase uriPattern = (Utf8.C.withPtr ---> I) testBugBase_ uriPattern
    fun testFail () = (I ---> I) testFail_ ()
    fun testLogTypeName logType = (GLibTestLogType.C.withVal ---> Utf8.C.fromPtr false) testLogTypeName_ logType
    fun testRandDouble () = (I ---> FFI.Double.C.fromVal) testRandDouble_ ()
    fun testRandDoubleRange rangeStart rangeEnd = (FFI.Double.C.withVal &&&> FFI.Double.C.withVal ---> FFI.Double.C.fromVal) testRandDoubleRange_ (rangeStart & rangeEnd)
    fun testRandInt () = (I ---> FFI.Int32.C.fromVal) testRandInt_ ()
    fun testRandIntRange begin end' = (FFI.Int32.C.withVal &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) testRandIntRange_ (begin & end')
    fun testRun () = (I ---> FFI.Int.C.fromVal) testRun_ ()
    fun testRunSuite suite = (GLibTestSuiteRecord.C.withPtr ---> FFI.Int.C.fromVal) testRunSuite_ suite
    fun testTimerElapsed () = (I ---> FFI.Double.C.fromVal) testTimerElapsed_ ()
    fun testTimerLast () = (I ---> FFI.Double.C.fromVal) testTimerLast_ ()
    fun testTimerStart () = (I ---> I) testTimerStart_ ()
    fun testTrapAssertions domain file line func assertionFlags pattern =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> Utf8.C.withPtr
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
    fun testTrapFork usecTimeout testTrapFlags = (FFI.UInt64.C.withVal &&&> GLibTestTrapFlags.C.withVal ---> FFI.Bool.C.fromVal) testTrapFork_ (usecTimeout & testTrapFlags)
    fun testTrapHasPassed () = (I ---> FFI.Bool.C.fromVal) testTrapHasPassed_ ()
    fun testTrapReachedTimeout () = (I ---> FFI.Bool.C.fromVal) testTrapReachedTimeout_ ()
    fun threadErrorQuark () = (I ---> GLibQuark.C.fromVal) threadErrorQuark_ ()
    fun threadGetInitialized () = (I ---> FFI.Bool.C.fromVal) threadGetInitialized_ ()
    fun threadInit vtable = (GLibThreadFunctionsRecord.C.withPtr ---> I) threadInit_ vtable
    fun threadInitWithErrorcheckMutexes vtable = (GLibThreadFunctionsRecord.C.withPtr ---> I) threadInitWithErrorcheckMutexes_ vtable
    fun threadPoolGetMaxIdleTime () = (I ---> FFI.UInt.C.fromVal) threadPoolGetMaxIdleTime_ ()
    fun threadPoolGetMaxUnusedThreads () = (I ---> FFI.Int.C.fromVal) threadPoolGetMaxUnusedThreads_ ()
    fun threadPoolGetNumUnusedThreads () = (I ---> FFI.UInt.C.fromVal) threadPoolGetNumUnusedThreads_ ()
    fun threadPoolSetMaxIdleTime interval = (FFI.UInt.C.withVal ---> I) threadPoolSetMaxIdleTime_ interval
    fun threadPoolSetMaxUnusedThreads maxThreads = (FFI.Int.C.withVal ---> I) threadPoolSetMaxUnusedThreads_ maxThreads
    fun threadPoolStopUnusedThreads () = (I ---> I) threadPoolStopUnusedThreads_ ()
    fun timeValFromIso8601 isoDate time = (Utf8.C.withPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) timeValFromIso8601_ (isoDate & time)
    fun timeoutSourceNew interval = (FFI.UInt.C.withVal ---> GLibSourceRecord.C.fromPtr true) timeoutSourceNew_ interval
    fun timeoutSourceNewSeconds interval = (FFI.UInt.C.withVal ---> GLibSourceRecord.C.fromPtr true) timeoutSourceNewSeconds_ interval
    fun trashStackHeight stackP = (GLibTrashStackRecord.C.withPtr ---> FFI.UInt.C.fromVal) trashStackHeight_ stackP
    fun unicharBreakType c = (FFI.Char.C.withVal ---> GLibUnicodeBreakType.C.fromVal) unicharBreakType_ c
    fun unicharCombiningClass uc = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) unicharCombiningClass_ uc
    fun unicharDigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) unicharDigitValue_ c
    fun unicharGetScript ch = (FFI.Char.C.withVal ---> GLibUnicodeScript.C.fromVal) unicharGetScript_ ch
    fun unicharIsalnum c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsalnum_ c
    fun unicharIsalpha c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsalpha_ c
    fun unicharIscntrl c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIscntrl_ c
    fun unicharIsdefined c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsdefined_ c
    fun unicharIsdigit c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsdigit_ c
    fun unicharIsgraph c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsgraph_ c
    fun unicharIslower c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIslower_ c
    fun unicharIsmark c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsmark_ c
    fun unicharIsprint c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsprint_ c
    fun unicharIspunct c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIspunct_ c
    fun unicharIsspace c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsspace_ c
    fun unicharIstitle c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIstitle_ c
    fun unicharIsupper c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsupper_ c
    fun unicharIswide c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIswide_ c
    fun unicharIswideCjk c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIswideCjk_ c
    fun unicharIsxdigit c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIsxdigit_ c
    fun unicharIszerowidth c = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharIszerowidth_ c
    fun unicharToUtf8 c outbuf = (FFI.Char.C.withVal &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) unicharToUtf8_ (c & outbuf)
    fun unicharTolower c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) unicharTolower_ c
    fun unicharTotitle c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) unicharTotitle_ c
    fun unicharToupper c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) unicharToupper_ c
    fun unicharType c = (FFI.Char.C.withVal ---> GLibUnicodeType.C.fromVal) unicharType_ c
    fun unicharValidate ch = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharValidate_ ch
    fun unicharXdigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) unicharXdigitValue_ c
    fun unicodeScriptFromIso15924 iso15924 = (FFI.UInt32.C.withVal ---> GLibUnicodeScript.C.fromVal) unicodeScriptFromIso15924_ iso15924
    fun unicodeScriptToIso15924 script = (GLibUnicodeScript.C.withVal ---> FFI.UInt32.C.fromVal) unicodeScriptToIso15924_ script
    fun unlink filename = (Utf8.C.withPtr ---> FFI.Int.C.fromVal) unlink_ filename
    fun unsetenv variable = (Utf8.C.withPtr ---> I) unsetenv_ variable
    fun uriEscapeString unescaped reservedCharsAllowed allowUtf8 =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> Utf8.C.fromPtr true
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriParseScheme uri = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) uriParseScheme_ uri
    fun uriUnescapeSegment escapedString escapedStringEnd illegalCharacters =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> Utf8.C.fromPtr true
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString escapedString illegalCharacters = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) uriUnescapeString_ (escapedString & illegalCharacters)
    fun usleep microseconds = (FFI.ULong.C.withVal ---> I) usleep_ microseconds
    fun utf8Casefold str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) utf8Casefold_ (str & len)
    fun utf8Collate str1 str2 = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int.C.fromVal) utf8Collate_ (str1 & str2)
    fun utf8CollateKey str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) utf8CollateKey_ (str & len)
    fun utf8CollateKeyForFilename str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) utf8CollateKeyForFilename_ (str & len)
    fun utf8FindNextChar p end' = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) utf8FindNextChar_ (p & end')
    fun utf8FindPrevChar str p = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr true) utf8FindPrevChar_ (str & p)
    fun utf8GetChar p = (Utf8.C.withPtr ---> FFI.Char.C.fromVal) utf8GetChar_ p
    fun utf8GetCharValidated p maxLen = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> FFI.Char.C.fromVal) utf8GetCharValidated_ (p & maxLen)
    fun utf8Normalize str len mode =
      (
        Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> GLibNormalizeMode.C.withVal
         ---> Utf8.C.fromPtr true
      )
        utf8Normalize_
        (
          str
           & len
           & mode
        )
    fun utf8OffsetToPointer str offset = (Utf8.C.withPtr &&&> FFI.Long.C.withVal ---> Utf8.C.fromPtr true) utf8OffsetToPointer_ (str & offset)
    fun utf8PointerToOffset str pos = (Utf8.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Long.C.fromVal) utf8PointerToOffset_ (str & pos)
    fun utf8PrevChar p = (Utf8.C.withPtr ---> Utf8.C.fromPtr true) utf8PrevChar_ p
    fun utf8Strchr p len c =
      (
        Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> FFI.Char.C.withVal
         ---> Utf8.C.fromPtr true
      )
        utf8Strchr_
        (
          p
           & len
           & c
        )
    fun utf8Strdown str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) utf8Strdown_ (str & len)
    fun utf8Strlen p max = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> FFI.Long.C.fromVal) utf8Strlen_ (p & max)
    fun utf8Strncpy dest src n =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Size.C.withVal
         ---> Utf8.C.fromPtr true
      )
        utf8Strncpy_
        (
          dest
           & src
           & n
        )
    fun utf8Strrchr p len c =
      (
        Utf8.C.withPtr
         &&&> FFI.SSize.C.withVal
         &&&> FFI.Char.C.withVal
         ---> Utf8.C.fromPtr true
      )
        utf8Strrchr_
        (
          p
           & len
           & c
        )
    fun utf8Strreverse str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) utf8Strreverse_ (str & len)
    fun utf8Strup str len = (Utf8.C.withPtr &&&> FFI.SSize.C.withVal ---> Utf8.C.fromPtr true) utf8Strup_ (str & len)
    fun utf8Substring str startPos endPos =
      (
        Utf8.C.withPtr
         &&&> FFI.Long.C.withVal
         &&&> FFI.Long.C.withVal
         ---> Utf8.C.fromPtr true
      )
        utf8Substring_
        (
          str
           & startPos
           & endPos
        )
    fun utf8Validate str maxLen =
      let
        val end' & retVal =
          (
            Utf8.C.withPtr
             &&&> FFI.SSize.C.withVal
             &&&> Utf8.C.withRefOptPtr
             ---> Utf8.C.fromPtr true && FFI.Bool.C.fromVal
          )
            utf8Validate_
            (
              str
               & maxLen
               & NONE
            )
      in
        if retVal then SOME end' else NONE
      end
    fun variantGetType value = (GLibVariantRecord.C.withPtr ---> GLibVariantTypeRecord.C.fromPtr false) variantGetType_ value
    fun variantIsObjectPath string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) variantIsObjectPath_ string
    fun variantIsSignature string = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) variantIsSignature_ string
    fun variantParse type' text limit endptr =
      (
        GLibVariantTypeRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibVariantRecord.C.fromPtr true
      )
        variantParse_
        (
          type'
           & text
           & limit
           & endptr
           & []
        )
    fun variantParserGetErrorQuark () = (I ---> GLibQuark.C.fromVal) variantParserGetErrorQuark_ ()
    fun variantTypeStringIsValid typeString = (Utf8.C.withPtr ---> FFI.Bool.C.fromVal) variantTypeStringIsValid_ typeString
    fun variantTypeStringScan string limit =
      let
        val endptr & retVal =
          (
            Utf8.C.withPtr
             &&&> Utf8.C.withOptPtr
             &&&> Utf8.C.withRefOptPtr
             ---> Utf8.C.fromPtr true && FFI.Bool.C.fromVal
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
    fun warnMessage domain file line func warnexpr =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
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
