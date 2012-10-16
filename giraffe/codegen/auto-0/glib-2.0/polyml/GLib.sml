structure GLib : G_LIB =
  struct
    local
      open PolyMLFFI
    in
      val access_ = call (load_sym libglib "g_access") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val asciiDigitValue_ = call (load_sym libglib "g_ascii_digit_value") (FFI.PolyML.Word8.VAL --> FFI.PolyML.Int32.VAL)
      val asciiDtostr_ =
        call (load_sym libglib "g_ascii_dtostr")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Double.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val asciiFormatd_ =
        call (load_sym libglib "g_ascii_formatd")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Double.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val asciiStrcasecmp_ = call (load_sym libglib "g_ascii_strcasecmp") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val asciiStrdown_ = call (load_sym libglib "g_ascii_strdown") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val asciiStrncasecmp_ =
        call (load_sym libglib "g_ascii_strncasecmp")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.Int32.VAL
          )
      val asciiStrtod_ = call (load_sym libglib "g_ascii_strtod") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Double.VAL)
      val asciiStrtoll_ =
        call (load_sym libglib "g_ascii_strtoll")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.Int64.VAL
          )
      val asciiStrtoull_ =
        call (load_sym libglib "g_ascii_strtoull")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.Word64.VAL
          )
      val asciiStrup_ = call (load_sym libglib "g_ascii_strup") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val asciiTolower_ = call (load_sym libglib "g_ascii_tolower") (FFI.PolyML.Word8.VAL --> FFI.PolyML.Word8.VAL)
      val asciiToupper_ = call (load_sym libglib "g_ascii_toupper") (FFI.PolyML.Word8.VAL --> FFI.PolyML.Word8.VAL)
      val asciiXdigitValue_ = call (load_sym libglib "g_ascii_xdigit_value") (FFI.PolyML.Word8.VAL --> FFI.PolyML.Int32.VAL)
      val assertWarning_ =
        call (load_sym libglib "g_assert_warning")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val assertionMessage_ =
        call (load_sym libglib "g_assertion_message")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val assertionMessageCmpstr_ =
        call (load_sym libglib "g_assertion_message_cmpstr")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val assertionMessageExpr_ =
        call (load_sym libglib "g_assertion_message_expr")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val atomicPointerAdd_ = call (load_sym libglib "g_atomic_pointer_add") (FFI.PolyML.Int64.VAL --> FFI.PolyML.Int64.VAL)
      val atomicPointerAnd_ = call (load_sym libglib "g_atomic_pointer_and") (FFI.PolyML.Word64.VAL --> FFI.PolyML.Word64.VAL)
      val atomicPointerCompareAndExchange_ = call (load_sym libglib "g_atomic_pointer_compare_and_exchange") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val atomicPointerOr_ = call (load_sym libglib "g_atomic_pointer_or") (FFI.PolyML.Word64.VAL --> FFI.PolyML.Word64.VAL)
      val atomicPointerSet_ = call (load_sym libglib "g_atomic_pointer_set") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val atomicPointerXor_ = call (load_sym libglib "g_atomic_pointer_xor") (FFI.PolyML.Word64.VAL --> FFI.PolyML.Word64.VAL)
      val basename_ = call (load_sym libglib "g_basename") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val bitNthLsf_ = call (load_sym libglib "g_bit_nth_lsf") (FFI.PolyML.Word64.VAL &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val bitNthMsf_ = call (load_sym libglib "g_bit_nth_msf") (FFI.PolyML.Word64.VAL &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val bitStorage_ = call (load_sym libglib "g_bit_storage") (FFI.PolyML.Word64.VAL --> FFI.PolyML.Word32.VAL)
      val blowChunks_ = call (load_sym libglib "g_blow_chunks") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val bookmarkFileErrorQuark_ = call (load_sym libglib "g_bookmark_file_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val chdir_ = call (load_sym libglib "g_chdir") (FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val checkVersion_ =
        call (load_sym libglib "glib_check_version")
          (
            FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val checksumTypeGetLength_ = call (load_sym libglib "g_checksum_type_get_length") (GLibChecksumType.PolyML.VAL --> FFI.PolyML.Int64.VAL)
      val childWatchSourceNew_ = call (load_sym libglib "g_child_watch_source_new") (FFI.PolyML.Int32.VAL --> GLibSourceRecord.PolyML.PTR)
      val clearError_ = call (load_sym libglib "g_clear_error") (GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.VOID)
      val computeChecksumForString_ =
        call (load_sym libglib "g_compute_checksum_for_string")
          (
            GLibChecksumType.PolyML.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val convert_ =
        call (load_sym libglib "g_convert")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.REF
             &&> FFI.PolyML.Word64.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val convertErrorQuark_ = call (load_sym libglib "g_convert_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val datalistClear_ = call (load_sym libglib "g_datalist_clear") (GLibDataRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val datalistGetFlags_ = call (load_sym libglib "g_datalist_get_flags") (GLibDataRecord.PolyML.PTR --> FFI.PolyML.Word32.VAL)
      val datalistInit_ = call (load_sym libglib "g_datalist_init") (GLibDataRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val datalistSetFlags_ = call (load_sym libglib "g_datalist_set_flags") (GLibDataRecord.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val datalistUnsetFlags_ = call (load_sym libglib "g_datalist_unset_flags") (GLibDataRecord.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val datasetDestroy_ = call (load_sym libglib "g_dataset_destroy") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val dateGetDaysInMonth_ = call (load_sym libglib "g_date_get_days_in_month") (GLibDateMonth.PolyML.VAL &&> FFI.PolyML.Word16.VAL --> FFI.PolyML.Word8.VAL)
      val dateGetMondayWeeksInYear_ = call (load_sym libglib "g_date_get_monday_weeks_in_year") (FFI.PolyML.Word16.VAL --> FFI.PolyML.Word8.VAL)
      val dateGetSundayWeeksInYear_ = call (load_sym libglib "g_date_get_sunday_weeks_in_year") (FFI.PolyML.Word16.VAL --> FFI.PolyML.Word8.VAL)
      val dateIsLeapYear_ = call (load_sym libglib "g_date_is_leap_year") (FFI.PolyML.Word16.VAL --> FFI.PolyML.Bool.VAL)
      val dateStrftime_ =
        call (load_sym libglib "g_date_strftime")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             &&> FFI.PolyML.String.INPTR
             &&> GLibDateRecord.PolyML.PTR
             --> FFI.PolyML.Word64.VAL
          )
      val dateTimeCompare_ = call (load_sym libglib "g_date_time_compare") (FFI.PolyML.VOID --> FFI.PolyML.Int32.VAL)
      val dateTimeEqual_ = call (load_sym libglib "g_date_time_equal") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val dateTimeHash_ = call (load_sym libglib "g_date_time_hash") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val dateValidDay_ = call (load_sym libglib "g_date_valid_day") (FFI.PolyML.Word8.VAL --> FFI.PolyML.Bool.VAL)
      val dateValidDmy_ =
        call (load_sym libglib "g_date_valid_dmy")
          (
            FFI.PolyML.Word8.VAL
             &&> GLibDateMonth.PolyML.VAL
             &&> FFI.PolyML.Word16.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val dateValidJulian_ = call (load_sym libglib "g_date_valid_julian") (FFI.PolyML.Word32.VAL --> FFI.PolyML.Bool.VAL)
      val dateValidMonth_ = call (load_sym libglib "g_date_valid_month") (GLibDateMonth.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val dateValidWeekday_ = call (load_sym libglib "g_date_valid_weekday") (GLibDateWeekday.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val dateValidYear_ = call (load_sym libglib "g_date_valid_year") (FFI.PolyML.Word16.VAL --> FFI.PolyML.Bool.VAL)
      val dcgettext_ =
        call (load_sym libglib "g_dcgettext")
          (
            FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val dgettext_ = call (load_sym libglib "g_dgettext") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val dirMakeTmp_ = call (load_sym libglib "g_dir_make_tmp") (FFI.PolyML.String.INOPTPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.String.RETPTR)
      val directEqual_ = call (load_sym libglib "g_direct_equal") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val directHash_ = call (load_sym libglib "g_direct_hash") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val dngettext_ =
        call (load_sym libglib "g_dngettext")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val doubleEqual_ = call (load_sym libglib "g_double_equal") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val doubleHash_ = call (load_sym libglib "g_double_hash") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val dpgettext_ =
        call (load_sym libglib "g_dpgettext")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val dpgettext2_ =
        call (load_sym libglib "g_dpgettext2")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.String.RETPTR
          )
      val dummyDecl_ = call (load_sym libglib "glib_dummy_decl") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val fileErrorFromErrno_ = call (load_sym libglib "g_file_error_from_errno") (FFI.PolyML.Int32.VAL --> GLibFileError.PolyML.VAL)
      val fileErrorQuark_ = call (load_sym libglib "g_file_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val fileOpenTmp_ =
        call (load_sym libglib "g_file_open_tmp")
          (
            FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.OUTREF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int32.VAL
          )
      val fileReadLink_ = call (load_sym libglib "g_file_read_link") (FFI.PolyML.String.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.String.RETPTR)
      val fileTest_ = call (load_sym libglib "g_file_test") (FFI.PolyML.String.INPTR &&> GLibFileTest.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val filenameDisplayBasename_ = call (load_sym libglib "g_filename_display_basename") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val filenameDisplayName_ = call (load_sym libglib "g_filename_display_name") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val filenameFromUri_ =
        call (load_sym libglib "g_filename_from_uri")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val filenameToUri_ =
        call (load_sym libglib "g_filename_to_uri")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val findProgramInPath_ = call (load_sym libglib "g_find_program_in_path") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val formatSize_ = call (load_sym libglib "g_format_size") (FFI.PolyML.Word64.VAL --> FFI.PolyML.String.RETPTR)
      val formatSizeForDisplay_ = call (load_sym libglib "g_format_size_for_display") (FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val formatSizeFull_ = call (load_sym libglib "g_format_size_full") (FFI.PolyML.Word64.VAL &&> GLibFormatSizeFlags.PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val getApplicationName_ = call (load_sym libglib "g_get_application_name") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getCharset_ = call (load_sym libglib "g_get_charset") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val getCurrentDir_ = call (load_sym libglib "g_get_current_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getCurrentTime_ = call (load_sym libglib "g_get_current_time") (GLibTimeValRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getFilenameCharsets_ = call (load_sym libglib "g_get_filename_charsets") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val getHomeDir_ = call (load_sym libglib "g_get_home_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getHostName_ = call (load_sym libglib "g_get_host_name") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getMonotonicTime_ = call (load_sym libglib "g_get_monotonic_time") (FFI.PolyML.VOID --> FFI.PolyML.Int64.VAL)
      val getPrgname_ = call (load_sym libglib "g_get_prgname") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getRealName_ = call (load_sym libglib "g_get_real_name") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getRealTime_ = call (load_sym libglib "g_get_real_time") (FFI.PolyML.VOID --> FFI.PolyML.Int64.VAL)
      val getTmpDir_ = call (load_sym libglib "g_get_tmp_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getUserCacheDir_ = call (load_sym libglib "g_get_user_cache_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getUserConfigDir_ = call (load_sym libglib "g_get_user_config_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getUserDataDir_ = call (load_sym libglib "g_get_user_data_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getUserName_ = call (load_sym libglib "g_get_user_name") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getUserRuntimeDir_ = call (load_sym libglib "g_get_user_runtime_dir") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getUserSpecialDir_ = call (load_sym libglib "g_get_user_special_dir") (GLibUserDirectory.PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val getenv_ = call (load_sym libglib "g_getenv") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val hookDestroy_ = call (load_sym libglib "g_hook_destroy") (GLibHookListRecord.PolyML.PTR &&> FFI.PolyML.Word64.VAL --> FFI.PolyML.Bool.VAL)
      val hookDestroyLink_ = call (load_sym libglib "g_hook_destroy_link") (GLibHookListRecord.PolyML.PTR &&> GLibHookRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val hookFree_ = call (load_sym libglib "g_hook_free") (GLibHookListRecord.PolyML.PTR &&> GLibHookRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val hookInsertBefore_ =
        call (load_sym libglib "g_hook_insert_before")
          (
            GLibHookListRecord.PolyML.PTR
             &&> GLibHookRecord.PolyML.PTR
             &&> GLibHookRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val hookPrepend_ = call (load_sym libglib "g_hook_prepend") (GLibHookListRecord.PolyML.PTR &&> GLibHookRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val hookUnref_ = call (load_sym libglib "g_hook_unref") (GLibHookListRecord.PolyML.PTR &&> GLibHookRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val hostnameIsAsciiEncoded_ = call (load_sym libglib "g_hostname_is_ascii_encoded") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val hostnameIsIpAddress_ = call (load_sym libglib "g_hostname_is_ip_address") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val hostnameIsNonAscii_ = call (load_sym libglib "g_hostname_is_non_ascii") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val hostnameToAscii_ = call (load_sym libglib "g_hostname_to_ascii") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val hostnameToUnicode_ = call (load_sym libglib "g_hostname_to_unicode") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val idleRemoveByData_ = call (load_sym libglib "g_idle_remove_by_data") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val idleSourceNew_ = call (load_sym libglib "g_idle_source_new") (FFI.PolyML.VOID --> GLibSourceRecord.PolyML.PTR)
      val int64Equal_ = call (load_sym libglib "g_int64_equal") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val int64Hash_ = call (load_sym libglib "g_int64_hash") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val intEqual_ = call (load_sym libglib "g_int_equal") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val intHash_ = call (load_sym libglib "g_int_hash") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val internStaticString_ = call (load_sym libglib "g_intern_static_string") (FFI.PolyML.String.INOPTPTR --> FFI.PolyML.String.RETPTR)
      val internString_ = call (load_sym libglib "g_intern_string") (FFI.PolyML.String.INOPTPTR --> FFI.PolyML.String.RETPTR)
      val ioChannelErrorFromErrno_ = call (load_sym libglib "g_io_channel_error_from_errno") (FFI.PolyML.Int32.VAL --> GLibIOChannelError.PolyML.VAL)
      val ioChannelErrorQuark_ = call (load_sym libglib "g_io_channel_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val ioCreateWatch_ = call (load_sym libglib "g_io_create_watch") (GLibIOChannelRecord.PolyML.PTR &&> GLibIOCondition.PolyML.VAL --> GLibSourceRecord.PolyML.PTR)
      val keyFileErrorQuark_ = call (load_sym libglib "g_key_file_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val listPopAllocator_ = call (load_sym libglib "g_list_pop_allocator") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val listPushAllocator_ = call (load_sym libglib "g_list_push_allocator") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val logDefaultHandler_ =
        call (load_sym libglib "g_log_default_handler")
          (
            FFI.PolyML.String.INPTR
             &&> GLibLogLevelFlags.PolyML.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val logRemoveHandler_ = call (load_sym libglib "g_log_remove_handler") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val logSetAlwaysFatal_ = call (load_sym libglib "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.VAL --> GLibLogLevelFlags.PolyML.VAL)
      val logSetFatalMask_ = call (load_sym libglib "g_log_set_fatal_mask") (FFI.PolyML.String.INPTR &&> GLibLogLevelFlags.PolyML.VAL --> GLibLogLevelFlags.PolyML.VAL)
      val mainContextDefault_ = call (load_sym libglib "g_main_context_default") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
      val mainContextGetThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
      val mainCurrentSource_ = call (load_sym libglib "g_main_current_source") (FFI.PolyML.VOID --> GLibSourceRecord.PolyML.PTR)
      val mainDepth_ = call (load_sym libglib "g_main_depth") (FFI.PolyML.VOID --> FFI.PolyML.Int32.VAL)
      val markupErrorQuark_ = call (load_sym libglib "g_markup_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val markupEscapeText_ = call (load_sym libglib "g_markup_escape_text") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val memChunkInfo_ = call (load_sym libglib "g_mem_chunk_info") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val memIsSystemMalloc_ = call (load_sym libglib "g_mem_is_system_malloc") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val memProfile_ = call (load_sym libglib "g_mem_profile") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val memSetVtable_ = call (load_sym libglib "g_mem_set_vtable") (GLibMemVTableRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val mkdirWithParents_ = call (load_sym libglib "g_mkdir_with_parents") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val mkdtemp_ = call (load_sym libglib "g_mkdtemp") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val mkdtempFull_ = call (load_sym libglib "g_mkdtemp_full") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val mkstemp_ = call (load_sym libglib "g_mkstemp") (FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val mkstempFull_ =
        call (load_sym libglib "g_mkstemp_full")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Int32.VAL
          )
      val nodePopAllocator_ = call (load_sym libglib "g_node_pop_allocator") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val nodePushAllocator_ = call (load_sym libglib "g_node_push_allocator") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val nullifyPointer_ = call (load_sym libglib "g_nullify_pointer") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val onErrorQuery_ = call (load_sym libglib "g_on_error_query") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val onErrorStackTrace_ = call (load_sym libglib "g_on_error_stack_trace") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val optionErrorQuark_ = call (load_sym libglib "g_option_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val pathGetBasename_ = call (load_sym libglib "g_path_get_basename") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val pathGetDirname_ = call (load_sym libglib "g_path_get_dirname") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val pathIsAbsolute_ = call (load_sym libglib "g_path_is_absolute") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val pathSkipRoot_ = call (load_sym libglib "g_path_skip_root") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val patternMatch_ =
        call (load_sym libglib "g_pattern_match")
          (
            GLibPatternSpecRecord.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.Bool.VAL
          )
      val patternMatchSimple_ = call (load_sym libglib "g_pattern_match_simple") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val patternMatchString_ = call (load_sym libglib "g_pattern_match_string") (GLibPatternSpecRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val pointerBitLock_ = call (load_sym libglib "g_pointer_bit_lock") (FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val pointerBitTrylock_ = call (load_sym libglib "g_pointer_bit_trylock") (FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val pointerBitUnlock_ = call (load_sym libglib "g_pointer_bit_unlock") (FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val poll_ =
        call (load_sym libglib "g_poll")
          (
            GLibPollFDRecord.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Int32.VAL
          )
      val quarkFromStaticString_ = call (load_sym libglib "g_quark_from_static_string") (FFI.PolyML.String.INOPTPTR --> FFI.PolyML.Word32.VAL)
      val quarkFromString_ = call (load_sym libglib "g_quark_from_string") (FFI.PolyML.String.INOPTPTR --> FFI.PolyML.Word32.VAL)
      val quarkToString_ = call (load_sym libglib "g_quark_to_string") (FFI.PolyML.Word32.VAL --> FFI.PolyML.String.RETPTR)
      val quarkTryString_ = call (load_sym libglib "g_quark_try_string") (FFI.PolyML.String.INOPTPTR --> FFI.PolyML.Word32.VAL)
      val randomDouble_ = call (load_sym libglib "g_random_double") (FFI.PolyML.VOID --> FFI.PolyML.Double.VAL)
      val randomDoubleRange_ = call (load_sym libglib "g_random_double_range") (FFI.PolyML.Double.VAL &&> FFI.PolyML.Double.VAL --> FFI.PolyML.Double.VAL)
      val randomInt_ = call (load_sym libglib "g_random_int") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val randomIntRange_ = call (load_sym libglib "g_random_int_range") (FFI.PolyML.Int32.VAL &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val randomSetSeed_ = call (load_sym libglib "g_random_set_seed") (FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val regexCheckReplacement_ =
        call (load_sym libglib "g_regex_check_replacement")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Bool.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val regexErrorQuark_ = call (load_sym libglib "g_regex_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val regexEscapeNul_ = call (load_sym libglib "g_regex_escape_nul") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val regexMatchSimple_ =
        call (load_sym libglib "g_regex_match_simple")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibRegexCompileFlags.PolyML.VAL
             &&> GLibRegexMatchFlags.PolyML.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val reloadUserSpecialDirsCache_ = call (load_sym libglib "g_reload_user_special_dirs_cache") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val returnIfFailWarning_ =
        call (load_sym libglib "g_return_if_fail_warning")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val rmdir_ = call (load_sym libglib "g_rmdir") (FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val sequenceMove_ = call (load_sym libglib "g_sequence_move") (GLibSequenceIterRecord.PolyML.PTR &&> GLibSequenceIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val sequenceMoveRange_ =
        call (load_sym libglib "g_sequence_move_range")
          (
            GLibSequenceIterRecord.PolyML.PTR
             &&> GLibSequenceIterRecord.PolyML.PTR
             &&> GLibSequenceIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val sequenceRemove_ = call (load_sym libglib "g_sequence_remove") (GLibSequenceIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val sequenceRemoveRange_ = call (load_sym libglib "g_sequence_remove_range") (GLibSequenceIterRecord.PolyML.PTR &&> GLibSequenceIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val sequenceSet_ = call (load_sym libglib "g_sequence_set") (GLibSequenceIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val sequenceSwap_ = call (load_sym libglib "g_sequence_swap") (GLibSequenceIterRecord.PolyML.PTR &&> GLibSequenceIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setApplicationName_ = call (load_sym libglib "g_set_application_name") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setPrgname_ = call (load_sym libglib "g_set_prgname") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setenv_ =
        call (load_sym libglib "g_setenv")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Bool.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val shellErrorQuark_ = call (load_sym libglib "g_shell_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val shellQuote_ = call (load_sym libglib "g_shell_quote") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val shellUnquote_ = call (load_sym libglib "g_shell_unquote") (FFI.PolyML.String.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.String.RETPTR)
      val sliceFree1_ = call (load_sym libglib "g_slice_free1") (FFI.PolyML.Word64.VAL --> FFI.PolyML.VOID)
      val sliceFreeChainWithOffset_ = call (load_sym libglib "g_slice_free_chain_with_offset") (FFI.PolyML.Word64.VAL &&> FFI.PolyML.Word64.VAL --> FFI.PolyML.VOID)
      val sliceGetConfig_ = call (load_sym libglib "g_slice_get_config") (GLibSliceConfig.PolyML.VAL --> FFI.PolyML.Int64.VAL)
      val sliceSetConfig_ = call (load_sym libglib "g_slice_set_config") (GLibSliceConfig.PolyML.VAL &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.VOID)
      val sourceRemove_ = call (load_sym libglib "g_source_remove") (FFI.PolyML.Word32.VAL --> FFI.PolyML.Bool.VAL)
      val sourceSetNameById_ = call (load_sym libglib "g_source_set_name_by_id") (FFI.PolyML.Word32.VAL &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val spacedPrimesClosest_ = call (load_sym libglib "g_spaced_primes_closest") (FFI.PolyML.Word32.VAL --> FFI.PolyML.Word32.VAL)
      val spawnClosePid_ = call (load_sym libglib "g_spawn_close_pid") (FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val spawnCommandLineAsync_ = call (load_sym libglib "g_spawn_command_line_async") (FFI.PolyML.String.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Bool.VAL)
      val spawnErrorQuark_ = call (load_sym libglib "g_spawn_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val stpcpy_ = call (load_sym libglib "g_stpcpy") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strEqual_ = call (load_sym libglib "g_str_equal") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val strHasPrefix_ = call (load_sym libglib "g_str_has_prefix") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val strHasSuffix_ = call (load_sym libglib "g_str_has_suffix") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val strHash_ = call (load_sym libglib "g_str_hash") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val strcanon_ =
        call (load_sym libglib "g_strcanon")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word8.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val strcasecmp_ = call (load_sym libglib "g_strcasecmp") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val strchomp_ = call (load_sym libglib "g_strchomp") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strchug_ = call (load_sym libglib "g_strchug") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strcmp0_ = call (load_sym libglib "g_strcmp0") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val strcompress_ = call (load_sym libglib "g_strcompress") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strdelimit_ =
        call (load_sym libglib "g_strdelimit")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word8.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val strdown_ = call (load_sym libglib "g_strdown") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strdup_ = call (load_sym libglib "g_strdup") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strerror_ = call (load_sym libglib "g_strerror") (FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val strescape_ = call (load_sym libglib "g_strescape") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strfreev_ = call (load_sym libglib "g_strfreev") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val stringNew_ = call (load_sym libglib "g_string_new") (FFI.PolyML.String.INPTR --> GLibStringRecord.PolyML.PTR)
      val stringNewLen_ = call (load_sym libglib "g_string_new_len") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> GLibStringRecord.PolyML.PTR)
      val stringSizedNew_ = call (load_sym libglib "g_string_sized_new") (FFI.PolyML.Word64.VAL --> GLibStringRecord.PolyML.PTR)
      val stripContext_ = call (load_sym libglib "g_strip_context") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strjoinv_ = call (load_sym libglib "g_strjoinv") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strlcat_ =
        call (load_sym libglib "g_strlcat")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.Word64.VAL
          )
      val strlcpy_ =
        call (load_sym libglib "g_strlcpy")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.Word64.VAL
          )
      val strncasecmp_ =
        call (load_sym libglib "g_strncasecmp")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.Int32.VAL
          )
      val strndup_ = call (load_sym libglib "g_strndup") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Word64.VAL --> FFI.PolyML.String.RETPTR)
      val strnfill_ = call (load_sym libglib "g_strnfill") (FFI.PolyML.Word64.VAL &&> FFI.PolyML.Word8.VAL --> FFI.PolyML.String.RETPTR)
      val strreverse_ = call (load_sym libglib "g_strreverse") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strrstr_ = call (load_sym libglib "g_strrstr") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strrstrLen_ =
        call (load_sym libglib "g_strrstr_len")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.String.RETPTR
          )
      val strsignal_ = call (load_sym libglib "g_strsignal") (FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val strstrLen_ =
        call (load_sym libglib "g_strstr_len")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.String.RETPTR
          )
      val strtod_ = call (load_sym libglib "g_strtod") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Double.VAL)
      val strup_ = call (load_sym libglib "g_strup") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val strvLength_ = call (load_sym libglib "g_strv_length") (FFI.PolyML.String.INPTR --> FFI.PolyML.Word32.VAL)
      val testBug_ = call (load_sym libglib "g_test_bug") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val testBugBase_ = call (load_sym libglib "g_test_bug_base") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val testFail_ = call (load_sym libglib "g_test_fail") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val testLogTypeName_ = call (load_sym libglib "g_test_log_type_name") (GLibTestLogType.PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val testQueueFree_ = call (load_sym libglib "g_test_queue_free") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val testRandDouble_ = call (load_sym libglib "g_test_rand_double") (FFI.PolyML.VOID --> FFI.PolyML.Double.VAL)
      val testRandDoubleRange_ = call (load_sym libglib "g_test_rand_double_range") (FFI.PolyML.Double.VAL &&> FFI.PolyML.Double.VAL --> FFI.PolyML.Double.VAL)
      val testRandInt_ = call (load_sym libglib "g_test_rand_int") (FFI.PolyML.VOID --> FFI.PolyML.Int32.VAL)
      val testRandIntRange_ = call (load_sym libglib "g_test_rand_int_range") (FFI.PolyML.Int32.VAL &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val testRun_ = call (load_sym libglib "g_test_run") (FFI.PolyML.VOID --> FFI.PolyML.Int32.VAL)
      val testRunSuite_ = call (load_sym libglib "g_test_run_suite") (GLibTestSuiteRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val testTimerElapsed_ = call (load_sym libglib "g_test_timer_elapsed") (FFI.PolyML.VOID --> FFI.PolyML.Double.VAL)
      val testTimerLast_ = call (load_sym libglib "g_test_timer_last") (FFI.PolyML.VOID --> FFI.PolyML.Double.VAL)
      val testTimerStart_ = call (load_sym libglib "g_test_timer_start") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val testTrapAssertions_ =
        call (load_sym libglib "g_test_trap_assertions")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val testTrapFork_ = call (load_sym libglib "g_test_trap_fork") (FFI.PolyML.Word64.VAL &&> GLibTestTrapFlags.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val testTrapHasPassed_ = call (load_sym libglib "g_test_trap_has_passed") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val testTrapReachedTimeout_ = call (load_sym libglib "g_test_trap_reached_timeout") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val threadErrorQuark_ = call (load_sym libglib "g_thread_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val threadExit_ = call (load_sym libglib "g_thread_exit") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val threadGetInitialized_ = call (load_sym libglib "g_thread_get_initialized") (FFI.PolyML.VOID --> FFI.PolyML.Bool.VAL)
      val threadInit_ = call (load_sym libglib "g_thread_init") (GLibThreadFunctionsRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val threadInitWithErrorcheckMutexes_ = call (load_sym libglib "g_thread_init_with_errorcheck_mutexes") (GLibThreadFunctionsRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val threadPoolGetMaxIdleTime_ = call (load_sym libglib "g_thread_pool_get_max_idle_time") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val threadPoolGetMaxUnusedThreads_ = call (load_sym libglib "g_thread_pool_get_max_unused_threads") (FFI.PolyML.VOID --> FFI.PolyML.Int32.VAL)
      val threadPoolGetNumUnusedThreads_ = call (load_sym libglib "g_thread_pool_get_num_unused_threads") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val threadPoolSetMaxIdleTime_ = call (load_sym libglib "g_thread_pool_set_max_idle_time") (FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val threadPoolSetMaxUnusedThreads_ = call (load_sym libglib "g_thread_pool_set_max_unused_threads") (FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val threadPoolStopUnusedThreads_ = call (load_sym libglib "g_thread_pool_stop_unused_threads") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val timeValFromIso8601_ = call (load_sym libglib "g_time_val_from_iso8601") (FFI.PolyML.String.INPTR &&> GLibTimeValRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val timeoutSourceNew_ = call (load_sym libglib "g_timeout_source_new") (FFI.PolyML.Word32.VAL --> GLibSourceRecord.PolyML.PTR)
      val timeoutSourceNewSeconds_ = call (load_sym libglib "g_timeout_source_new_seconds") (FFI.PolyML.Word32.VAL --> GLibSourceRecord.PolyML.PTR)
      val trashStackHeight_ = call (load_sym libglib "g_trash_stack_height") (GLibTrashStackRecord.PolyML.PTR --> FFI.PolyML.Word32.VAL)
      val trashStackPush_ = call (load_sym libglib "g_trash_stack_push") (GLibTrashStackRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val unicharBreakType_ = call (load_sym libglib "g_unichar_break_type") (FFI.PolyML.Char.VAL --> GLibUnicodeBreakType.PolyML.VAL)
      val unicharCombiningClass_ = call (load_sym libglib "g_unichar_combining_class") (FFI.PolyML.Char.VAL --> FFI.PolyML.Int32.VAL)
      val unicharDigitValue_ = call (load_sym libglib "g_unichar_digit_value") (FFI.PolyML.Char.VAL --> FFI.PolyML.Int32.VAL)
      val unicharGetScript_ = call (load_sym libglib "g_unichar_get_script") (FFI.PolyML.Char.VAL --> GLibUnicodeScript.PolyML.VAL)
      val unicharIsalnum_ = call (load_sym libglib "g_unichar_isalnum") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsalpha_ = call (load_sym libglib "g_unichar_isalpha") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIscntrl_ = call (load_sym libglib "g_unichar_iscntrl") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsdefined_ = call (load_sym libglib "g_unichar_isdefined") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsdigit_ = call (load_sym libglib "g_unichar_isdigit") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsgraph_ = call (load_sym libglib "g_unichar_isgraph") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIslower_ = call (load_sym libglib "g_unichar_islower") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsmark_ = call (load_sym libglib "g_unichar_ismark") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsprint_ = call (load_sym libglib "g_unichar_isprint") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIspunct_ = call (load_sym libglib "g_unichar_ispunct") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsspace_ = call (load_sym libglib "g_unichar_isspace") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIstitle_ = call (load_sym libglib "g_unichar_istitle") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsupper_ = call (load_sym libglib "g_unichar_isupper") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIswide_ = call (load_sym libglib "g_unichar_iswide") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIswideCjk_ = call (load_sym libglib "g_unichar_iswide_cjk") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIsxdigit_ = call (load_sym libglib "g_unichar_isxdigit") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharIszerowidth_ = call (load_sym libglib "g_unichar_iszerowidth") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharToUtf8_ = call (load_sym libglib "g_unichar_to_utf8") (FFI.PolyML.Char.VAL &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val unicharTolower_ = call (load_sym libglib "g_unichar_tolower") (FFI.PolyML.Char.VAL --> FFI.PolyML.Char.VAL)
      val unicharTotitle_ = call (load_sym libglib "g_unichar_totitle") (FFI.PolyML.Char.VAL --> FFI.PolyML.Char.VAL)
      val unicharToupper_ = call (load_sym libglib "g_unichar_toupper") (FFI.PolyML.Char.VAL --> FFI.PolyML.Char.VAL)
      val unicharType_ = call (load_sym libglib "g_unichar_type") (FFI.PolyML.Char.VAL --> GLibUnicodeType.PolyML.VAL)
      val unicharValidate_ = call (load_sym libglib "g_unichar_validate") (FFI.PolyML.Char.VAL --> FFI.PolyML.Bool.VAL)
      val unicharXdigitValue_ = call (load_sym libglib "g_unichar_xdigit_value") (FFI.PolyML.Char.VAL --> FFI.PolyML.Int32.VAL)
      val unicodeScriptFromIso15924_ = call (load_sym libglib "g_unicode_script_from_iso15924") (FFI.PolyML.Word32.VAL --> GLibUnicodeScript.PolyML.VAL)
      val unicodeScriptToIso15924_ = call (load_sym libglib "g_unicode_script_to_iso15924") (GLibUnicodeScript.PolyML.VAL --> FFI.PolyML.Word32.VAL)
      val unlink_ = call (load_sym libglib "g_unlink") (FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val unsetenv_ = call (load_sym libglib "g_unsetenv") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val uriEscapeString_ =
        call (load_sym libglib "g_uri_escape_string")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Bool.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val uriParseScheme_ = call (load_sym libglib "g_uri_parse_scheme") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val uriUnescapeSegment_ =
        call (load_sym libglib "g_uri_unescape_segment")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.String.RETPTR
          )
      val uriUnescapeString_ = call (load_sym libglib "g_uri_unescape_string") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val usleep_ = call (load_sym libglib "g_usleep") (FFI.PolyML.Word64.VAL --> FFI.PolyML.VOID)
      val utf8Casefold_ = call (load_sym libglib "g_utf8_casefold") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8Collate_ = call (load_sym libglib "g_utf8_collate") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int32.VAL)
      val utf8CollateKey_ = call (load_sym libglib "g_utf8_collate_key") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8CollateKeyForFilename_ = call (load_sym libglib "g_utf8_collate_key_for_filename") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8FindNextChar_ = call (load_sym libglib "g_utf8_find_next_char") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val utf8FindPrevChar_ = call (load_sym libglib "g_utf8_find_prev_char") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val utf8GetChar_ = call (load_sym libglib "g_utf8_get_char") (FFI.PolyML.String.INPTR --> FFI.PolyML.Char.VAL)
      val utf8GetCharValidated_ = call (load_sym libglib "g_utf8_get_char_validated") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.Char.VAL)
      val utf8Normalize_ =
        call (load_sym libglib "g_utf8_normalize")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> GLibNormalizeMode.PolyML.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val utf8OffsetToPointer_ = call (load_sym libglib "g_utf8_offset_to_pointer") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8PointerToOffset_ = call (load_sym libglib "g_utf8_pointer_to_offset") (FFI.PolyML.String.INPTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Int64.VAL)
      val utf8PrevChar_ = call (load_sym libglib "g_utf8_prev_char") (FFI.PolyML.String.INPTR --> FFI.PolyML.String.RETPTR)
      val utf8Strchr_ =
        call (load_sym libglib "g_utf8_strchr")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.Char.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val utf8Strdown_ = call (load_sym libglib "g_utf8_strdown") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8Strlen_ = call (load_sym libglib "g_utf8_strlen") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.Int64.VAL)
      val utf8Strncpy_ =
        call (load_sym libglib "g_utf8_strncpy")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Word64.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val utf8Strrchr_ =
        call (load_sym libglib "g_utf8_strrchr")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.Char.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val utf8Strreverse_ = call (load_sym libglib "g_utf8_strreverse") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8Strup_ = call (load_sym libglib "g_utf8_strup") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Int64.VAL --> FFI.PolyML.String.RETPTR)
      val utf8Substring_ =
        call (load_sym libglib "g_utf8_substring")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.Int64.VAL
             --> FFI.PolyML.String.RETPTR
          )
      val utf8Validate_ =
        call (load_sym libglib "g_utf8_validate")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.String.OUTREF
             --> FFI.PolyML.Bool.VAL
          )
      val variantGetType_ = call (load_sym libglib "g_variant_get_type") (GLibVariantRecord.PolyML.PTR --> GLibVariantTypeRecord.PolyML.PTR)
      val variantIsObjectPath_ = call (load_sym libglib "g_variant_is_object_path") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val variantIsSignature_ = call (load_sym libglib "g_variant_is_signature") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val variantParse_ =
        call (load_sym libglib "g_variant_parse")
          (
            GLibVariantTypeRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibVariantRecord.PolyML.PTR
          )
      val variantParserGetErrorQuark_ = call (load_sym libglib "g_variant_parser_get_error_quark") (FFI.PolyML.VOID --> FFI.PolyML.Word32.VAL)
      val variantTypeChecked_ = call (load_sym libglib "g_variant_type_checked_") (FFI.PolyML.String.INPTR --> GLibVariantTypeRecord.PolyML.PTR)
      val variantTypeStringIsValid_ = call (load_sym libglib "g_variant_type_string_is_valid") (FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val variantTypeStringScan_ =
        call (load_sym libglib "g_variant_type_string_scan")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> FFI.PolyML.String.OUTREF
             --> FFI.PolyML.Bool.VAL
          )
      val warnMessage_ =
        call (load_sym libglib "g_warn_message")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
    end
    structure Quark = GLibQuark
    structure SourceFunc = GLibSourceFunc
    structure ChildWatchFunc = GLibChildWatchFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
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
    val LOG_2_BASE_10 = 0.30103
    val LOG_FATAL_MASK = 0
    val LOG_LEVEL_USER_SHIFT = 8
    val MAJOR_VERSION = 2
    val MICRO_VERSION = 90
    val MINOR_VERSION = 29
    val MODULE_SUFFIX = "so"
    val MUTEX_DEBUG_MAGIC = ~119436585
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
    fun access filename mode = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) access_ (filename & mode)
    fun asciiDigitValue c = (FFI.Word8.withVal ---> FFI.Int32.fromVal) asciiDigitValue_ c
    fun asciiDtostr buffer bufLen d =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Double.withVal
         ---> FFI.String.fromPtr true
      )
        asciiDtostr_
        (
          buffer
           & bufLen
           & d
        )
    fun asciiFormatd buffer bufLen format d =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.Double.withVal
         ---> FFI.String.fromPtr true
      )
        asciiFormatd_
        (
          buffer
           & bufLen
           & format
           & d
        )
    fun asciiStrcasecmp s1 s2 = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) asciiStrcasecmp_ (s1 & s2)
    fun asciiStrdown str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) asciiStrdown_ (str & len)
    fun asciiStrncasecmp s1 s2 n =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> FFI.Int32.fromVal
      )
        asciiStrncasecmp_
        (
          s1
           & s2
           & n
        )
    fun asciiStrtod nptr endptr = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Double.fromVal) asciiStrtod_ (nptr & endptr)
    fun asciiStrtoll nptr endptr base =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word32.withVal
         ---> FFI.Int64.fromVal
      )
        asciiStrtoll_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrtoull nptr endptr base =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word32.withVal
         ---> FFI.Word64.fromVal
      )
        asciiStrtoull_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrup str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) asciiStrup_ (str & len)
    fun asciiTolower c = (FFI.Word8.withVal ---> FFI.Word8.fromVal) asciiTolower_ c
    fun asciiToupper c = (FFI.Word8.withVal ---> FFI.Word8.fromVal) asciiToupper_ c
    fun asciiXdigitValue c = (FFI.Word8.withVal ---> FFI.Int32.fromVal) asciiXdigitValue_ c
    fun assertWarning logDomain file line prettyFunction expression =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
    fun atomicPointerAdd val' = (FFI.Int64.withVal ---> FFI.Int64.fromVal) atomicPointerAdd_ val'
    fun atomicPointerAnd val' = (FFI.Word64.withVal ---> FFI.Word64.fromVal) atomicPointerAnd_ val'
    fun atomicPointerCompareAndExchange () = (I ---> FFI.Bool.fromVal) atomicPointerCompareAndExchange_ ()
    fun atomicPointerOr val' = (FFI.Word64.withVal ---> FFI.Word64.fromVal) atomicPointerOr_ val'
    fun atomicPointerSet () = (I ---> I) atomicPointerSet_ ()
    fun atomicPointerXor val' = (FFI.Word64.withVal ---> FFI.Word64.fromVal) atomicPointerXor_ val'
    fun basename fileName = (FFI.String.withConstPtr ---> FFI.String.fromPtr false) basename_ fileName
    fun bitNthLsf mask nthBit = (FFI.Word64.withVal &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) bitNthLsf_ (mask & nthBit)
    fun bitNthMsf mask nthBit = (FFI.Word64.withVal &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) bitNthMsf_ (mask & nthBit)
    fun bitStorage number = (FFI.Word64.withVal ---> FFI.Word32.fromVal) bitStorage_ number
    fun blowChunks () = (I ---> I) blowChunks_ ()
    fun bookmarkFileErrorQuark () = (I ---> FFI.Word32.fromVal) bookmarkFileErrorQuark_ ()
    fun chdir path = (FFI.String.withConstPtr ---> FFI.Int32.fromVal) chdir_ path
    fun checkVersion requiredMajor requiredMinor requiredMicro =
      (
        FFI.Word32.withVal
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
         ---> FFI.String.fromPtr false
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun checksumTypeGetLength checksumType = (GLibChecksumType.C.withVal ---> FFI.Int64.fromVal) checksumTypeGetLength_ checksumType
    fun childWatchSourceNew pid = (FFI.Int32.withVal ---> GLibSourceRecord.C.fromPtr true) childWatchSourceNew_ pid
    fun clearError () = (GLibErrorRecord.C.handleError ---> I) clearError_ []
    fun computeChecksumForString checksumType str length =
      (
        GLibChecksumType.C.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         ---> FFI.String.fromPtr true
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
            FFI.String.withConstPtr
             &&&> FFI.Int64.withVal
             &&&> FFI.String.withConstPtr
             &&&> FFI.String.withConstPtr
             &&&> FFI.Word64.withRefVal
             &&&> FFI.Word64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal
                   && FFI.Word64.fromVal
                   && FFI.String.fromPtr true
          )
            convert_
            (
              str
               & len
               & toCodeset
               & fromCodeset
               & 0
               & 0
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun convertErrorQuark () = (I ---> FFI.Word32.fromVal) convertErrorQuark_ ()
    fun datalistClear datalist = (GLibDataRecord.C.withPtr ---> I) datalistClear_ datalist
    fun datalistGetFlags datalist = (GLibDataRecord.C.withPtr ---> FFI.Word32.fromVal) datalistGetFlags_ datalist
    fun datalistInit datalist = (GLibDataRecord.C.withPtr ---> I) datalistInit_ datalist
    fun datalistSetFlags datalist flags = (GLibDataRecord.C.withPtr &&&> FFI.Word32.withVal ---> I) datalistSetFlags_ (datalist & flags)
    fun datalistUnsetFlags datalist flags = (GLibDataRecord.C.withPtr &&&> FFI.Word32.withVal ---> I) datalistUnsetFlags_ (datalist & flags)
    fun datasetDestroy () = (I ---> I) datasetDestroy_ ()
    fun dateGetDaysInMonth month year = (GLibDateMonth.C.withVal &&&> FFI.Word16.withVal ---> FFI.Word8.fromVal) dateGetDaysInMonth_ (month & year)
    fun dateGetMondayWeeksInYear year = (FFI.Word16.withVal ---> FFI.Word8.fromVal) dateGetMondayWeeksInYear_ year
    fun dateGetSundayWeeksInYear year = (FFI.Word16.withVal ---> FFI.Word8.fromVal) dateGetSundayWeeksInYear_ year
    fun dateIsLeapYear year = (FFI.Word16.withVal ---> FFI.Bool.fromVal) dateIsLeapYear_ year
    fun dateStrftime s slen format date =
      (
        FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         &&&> FFI.String.withConstPtr
         &&&> GLibDateRecord.C.withPtr
         ---> FFI.Word64.fromVal
      )
        dateStrftime_
        (
          s
           & slen
           & format
           & date
        )
    fun dateTimeCompare () = (I ---> FFI.Int32.fromVal) dateTimeCompare_ ()
    fun dateTimeEqual () = (I ---> FFI.Bool.fromVal) dateTimeEqual_ ()
    fun dateTimeHash () = (I ---> FFI.Word32.fromVal) dateTimeHash_ ()
    fun dateValidDay day = (FFI.Word8.withVal ---> FFI.Bool.fromVal) dateValidDay_ day
    fun dateValidDmy day month year =
      (
        FFI.Word8.withVal
         &&&> GLibDateMonth.C.withVal
         &&&> FFI.Word16.withVal
         ---> FFI.Bool.fromVal
      )
        dateValidDmy_
        (
          day
           & month
           & year
        )
    fun dateValidJulian julianDate = (FFI.Word32.withVal ---> FFI.Bool.fromVal) dateValidJulian_ julianDate
    fun dateValidMonth month = (GLibDateMonth.C.withVal ---> FFI.Bool.fromVal) dateValidMonth_ month
    fun dateValidWeekday weekday = (GLibDateWeekday.C.withVal ---> FFI.Bool.fromVal) dateValidWeekday_ weekday
    fun dateValidYear year = (FFI.Word16.withVal ---> FFI.Bool.fromVal) dateValidYear_ year
    fun dcgettext domain msgid category =
      (
        FFI.String.withConstOptPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> FFI.String.fromPtr false
      )
        dcgettext_
        (
          domain
           & msgid
           & category
        )
    fun dgettext domain msgid = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) dgettext_ (domain & msgid)
    fun dirMakeTmp tmpl = (FFI.String.withConstOptPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.fromPtr true) dirMakeTmp_ (tmpl & [])
    fun directEqual () = (I ---> FFI.Bool.fromVal) directEqual_ ()
    fun directHash () = (I ---> FFI.Word32.fromVal) directHash_ ()
    fun dngettext domain msgid msgidPlural n =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> FFI.String.fromPtr false
      )
        dngettext_
        (
          domain
           & msgid
           & msgidPlural
           & n
        )
    fun doubleEqual () = (I ---> FFI.Bool.fromVal) doubleEqual_ ()
    fun doubleHash () = (I ---> FFI.Word32.fromVal) doubleHash_ ()
    fun dpgettext domain msgctxtid msgidoffset =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> FFI.String.fromPtr false
      )
        dpgettext_
        (
          domain
           & msgctxtid
           & msgidoffset
        )
    fun dpgettext2 domain context msgid =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromPtr false
      )
        dpgettext2_
        (
          domain
           & context
           & msgid
        )
    fun dummyDecl () = (I ---> I) dummyDecl_ ()
    fun fileErrorFromErrno errNo = (FFI.Int32.withVal ---> GLibFileError.C.fromVal) fileErrorFromErrno_ errNo
    fun fileErrorQuark () = (I ---> FFI.Word32.fromVal) fileErrorQuark_ ()
    fun fileOpenTmp tmpl =
      let
        val nameUsed & retVal =
          (
            FFI.String.withConstOptPtr
             &&&> FFI.String.withRefConstOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.String.fromPtr true && FFI.Int32.fromVal
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
    fun fileReadLink filename = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.fromPtr true) fileReadLink_ (filename & [])
    fun fileTest filename test = (FFI.String.withConstPtr &&&> GLibFileTest.C.withVal ---> FFI.Bool.fromVal) fileTest_ (filename & test)
    fun filenameDisplayBasename filename = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) filenameDisplayBasename_ filename
    fun filenameDisplayName filename = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) filenameDisplayName_ filename
    fun filenameFromUri uri hostname =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.fromPtr true
      )
        filenameFromUri_
        (
          uri
           & hostname
           & []
        )
    fun filenameToUri filename hostname =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.fromPtr true
      )
        filenameToUri_
        (
          filename
           & hostname
           & []
        )
    fun findProgramInPath program = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) findProgramInPath_ program
    fun formatSize size = (FFI.Word64.withVal ---> FFI.String.fromPtr true) formatSize_ size
    fun formatSizeForDisplay size = (FFI.Int64.withVal ---> FFI.String.fromPtr true) formatSizeForDisplay_ size
    fun formatSizeFull size flags = (FFI.Word64.withVal &&&> GLibFormatSizeFlags.C.withVal ---> FFI.String.fromPtr true) formatSizeFull_ (size & flags)
    fun getApplicationName () = (I ---> FFI.String.fromPtr false) getApplicationName_ ()
    fun getCharset charset = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) getCharset_ charset
    fun getCurrentDir () = (I ---> FFI.String.fromPtr true) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.C.withPtr ---> I) getCurrentTime_ result
    fun getFilenameCharsets charsets = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) getFilenameCharsets_ charsets
    fun getHomeDir () = (I ---> FFI.String.fromPtr false) getHomeDir_ ()
    fun getHostName () = (I ---> FFI.String.fromPtr false) getHostName_ ()
    fun getMonotonicTime () = (I ---> FFI.Int64.fromVal) getMonotonicTime_ ()
    fun getPrgname () = (I ---> FFI.String.fromPtr true) getPrgname_ ()
    fun getRealName () = (I ---> FFI.String.fromPtr false) getRealName_ ()
    fun getRealTime () = (I ---> FFI.Int64.fromVal) getRealTime_ ()
    fun getTmpDir () = (I ---> FFI.String.fromPtr false) getTmpDir_ ()
    fun getUserCacheDir () = (I ---> FFI.String.fromPtr false) getUserCacheDir_ ()
    fun getUserConfigDir () = (I ---> FFI.String.fromPtr false) getUserConfigDir_ ()
    fun getUserDataDir () = (I ---> FFI.String.fromPtr false) getUserDataDir_ ()
    fun getUserName () = (I ---> FFI.String.fromPtr false) getUserName_ ()
    fun getUserRuntimeDir () = (I ---> FFI.String.fromPtr false) getUserRuntimeDir_ ()
    fun getUserSpecialDir directory = (GLibUserDirectory.C.withVal ---> FFI.String.fromPtr false) getUserSpecialDir_ directory
    fun getenv variable = (FFI.String.withConstPtr ---> FFI.String.fromPtr false) getenv_ variable
    fun hookDestroy hookList hookId = (GLibHookListRecord.C.withPtr &&&> FFI.Word64.withVal ---> FFI.Bool.fromVal) hookDestroy_ (hookList & hookId)
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
    fun hostnameIsAsciiEncoded hostname = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) hostnameToUnicode_ hostname
    fun idleRemoveByData () = (I ---> FFI.Bool.fromVal) idleRemoveByData_ ()
    fun idleSourceNew () = (I ---> GLibSourceRecord.C.fromPtr true) idleSourceNew_ ()
    fun int64Equal () = (I ---> FFI.Bool.fromVal) int64Equal_ ()
    fun int64Hash () = (I ---> FFI.Word32.fromVal) int64Hash_ ()
    fun intEqual () = (I ---> FFI.Bool.fromVal) intEqual_ ()
    fun intHash () = (I ---> FFI.Word32.fromVal) intHash_ ()
    fun internStaticString string = (FFI.String.withConstOptPtr ---> FFI.String.fromPtr false) internStaticString_ string
    fun internString string = (FFI.String.withConstOptPtr ---> FFI.String.fromPtr false) internString_ string
    fun ioChannelErrorFromErrno en = (FFI.Int32.withVal ---> GLibIOChannelError.C.fromVal) ioChannelErrorFromErrno_ en
    fun ioChannelErrorQuark () = (I ---> FFI.Word32.fromVal) ioChannelErrorQuark_ ()
    fun ioCreateWatch channel condition = (GLibIOChannelRecord.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibSourceRecord.C.fromPtr true) ioCreateWatch_ (channel & condition)
    fun keyFileErrorQuark () = (I ---> FFI.Word32.fromVal) keyFileErrorQuark_ ()
    fun listPopAllocator () = (I ---> I) listPopAllocator_ ()
    fun listPushAllocator () = (I ---> I) listPushAllocator_ ()
    fun logDefaultHandler logDomain logLevel message =
      (
        FFI.String.withConstPtr
         &&&> GLibLogLevelFlags.C.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        logDefaultHandler_
        (
          logDomain
           & logLevel
           & message
        )
    fun logRemoveHandler logDomain handlerId = (FFI.String.withConstPtr &&&> FFI.Word32.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask logDomain fatalMask = (FFI.String.withConstPtr &&&> GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainContextDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextDefault_ ()
    fun mainContextGetThreadDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextGetThreadDefault_ ()
    fun mainCurrentSource () = (I ---> GLibSourceRecord.C.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> FFI.Int32.fromVal) mainDepth_ ()
    fun markupErrorQuark () = (I ---> FFI.Word32.fromVal) markupErrorQuark_ ()
    fun markupEscapeText text length = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) markupEscapeText_ (text & length)
    fun memChunkInfo () = (I ---> I) memChunkInfo_ ()
    fun memIsSystemMalloc () = (I ---> FFI.Bool.fromVal) memIsSystemMalloc_ ()
    fun memProfile () = (I ---> I) memProfile_ ()
    fun memSetVtable vtable = (GLibMemVTableRecord.C.withPtr ---> I) memSetVtable_ vtable
    fun mkdirWithParents pathname mode = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) mkdirWithParents_ (pathname & mode)
    fun mkdtemp tmpl = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) mkdtemp_ tmpl
    fun mkdtempFull tmpl mode = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr true) mkdtempFull_ (tmpl & mode)
    fun mkstemp tmpl = (FFI.String.withConstPtr ---> FFI.Int32.fromVal) mkstemp_ tmpl
    fun mkstempFull tmpl flags mode =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Int32.fromVal
      )
        mkstempFull_
        (
          tmpl
           & flags
           & mode
        )
    fun nodePopAllocator () = (I ---> I) nodePopAllocator_ ()
    fun nodePushAllocator () = (I ---> I) nodePushAllocator_ ()
    fun nullifyPointer () = (I ---> I) nullifyPointer_ ()
    fun onErrorQuery prgName = (FFI.String.withConstPtr ---> I) onErrorQuery_ prgName
    fun onErrorStackTrace prgName = (FFI.String.withConstPtr ---> I) onErrorStackTrace_ prgName
    fun optionErrorQuark () = (I ---> FFI.Word32.fromVal) optionErrorQuark_ ()
    fun pathGetBasename fileName = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) pathGetBasename_ fileName
    fun pathGetDirname fileName = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) pathGetDirname_ fileName
    fun pathIsAbsolute fileName = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) pathIsAbsolute_ fileName
    fun pathSkipRoot fileName = (FFI.String.withConstPtr ---> FFI.String.fromPtr false) pathSkipRoot_ fileName
    fun patternMatch pspec stringLength string stringReversed =
      (
        GLibPatternSpecRecord.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.Bool.fromVal
      )
        patternMatch_
        (
          pspec
           & stringLength
           & string
           & stringReversed
        )
    fun patternMatchSimple pattern string = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) patternMatchSimple_ (pattern & string)
    fun patternMatchString pspec string = (GLibPatternSpecRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) patternMatchString_ (pspec & string)
    fun pointerBitLock lockBit = (FFI.Int32.withVal ---> I) pointerBitLock_ lockBit
    fun pointerBitTrylock lockBit = (FFI.Int32.withVal ---> FFI.Bool.fromVal) pointerBitTrylock_ lockBit
    fun pointerBitUnlock lockBit = (FFI.Int32.withVal ---> I) pointerBitUnlock_ lockBit
    fun poll fds nfds timeout =
      (
        GLibPollFDRecord.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Int32.fromVal
      )
        poll_
        (
          fds
           & nfds
           & timeout
        )
    fun quarkFromStaticString string = (FFI.String.withConstOptPtr ---> FFI.Word32.fromVal) quarkFromStaticString_ string
    fun quarkFromString string = (FFI.String.withConstOptPtr ---> FFI.Word32.fromVal) quarkFromString_ string
    fun quarkToString quark = (FFI.Word32.withVal ---> FFI.String.fromPtr false) quarkToString_ quark
    fun quarkTryString string = (FFI.String.withConstOptPtr ---> FFI.Word32.fromVal) quarkTryString_ string
    fun randomDouble () = (I ---> FFI.Double.fromVal) randomDouble_ ()
    fun randomDoubleRange begin end' = (FFI.Double.withVal &&&> FFI.Double.withVal ---> FFI.Double.fromVal) randomDoubleRange_ (begin & end')
    fun randomInt () = (I ---> FFI.Word32.fromVal) randomInt_ ()
    fun randomIntRange begin end' = (FFI.Int32.withVal &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) randomIntRange_ (begin & end')
    fun randomSetSeed seed = (FFI.Word32.withVal ---> I) randomSetSeed_ seed
    fun regexCheckReplacement replacement =
      let
        val hasReferences & retVal =
          (
            FFI.String.withConstPtr
             &&&> FFI.Bool.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Bool.fromVal && FFI.Bool.fromVal
          )
            regexCheckReplacement_
            (
              replacement
               & false
               & []
            )
      in
        if retVal then SOME hasReferences else NONE
      end
    fun regexErrorQuark () = (I ---> FFI.Word32.fromVal) regexErrorQuark_ ()
    fun regexEscapeNul string length = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr true) regexEscapeNul_ (string & length)
    fun regexMatchSimple pattern string compileOptions matchOptions =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibRegexCompileFlags.C.withVal
         &&&> GLibRegexMatchFlags.C.withVal
         ---> FFI.Bool.fromVal
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> I
      )
        returnIfFailWarning_
        (
          logDomain
           & prettyFunction
           & expression
        )
    fun rmdir filename = (FFI.String.withConstPtr ---> FFI.Int32.fromVal) rmdir_ filename
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
    fun sequenceSet iter = (GLibSequenceIterRecord.C.withPtr ---> I) sequenceSet_ iter
    fun sequenceSwap a b = (GLibSequenceIterRecord.C.withPtr &&&> GLibSequenceIterRecord.C.withPtr ---> I) sequenceSwap_ (a & b)
    fun setApplicationName applicationName = (FFI.String.withConstPtr ---> I) setApplicationName_ applicationName
    fun setPrgname prgname = (FFI.String.withConstPtr ---> I) setPrgname_ prgname
    fun setenv variable value overwrite =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Bool.withVal
         ---> FFI.Bool.fromVal
      )
        setenv_
        (
          variable
           & value
           & overwrite
        )
    fun shellErrorQuark () = (I ---> FFI.Word32.fromVal) shellErrorQuark_ ()
    fun shellQuote unquotedString = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) shellQuote_ unquotedString
    fun shellUnquote quotedString = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.fromPtr true) shellUnquote_ (quotedString & [])
    fun sliceFree1 blockSize = (FFI.Word64.withVal ---> I) sliceFree1_ blockSize
    fun sliceFreeChainWithOffset blockSize nextOffset = (FFI.Word64.withVal &&&> FFI.Word64.withVal ---> I) sliceFreeChainWithOffset_ (blockSize & nextOffset)
    fun sliceGetConfig ckey = (GLibSliceConfig.C.withVal ---> FFI.Int64.fromVal) sliceGetConfig_ ckey
    fun sliceSetConfig ckey value = (GLibSliceConfig.C.withVal &&&> FFI.Int64.withVal ---> I) sliceSetConfig_ (ckey & value)
    fun sourceRemove tag = (FFI.Word32.withVal ---> FFI.Bool.fromVal) sourceRemove_ tag
    fun sourceSetNameById tag name = (FFI.Word32.withVal &&&> FFI.String.withConstPtr ---> I) sourceSetNameById_ (tag & name)
    fun spacedPrimesClosest num = (FFI.Word32.withVal ---> FFI.Word32.fromVal) spacedPrimesClosest_ num
    fun spawnClosePid pid = (FFI.Int32.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun spawnErrorQuark () = (I ---> FFI.Word32.fromVal) spawnErrorQuark_ ()
    fun stpcpy dest src = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) stpcpy_ (dest & src)
    fun strEqual () = (I ---> FFI.Bool.fromVal) strEqual_ ()
    fun strHasPrefix str prefix = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) strHasPrefix_ (str & prefix)
    fun strHasSuffix str suffix = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) strHasSuffix_ (str & suffix)
    fun strHash () = (I ---> FFI.Word32.fromVal) strHash_ ()
    fun strcanon string validChars substitutor =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word8.withVal
         ---> FFI.String.fromPtr true
      )
        strcanon_
        (
          string
           & validChars
           & substitutor
        )
    fun strcasecmp s1 s2 = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) strcasecmp_ (s1 & s2)
    fun strchomp string = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strchomp_ string
    fun strchug string = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strchug_ string
    fun strcmp0 str1 str2 = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) strcmp0_ (str1 & str2)
    fun strcompress source = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strcompress_ source
    fun strdelimit string delimiters newDelimiter =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word8.withVal
         ---> FFI.String.fromPtr true
      )
        strdelimit_
        (
          string
           & delimiters
           & newDelimiter
        )
    fun strdown string = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strdown_ string
    fun strdup str = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strdup_ str
    fun strerror errnum = (FFI.Int32.withVal ---> FFI.String.fromPtr false) strerror_ errnum
    fun strescape source exceptions = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) strescape_ (source & exceptions)
    fun strfreev strArray = (FFI.String.withConstPtr ---> I) strfreev_ strArray
    fun stringNew init = (FFI.String.withConstPtr ---> GLibStringRecord.C.fromPtr true) stringNew_ init
    fun stringNewLen init len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> GLibStringRecord.C.fromPtr true) stringNewLen_ (init & len)
    fun stringSizedNew dflSize = (FFI.Word64.withVal ---> GLibStringRecord.C.fromPtr true) stringSizedNew_ dflSize
    fun stripContext msgid msgval = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr false) stripContext_ (msgid & msgval)
    fun strjoinv separator strArray = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) strjoinv_ (separator & strArray)
    fun strlcat dest src destSize =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> FFI.Word64.fromVal
      )
        strlcat_
        (
          dest
           & src
           & destSize
        )
    fun strlcpy dest src destSize =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> FFI.Word64.fromVal
      )
        strlcpy_
        (
          dest
           & src
           & destSize
        )
    fun strncasecmp s1 s2 n =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word32.withVal
         ---> FFI.Int32.fromVal
      )
        strncasecmp_
        (
          s1
           & s2
           & n
        )
    fun strndup str n = (FFI.String.withConstPtr &&&> FFI.Word64.withVal ---> FFI.String.fromPtr true) strndup_ (str & n)
    fun strnfill length fillChar = (FFI.Word64.withVal &&&> FFI.Word8.withVal ---> FFI.String.fromPtr true) strnfill_ (length & fillChar)
    fun strreverse string = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strreverse_ string
    fun strrstr haystack needle = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) strrstr_ (haystack & needle)
    fun strrstrLen haystack haystackLen needle =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromPtr true
      )
        strrstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strsignal signum = (FFI.Int32.withVal ---> FFI.String.fromPtr false) strsignal_ signum
    fun strstrLen haystack haystackLen needle =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromPtr true
      )
        strstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strtod nptr endptr = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Double.fromVal) strtod_ (nptr & endptr)
    fun strup string = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) strup_ string
    fun strvLength strArray = (FFI.String.withConstPtr ---> FFI.Word32.fromVal) strvLength_ strArray
    fun testBug bugUriSnippet = (FFI.String.withConstPtr ---> I) testBug_ bugUriSnippet
    fun testBugBase uriPattern = (FFI.String.withConstPtr ---> I) testBugBase_ uriPattern
    fun testFail () = (I ---> I) testFail_ ()
    fun testLogTypeName logType = (GLibTestLogType.C.withVal ---> FFI.String.fromPtr false) testLogTypeName_ logType
    fun testQueueFree () = (I ---> I) testQueueFree_ ()
    fun testRandDouble () = (I ---> FFI.Double.fromVal) testRandDouble_ ()
    fun testRandDoubleRange rangeStart rangeEnd = (FFI.Double.withVal &&&> FFI.Double.withVal ---> FFI.Double.fromVal) testRandDoubleRange_ (rangeStart & rangeEnd)
    fun testRandInt () = (I ---> FFI.Int32.fromVal) testRandInt_ ()
    fun testRandIntRange begin end' = (FFI.Int32.withVal &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) testRandIntRange_ (begin & end')
    fun testRun () = (I ---> FFI.Int32.fromVal) testRun_ ()
    fun testRunSuite suite = (GLibTestSuiteRecord.C.withPtr ---> FFI.Int32.fromVal) testRunSuite_ suite
    fun testTimerElapsed () = (I ---> FFI.Double.fromVal) testTimerElapsed_ ()
    fun testTimerLast () = (I ---> FFI.Double.fromVal) testTimerLast_ ()
    fun testTimerStart () = (I ---> I) testTimerStart_ ()
    fun testTrapAssertions domain file line func assertionFlags pattern =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         &&&> FFI.String.withConstPtr
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
    fun testTrapFork usecTimeout testTrapFlags = (FFI.Word64.withVal &&&> GLibTestTrapFlags.C.withVal ---> FFI.Bool.fromVal) testTrapFork_ (usecTimeout & testTrapFlags)
    fun testTrapHasPassed () = (I ---> FFI.Bool.fromVal) testTrapHasPassed_ ()
    fun testTrapReachedTimeout () = (I ---> FFI.Bool.fromVal) testTrapReachedTimeout_ ()
    fun threadErrorQuark () = (I ---> FFI.Word32.fromVal) threadErrorQuark_ ()
    fun threadExit () = (I ---> I) threadExit_ ()
    fun threadGetInitialized () = (I ---> FFI.Bool.fromVal) threadGetInitialized_ ()
    fun threadInit vtable = (GLibThreadFunctionsRecord.C.withPtr ---> I) threadInit_ vtable
    fun threadInitWithErrorcheckMutexes vtable = (GLibThreadFunctionsRecord.C.withPtr ---> I) threadInitWithErrorcheckMutexes_ vtable
    fun threadPoolGetMaxIdleTime () = (I ---> FFI.Word32.fromVal) threadPoolGetMaxIdleTime_ ()
    fun threadPoolGetMaxUnusedThreads () = (I ---> FFI.Int32.fromVal) threadPoolGetMaxUnusedThreads_ ()
    fun threadPoolGetNumUnusedThreads () = (I ---> FFI.Word32.fromVal) threadPoolGetNumUnusedThreads_ ()
    fun threadPoolSetMaxIdleTime interval = (FFI.Word32.withVal ---> I) threadPoolSetMaxIdleTime_ interval
    fun threadPoolSetMaxUnusedThreads maxThreads = (FFI.Int32.withVal ---> I) threadPoolSetMaxUnusedThreads_ maxThreads
    fun threadPoolStopUnusedThreads () = (I ---> I) threadPoolStopUnusedThreads_ ()
    fun timeValFromIso8601 isoDate time = (FFI.String.withConstPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.fromVal) timeValFromIso8601_ (isoDate & time)
    fun timeoutSourceNew interval = (FFI.Word32.withVal ---> GLibSourceRecord.C.fromPtr true) timeoutSourceNew_ interval
    fun timeoutSourceNewSeconds interval = (FFI.Word32.withVal ---> GLibSourceRecord.C.fromPtr true) timeoutSourceNewSeconds_ interval
    fun trashStackHeight stackP = (GLibTrashStackRecord.C.withPtr ---> FFI.Word32.fromVal) trashStackHeight_ stackP
    fun trashStackPush stackP = (GLibTrashStackRecord.C.withPtr ---> I) trashStackPush_ stackP
    fun unicharBreakType c = (FFI.Char.withVal ---> GLibUnicodeBreakType.C.fromVal) unicharBreakType_ c
    fun unicharCombiningClass uc = (FFI.Char.withVal ---> FFI.Int32.fromVal) unicharCombiningClass_ uc
    fun unicharDigitValue c = (FFI.Char.withVal ---> FFI.Int32.fromVal) unicharDigitValue_ c
    fun unicharGetScript ch = (FFI.Char.withVal ---> GLibUnicodeScript.C.fromVal) unicharGetScript_ ch
    fun unicharIsalnum c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsalnum_ c
    fun unicharIsalpha c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsalpha_ c
    fun unicharIscntrl c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIscntrl_ c
    fun unicharIsdefined c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsdefined_ c
    fun unicharIsdigit c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsdigit_ c
    fun unicharIsgraph c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsgraph_ c
    fun unicharIslower c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIslower_ c
    fun unicharIsmark c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsmark_ c
    fun unicharIsprint c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsprint_ c
    fun unicharIspunct c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIspunct_ c
    fun unicharIsspace c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsspace_ c
    fun unicharIstitle c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIstitle_ c
    fun unicharIsupper c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsupper_ c
    fun unicharIswide c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIswide_ c
    fun unicharIswideCjk c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIswideCjk_ c
    fun unicharIsxdigit c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIsxdigit_ c
    fun unicharIszerowidth c = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharIszerowidth_ c
    fun unicharToUtf8 c outbuf = (FFI.Char.withVal &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) unicharToUtf8_ (c & outbuf)
    fun unicharTolower c = (FFI.Char.withVal ---> FFI.Char.fromVal) unicharTolower_ c
    fun unicharTotitle c = (FFI.Char.withVal ---> FFI.Char.fromVal) unicharTotitle_ c
    fun unicharToupper c = (FFI.Char.withVal ---> FFI.Char.fromVal) unicharToupper_ c
    fun unicharType c = (FFI.Char.withVal ---> GLibUnicodeType.C.fromVal) unicharType_ c
    fun unicharValidate ch = (FFI.Char.withVal ---> FFI.Bool.fromVal) unicharValidate_ ch
    fun unicharXdigitValue c = (FFI.Char.withVal ---> FFI.Int32.fromVal) unicharXdigitValue_ c
    fun unicodeScriptFromIso15924 iso15924 = (FFI.Word32.withVal ---> GLibUnicodeScript.C.fromVal) unicodeScriptFromIso15924_ iso15924
    fun unicodeScriptToIso15924 script = (GLibUnicodeScript.C.withVal ---> FFI.Word32.fromVal) unicodeScriptToIso15924_ script
    fun unlink filename = (FFI.String.withConstPtr ---> FFI.Int32.fromVal) unlink_ filename
    fun unsetenv variable = (FFI.String.withConstPtr ---> I) unsetenv_ variable
    fun uriEscapeString unescaped reservedCharsAllowed allowUtf8 =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Bool.withVal
         ---> FFI.String.fromPtr true
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriParseScheme uri = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) uriParseScheme_ uri
    fun uriUnescapeSegment escapedString escapedStringEnd illegalCharacters =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         ---> FFI.String.fromPtr true
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString escapedString illegalCharacters = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) uriUnescapeString_ (escapedString & illegalCharacters)
    fun usleep microseconds = (FFI.Word64.withVal ---> I) usleep_ microseconds
    fun utf8Casefold str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8Casefold_ (str & len)
    fun utf8Collate str1 str2 = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Int32.fromVal) utf8Collate_ (str1 & str2)
    fun utf8CollateKey str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8CollateKey_ (str & len)
    fun utf8CollateKeyForFilename str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8CollateKeyForFilename_ (str & len)
    fun utf8FindNextChar p end' = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) utf8FindNextChar_ (p & end')
    fun utf8FindPrevChar str p = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.String.fromPtr true) utf8FindPrevChar_ (str & p)
    fun utf8GetChar p = (FFI.String.withConstPtr ---> FFI.Char.fromVal) utf8GetChar_ p
    fun utf8GetCharValidated p maxLen = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.Char.fromVal) utf8GetCharValidated_ (p & maxLen)
    fun utf8Normalize str len mode =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> GLibNormalizeMode.C.withVal
         ---> FFI.String.fromPtr true
      )
        utf8Normalize_
        (
          str
           & len
           & mode
        )
    fun utf8OffsetToPointer str offset = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8OffsetToPointer_ (str & offset)
    fun utf8PointerToOffset str pos = (FFI.String.withConstPtr &&&> FFI.String.withConstPtr ---> FFI.Int64.fromVal) utf8PointerToOffset_ (str & pos)
    fun utf8PrevChar p = (FFI.String.withConstPtr ---> FFI.String.fromPtr true) utf8PrevChar_ p
    fun utf8Strchr p len c =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> FFI.Char.withVal
         ---> FFI.String.fromPtr true
      )
        utf8Strchr_
        (
          p
           & len
           & c
        )
    fun utf8Strdown str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8Strdown_ (str & len)
    fun utf8Strlen p max = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.Int64.fromVal) utf8Strlen_ (p & max)
    fun utf8Strncpy dest src n =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Word64.withVal
         ---> FFI.String.fromPtr true
      )
        utf8Strncpy_
        (
          dest
           & src
           & n
        )
    fun utf8Strrchr p len c =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> FFI.Char.withVal
         ---> FFI.String.fromPtr true
      )
        utf8Strrchr_
        (
          p
           & len
           & c
        )
    fun utf8Strreverse str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8Strreverse_ (str & len)
    fun utf8Strup str len = (FFI.String.withConstPtr &&&> FFI.Int64.withVal ---> FFI.String.fromPtr true) utf8Strup_ (str & len)
    fun utf8Substring str startPos endPos =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int64.withVal
         &&&> FFI.Int64.withVal
         ---> FFI.String.fromPtr true
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
            FFI.String.withConstPtr
             &&&> FFI.Int64.withVal
             &&&> FFI.String.withRefConstOptPtr
             ---> FFI.String.fromPtr true && FFI.Bool.fromVal
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
    fun variantIsObjectPath string = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) variantIsObjectPath_ string
    fun variantIsSignature string = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) variantIsSignature_ string
    fun variantParse type' text limit endptr =
      (
        GLibVariantTypeRecord.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
    fun variantParserGetErrorQuark () = (I ---> FFI.Word32.fromVal) variantParserGetErrorQuark_ ()
    fun variantTypeChecked unknown = (FFI.String.withConstPtr ---> GLibVariantTypeRecord.C.fromPtr false) variantTypeChecked_ unknown
    fun variantTypeStringIsValid typeString = (FFI.String.withConstPtr ---> FFI.Bool.fromVal) variantTypeStringIsValid_ typeString
    fun variantTypeStringScan string limit =
      let
        val endptr & retVal =
          (
            FFI.String.withConstPtr
             &&&> FFI.String.withConstOptPtr
             &&&> FFI.String.withRefConstOptPtr
             ---> FFI.String.fromPtr true && FFI.Bool.fromVal
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
