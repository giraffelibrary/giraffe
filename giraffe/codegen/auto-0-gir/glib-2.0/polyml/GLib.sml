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
      val access_ = call (getSymbol "g_access") (Utf8.PolyML.cInPtr &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val asciiDigitValue_ = call (getSymbol "g_ascii_digit_value") (GChar.PolyML.cVal --> GInt.PolyML.cVal)
      val asciiDtostr_ =
        call (getSymbol "g_ascii_dtostr")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val asciiFormatd_ =
        call (getSymbol "g_ascii_formatd")
          (
            Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val asciiStrcasecmp_ = call (getSymbol "g_ascii_strcasecmp") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val asciiStrdown_ = call (getSymbol "g_ascii_strdown") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val asciiStrncasecmp_ =
        call (getSymbol "g_ascii_strncasecmp")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val asciiStrtod_ = call (getSymbol "g_ascii_strtod") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GDouble.PolyML.cVal)
      val asciiStrtoll_ =
        call (getSymbol "g_ascii_strtoll")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt.PolyML.cVal
             --> GInt64.PolyML.cVal
          )
      val asciiStrtoull_ =
        call (getSymbol "g_ascii_strtoull")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt.PolyML.cVal
             --> GUInt64.PolyML.cVal
          )
      val asciiStrup_ = call (getSymbol "g_ascii_strup") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val asciiTolower_ = call (getSymbol "g_ascii_tolower") (GChar.PolyML.cVal --> GChar.PolyML.cVal)
      val asciiToupper_ = call (getSymbol "g_ascii_toupper") (GChar.PolyML.cVal --> GChar.PolyML.cVal)
      val asciiXdigitValue_ = call (getSymbol "g_ascii_xdigit_value") (GChar.PolyML.cVal --> GInt.PolyML.cVal)
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
      val basename_ = call (getSymbol "g_basename") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val bitNthLsf_ = call (getSymbol "g_bit_nth_lsf") (GULong.PolyML.cVal &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val bitNthMsf_ = call (getSymbol "g_bit_nth_msf") (GULong.PolyML.cVal &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val bitStorage_ = call (getSymbol "g_bit_storage") (GULong.PolyML.cVal --> GUInt.PolyML.cVal)
      val blowChunks_ = call (getSymbol "g_blow_chunks") (cVoid --> cVoid)
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
      val clearError_ = call (getSymbol "g_clear_error") (GLibErrorRecord.PolyML.cOutOptRef --> cVoid)
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
      val convertErrorQuark_ = call (getSymbol "g_convert_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
      val datalistClear_ = call (getSymbol "g_datalist_clear") (GLibDataRecord.PolyML.cPtr --> cVoid)
      val datalistGetFlags_ = call (getSymbol "g_datalist_get_flags") (GLibDataRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val datalistInit_ = call (getSymbol "g_datalist_init") (GLibDataRecord.PolyML.cPtr --> cVoid)
      val datalistSetFlags_ = call (getSymbol "g_datalist_set_flags") (GLibDataRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val datalistUnsetFlags_ = call (getSymbol "g_datalist_unset_flags") (GLibDataRecord.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
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
      val dummyDecl_ = call (getSymbol "glib_dummy_decl") (cVoid --> cVoid)
      val fileErrorFromErrno_ = call (getSymbol "g_file_error_from_errno") (GInt.PolyML.cVal --> GLibFileError.PolyML.cVal)
      val fileErrorQuark_ = call (getSymbol "g_file_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
      val fileOpenTmp_ =
        call (getSymbol "g_file_open_tmp")
          (
            Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val fileReadLink_ = call (getSymbol "g_file_read_link") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> Utf8.PolyML.cOutPtr)
      val fileSetContents_ =
        call (getSymbol "g_file_set_contents")
          (
            Utf8.PolyML.cInPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val fileTest_ = call (getSymbol "g_file_test") (Utf8.PolyML.cInPtr &&> GLibFileTest.PolyML.cVal --> GBool.PolyML.cVal)
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
      val getCharset_ = call (getSymbol "g_get_charset") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getCurrentDir_ = call (getSymbol "g_get_current_dir") (cVoid --> Utf8.PolyML.cOutPtr)
      val getCurrentTime_ = call (getSymbol "g_get_current_time") (GLibTimeValRecord.PolyML.cPtr --> cVoid)
      val getEnviron_ = call (getSymbol "g_get_environ") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val getFilenameCharsets_ = call (getSymbol "g_get_filename_charsets") (Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
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
      val internStaticString_ = call (getSymbol "g_intern_static_string") (Utf8.PolyML.cInOptPtr --> Utf8.PolyML.cOutPtr)
      val internString_ = call (getSymbol "g_intern_string") (Utf8.PolyML.cInOptPtr --> Utf8.PolyML.cOutPtr)
      val ioCreateWatch_ = call (getSymbol "g_io_create_watch") (GLibIOChannelRecord.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val listenv_ = call (getSymbol "g_listenv") (cVoid --> Utf8CVector.PolyML.cOutPtr)
      val logRemoveHandler_ = call (getSymbol "g_log_remove_handler") (Utf8.PolyML.cInPtr &&> GUInt.PolyML.cVal --> cVoid)
      val logSetAlwaysFatal_ = call (getSymbol "g_log_set_always_fatal") (GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val logSetFatalMask_ = call (getSymbol "g_log_set_fatal_mask") (Utf8.PolyML.cInPtr &&> GLibLogLevelFlags.PolyML.cVal --> GLibLogLevelFlags.PolyML.cVal)
      val mainCurrentSource_ = call (getSymbol "g_main_current_source") (cVoid --> GLibSourceRecord.PolyML.cPtr)
      val mainDepth_ = call (getSymbol "g_main_depth") (cVoid --> GInt.PolyML.cVal)
      val markupErrorQuark_ = call (getSymbol "g_markup_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
      val markupEscapeText_ = call (getSymbol "g_markup_escape_text") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val memIsSystemMalloc_ = call (getSymbol "g_mem_is_system_malloc") (cVoid --> GBool.PolyML.cVal)
      val memProfile_ = call (getSymbol "g_mem_profile") (cVoid --> cVoid)
      val memSetVtable_ = call (getSymbol "g_mem_set_vtable") (GLibMemVTableRecord.PolyML.cPtr --> cVoid)
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
      val optionErrorQuark_ = call (getSymbol "g_option_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
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
      val poll_ =
        call (getSymbol "g_poll")
          (
            GLibPollFDRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val quarkFromStaticString_ = call (getSymbol "g_quark_from_static_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val quarkFromString_ = call (getSymbol "g_quark_from_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val quarkToString_ = call (getSymbol "g_quark_to_string") (GLibQuark.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val quarkTryString_ = call (getSymbol "g_quark_try_string") (Utf8.PolyML.cInOptPtr --> GLibQuark.PolyML.cVal)
      val randomDouble_ = call (getSymbol "g_random_double") (cVoid --> GDouble.PolyML.cVal)
      val randomDoubleRange_ = call (getSymbol "g_random_double_range") (GDouble.PolyML.cVal &&> GDouble.PolyML.cVal --> GDouble.PolyML.cVal)
      val randomInt_ = call (getSymbol "g_random_int") (cVoid --> GUInt32.PolyML.cVal)
      val randomIntRange_ = call (getSymbol "g_random_int_range") (GInt32.PolyML.cVal &&> GInt32.PolyML.cVal --> GInt32.PolyML.cVal)
      val randomSetSeed_ = call (getSymbol "g_random_set_seed") (GUInt32.PolyML.cVal --> cVoid)
      val reloadUserSpecialDirsCache_ = call (getSymbol "g_reload_user_special_dirs_cache") (cVoid --> cVoid)
      val returnIfFailWarning_ =
        call (getSymbol "g_return_if_fail_warning")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
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
      val shellErrorQuark_ = call (getSymbol "g_shell_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
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
      val spacedPrimesClosest_ = call (getSymbol "g_spaced_primes_closest") (GUInt.PolyML.cVal --> GUInt.PolyML.cVal)
      val spawnClosePid_ = call (getSymbol "g_spawn_close_pid") (GLibPid.PolyML.cVal --> cVoid)
      val spawnCommandLineAsync_ = call (getSymbol "g_spawn_command_line_async") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val spawnErrorQuark_ = call (getSymbol "g_spawn_error_quark") (cVoid --> GLibQuark.PolyML.cVal)
      val stpcpy_ = call (getSymbol "g_stpcpy") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strHasPrefix_ = call (getSymbol "g_str_has_prefix") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val strHasSuffix_ = call (getSymbol "g_str_has_suffix") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val strcanon_ =
        call (getSymbol "g_strcanon")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GChar.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val strcasecmp_ = call (getSymbol "g_strcasecmp") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val strchomp_ = call (getSymbol "g_strchomp") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strchug_ = call (getSymbol "g_strchug") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strcmp0_ = call (getSymbol "g_strcmp0") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val strcompress_ = call (getSymbol "g_strcompress") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strdelimit_ =
        call (getSymbol "g_strdelimit")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GChar.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val strdown_ = call (getSymbol "g_strdown") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strdup_ = call (getSymbol "g_strdup") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strerror_ = call (getSymbol "g_strerror") (GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strescape_ = call (getSymbol "g_strescape") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strfreev_ = call (getSymbol "g_strfreev") (Utf8.PolyML.cInPtr --> cVoid)
      val stringNew_ = call (getSymbol "g_string_new") (Utf8.PolyML.cInPtr --> GLibStringRecord.PolyML.cPtr)
      val stringNewLen_ = call (getSymbol "g_string_new_len") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val stringSizedNew_ = call (getSymbol "g_string_sized_new") (GSize.PolyML.cVal --> GLibStringRecord.PolyML.cPtr)
      val stripContext_ = call (getSymbol "g_strip_context") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strjoinv_ = call (getSymbol "g_strjoinv") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strlcat_ =
        call (getSymbol "g_strlcat")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> GSize.PolyML.cVal
          )
      val strlcpy_ =
        call (getSymbol "g_strlcpy")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> GSize.PolyML.cVal
          )
      val strncasecmp_ =
        call (getSymbol "g_strncasecmp")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GUInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val strndup_ = call (getSymbol "g_strndup") (Utf8.PolyML.cInPtr &&> GSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strnfill_ = call (getSymbol "g_strnfill") (GSize.PolyML.cVal &&> GChar.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strreverse_ = call (getSymbol "g_strreverse") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strrstr_ = call (getSymbol "g_strrstr") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strrstrLen_ =
        call (getSymbol "g_strrstr_len")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val strsignal_ = call (getSymbol "g_strsignal") (GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val strstrLen_ =
        call (getSymbol "g_strstr_len")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> Utf8.PolyML.cOutPtr
          )
      val strtod_ = call (getSymbol "g_strtod") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GDouble.PolyML.cVal)
      val strup_ = call (getSymbol "g_strup") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val strvLength_ = call (getSymbol "g_strv_length") (Utf8.PolyML.cInPtr --> GUInt.PolyML.cVal)
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
      val unicharBreakType_ = call (getSymbol "g_unichar_break_type") (GChar.PolyML.cVal --> GLibUnicodeBreakType.PolyML.cVal)
      val unicharCombiningClass_ = call (getSymbol "g_unichar_combining_class") (GChar.PolyML.cVal --> GInt.PolyML.cVal)
      val unicharDigitValue_ = call (getSymbol "g_unichar_digit_value") (GChar.PolyML.cVal --> GInt.PolyML.cVal)
      val unicharGetScript_ = call (getSymbol "g_unichar_get_script") (GChar.PolyML.cVal --> GLibUnicodeScript.PolyML.cVal)
      val unicharIsalnum_ = call (getSymbol "g_unichar_isalnum") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsalpha_ = call (getSymbol "g_unichar_isalpha") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIscntrl_ = call (getSymbol "g_unichar_iscntrl") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsdefined_ = call (getSymbol "g_unichar_isdefined") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsdigit_ = call (getSymbol "g_unichar_isdigit") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsgraph_ = call (getSymbol "g_unichar_isgraph") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIslower_ = call (getSymbol "g_unichar_islower") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsmark_ = call (getSymbol "g_unichar_ismark") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsprint_ = call (getSymbol "g_unichar_isprint") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIspunct_ = call (getSymbol "g_unichar_ispunct") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsspace_ = call (getSymbol "g_unichar_isspace") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIstitle_ = call (getSymbol "g_unichar_istitle") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsupper_ = call (getSymbol "g_unichar_isupper") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIswide_ = call (getSymbol "g_unichar_iswide") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIswideCjk_ = call (getSymbol "g_unichar_iswide_cjk") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIsxdigit_ = call (getSymbol "g_unichar_isxdigit") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharIszerowidth_ = call (getSymbol "g_unichar_iszerowidth") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharToUtf8_ = call (getSymbol "g_unichar_to_utf8") (GChar.PolyML.cVal &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val unicharTolower_ = call (getSymbol "g_unichar_tolower") (GChar.PolyML.cVal --> GChar.PolyML.cVal)
      val unicharTotitle_ = call (getSymbol "g_unichar_totitle") (GChar.PolyML.cVal --> GChar.PolyML.cVal)
      val unicharToupper_ = call (getSymbol "g_unichar_toupper") (GChar.PolyML.cVal --> GChar.PolyML.cVal)
      val unicharType_ = call (getSymbol "g_unichar_type") (GChar.PolyML.cVal --> GLibUnicodeType.PolyML.cVal)
      val unicharValidate_ = call (getSymbol "g_unichar_validate") (GChar.PolyML.cVal --> GBool.PolyML.cVal)
      val unicharXdigitValue_ = call (getSymbol "g_unichar_xdigit_value") (GChar.PolyML.cVal --> GInt.PolyML.cVal)
      val unicodeScriptFromIso15924_ = call (getSymbol "g_unicode_script_from_iso15924") (GUInt32.PolyML.cVal --> GLibUnicodeScript.PolyML.cVal)
      val unicodeScriptToIso15924_ = call (getSymbol "g_unicode_script_to_iso15924") (GLibUnicodeScript.PolyML.cVal --> GUInt32.PolyML.cVal)
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
      val utf8Casefold_ = call (getSymbol "g_utf8_casefold") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Collate_ = call (getSymbol "g_utf8_collate") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val utf8CollateKey_ = call (getSymbol "g_utf8_collate_key") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8CollateKeyForFilename_ = call (getSymbol "g_utf8_collate_key_for_filename") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8FindNextChar_ = call (getSymbol "g_utf8_find_next_char") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val utf8FindPrevChar_ = call (getSymbol "g_utf8_find_prev_char") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val utf8GetChar_ = call (getSymbol "g_utf8_get_char") (Utf8.PolyML.cInPtr --> GChar.PolyML.cVal)
      val utf8GetCharValidated_ = call (getSymbol "g_utf8_get_char_validated") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> GChar.PolyML.cVal)
      val utf8Normalize_ =
        call (getSymbol "g_utf8_normalize")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GLibNormalizeMode.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8OffsetToPointer_ = call (getSymbol "g_utf8_offset_to_pointer") (Utf8.PolyML.cInPtr &&> GLong.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8PointerToOffset_ = call (getSymbol "g_utf8_pointer_to_offset") (Utf8.PolyML.cInPtr &&> Utf8.PolyML.cInPtr --> GLong.PolyML.cVal)
      val utf8PrevChar_ = call (getSymbol "g_utf8_prev_char") (Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val utf8Strchr_ =
        call (getSymbol "g_utf8_strchr")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GChar.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Strdown_ = call (getSymbol "g_utf8_strdown") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Strlen_ = call (getSymbol "g_utf8_strlen") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> GLong.PolyML.cVal)
      val utf8Strncpy_ =
        call (getSymbol "g_utf8_strncpy")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Strrchr_ =
        call (getSymbol "g_utf8_strrchr")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GChar.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Strreverse_ = call (getSymbol "g_utf8_strreverse") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Strup_ = call (getSymbol "g_utf8_strup") (Utf8.PolyML.cInPtr &&> GSSize.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val utf8Substring_ =
        call (getSymbol "g_utf8_substring")
          (
            Utf8.PolyML.cInPtr
             &&> GLong.PolyML.cVal
             &&> GLong.PolyML.cVal
             --> Utf8.PolyML.cOutPtr
          )
      val utf8Validate_ =
        call (getSymbol "g_utf8_validate")
          (
            Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> Utf8.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
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
    structure PollFDRecord = GLibPollFDRecord
    structure RegexRecord = GLibRegexRecord
    structure RegexCompileFlags = GLibRegexCompileFlags
    structure RegexMatchFlags = GLibRegexMatchFlags
    structure SeekType = GLibSeekType
    structure SliceConfig = GLibSliceConfig
    structure SourceRecord = GLibSourceRecord
    structure SpawnFlags = GLibSpawnFlags
    structure StringRecord = GLibStringRecord
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
    structure VariantRecord = GLibVariantRecord
    structure VariantClass = GLibVariantClass
    structure VariantParseError = GLibVariantParseError
    structure VariantTypeRecord = GLibVariantTypeRecord
    structure ChildWatchFunc = GLibChildWatchFunc
    structure IOFunc = GLibIOFunc
    structure ErrorRecord = GLibErrorRecord
    structure KeyFile = GLibKeyFile
    structure MatchInfo = GLibMatchInfo
    structure PollFD = GLibPollFD
    structure Regex = GLibRegex
    structure Source = GLibSource
    structure String = GLibString
    structure TimeVal = GLibTimeVal
    structure Variant = GLibVariant
    structure VariantType = GLibVariantType
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
    fun access (filename, mode) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) access_ (filename & mode)
    fun asciiDigitValue c = (GChar.FFI.withVal ---> GInt.FFI.fromVal) asciiDigitValue_ c
    fun asciiDtostr
      (
        buffer,
        bufLen,
        d
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        asciiDtostr_
        (
          buffer
           & bufLen
           & d
        )
    fun asciiFormatd
      (
        buffer,
        bufLen,
        format,
        d
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        asciiFormatd_
        (
          buffer
           & bufLen
           & format
           & d
        )
    fun asciiStrcasecmp (s1, s2) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) asciiStrcasecmp_ (s1 & s2)
    fun asciiStrdown (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) asciiStrdown_ (str & len)
    fun asciiStrncasecmp
      (
        s1,
        s2,
        n
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        asciiStrncasecmp_
        (
          s1
           & s2
           & n
        )
    fun asciiStrtod (nptr, endptr) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GDouble.FFI.fromVal) asciiStrtod_ (nptr & endptr)
    fun asciiStrtoll
      (
        nptr,
        endptr,
        base
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> GInt64.FFI.fromVal
      )
        asciiStrtoll_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrtoull
      (
        nptr,
        endptr,
        base
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> GUInt64.FFI.fromVal
      )
        asciiStrtoull_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrup (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) asciiStrup_ (str & len)
    fun asciiTolower c = (GChar.FFI.withVal ---> GChar.FFI.fromVal) asciiTolower_ c
    fun asciiToupper c = (GChar.FFI.withVal ---> GChar.FFI.fromVal) asciiToupper_ c
    fun asciiXdigitValue c = (GChar.FFI.withVal ---> GInt.FFI.fromVal) asciiXdigitValue_ c
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
    fun basename fileName = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) basename_ fileName
    fun bitNthLsf (mask, nthBit) = (GULong.FFI.withVal &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) bitNthLsf_ (mask & nthBit)
    fun bitNthMsf (mask, nthBit) = (GULong.FFI.withVal &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) bitNthMsf_ (mask & nthBit)
    fun bitStorage number = (GULong.FFI.withVal ---> GUInt.FFI.fromVal) bitStorage_ number
    fun blowChunks () = (I ---> I) blowChunks_ ()
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
    fun clearError () = (GLibErrorRecord.handleError ---> I) clearError_ []
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
    fun convertErrorQuark () = (I ---> GLibQuark.FFI.fromVal) convertErrorQuark_ ()
    fun datalistClear datalist = (GLibDataRecord.FFI.withPtr ---> I) datalistClear_ datalist
    fun datalistGetFlags datalist = (GLibDataRecord.FFI.withPtr ---> GUInt.FFI.fromVal) datalistGetFlags_ datalist
    fun datalistInit datalist = (GLibDataRecord.FFI.withPtr ---> I) datalistInit_ datalist
    fun datalistSetFlags (datalist, flags) = (GLibDataRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) datalistSetFlags_ (datalist & flags)
    fun datalistUnsetFlags (datalist, flags) = (GLibDataRecord.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) datalistUnsetFlags_ (datalist & flags)
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
    fun dummyDecl () = (I ---> I) dummyDecl_ ()
    fun fileErrorFromErrno errNo = (GInt.FFI.withVal ---> GLibFileError.FFI.fromVal) fileErrorFromErrno_ errNo
    fun fileErrorQuark () = (I ---> GLibQuark.FFI.fromVal) fileErrorQuark_ ()
    fun fileOpenTmp tmpl =
      let
        val nameUsed & retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && GInt.FFI.fromVal
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
    fun fileReadLink filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr 1) fileReadLink_ (filename & [])
    fun fileSetContents (filename, contents) =
      let
        val length = LargeInt.fromInt (GUInt8CVectorN.length contents)
        val retVal =
          (
            Utf8.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal
          )
            fileSetContents_
            (
              filename
               & contents
               & length
               & []
            )
      in
        retVal
      end
    fun fileTest (filename, test) = (Utf8.FFI.withPtr &&&> GLibFileTest.FFI.withVal ---> GBool.FFI.fromVal) fileTest_ (filename & test)
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
    fun getCharset charset = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getCharset_ charset
    fun getCurrentDir () = (I ---> Utf8.FFI.fromPtr 1) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.FFI.withPtr ---> I) getCurrentTime_ result
    fun getEnviron () = (I ---> Utf8CVector.FFI.fromPtr 2) getEnviron_ ()
    fun getFilenameCharsets charsets = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getFilenameCharsets_ charsets
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
    fun internStaticString string = (Utf8.FFI.withOptPtr ---> Utf8.FFI.fromPtr 0) internStaticString_ string
    fun internString string = (Utf8.FFI.withOptPtr ---> Utf8.FFI.fromPtr 0) internString_ string
    fun ioCreateWatch (channel, condition) = (GLibIOChannelRecord.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) ioCreateWatch_ (channel & condition)
    fun listenv () = (I ---> Utf8CVector.FFI.fromPtr 2) listenv_ ()
    fun logRemoveHandler (logDomain, handlerId) = (Utf8.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask (logDomain, fatalMask) = (Utf8.FFI.withPtr &&&> GLibLogLevelFlags.FFI.withVal ---> GLibLogLevelFlags.FFI.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainCurrentSource () = (I ---> GLibSourceRecord.FFI.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> GInt.FFI.fromVal) mainDepth_ ()
    fun markupErrorQuark () = (I ---> GLibQuark.FFI.fromVal) markupErrorQuark_ ()
    fun markupEscapeText (text, length) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) markupEscapeText_ (text & length)
    fun memIsSystemMalloc () = (I ---> GBool.FFI.fromVal) memIsSystemMalloc_ ()
    fun memProfile () = (I ---> I) memProfile_ ()
    fun memSetVtable vtable = (GLibMemVTableRecord.FFI.withPtr ---> I) memSetVtable_ vtable
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
    fun optionErrorQuark () = (I ---> GLibQuark.FFI.fromVal) optionErrorQuark_ ()
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
    fun poll
      (
        fds,
        nfds,
        timeout
      ) =
      (
        GLibPollFDRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        poll_
        (
          fds
           & nfds
           & timeout
        )
    fun quarkFromStaticString string = (Utf8.FFI.withOptPtr ---> GLibQuark.FFI.fromVal) quarkFromStaticString_ string
    fun quarkFromString string = (Utf8.FFI.withOptPtr ---> GLibQuark.FFI.fromVal) quarkFromString_ string
    fun quarkToString quark = (GLibQuark.FFI.withVal ---> Utf8.FFI.fromPtr 0) quarkToString_ quark
    fun quarkTryString string = (Utf8.FFI.withOptPtr ---> GLibQuark.FFI.fromVal) quarkTryString_ string
    fun randomDouble () = (I ---> GDouble.FFI.fromVal) randomDouble_ ()
    fun randomDoubleRange (begin, end') = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GDouble.FFI.fromVal) randomDoubleRange_ (begin & end')
    fun randomInt () = (I ---> GUInt32.FFI.fromVal) randomInt_ ()
    fun randomIntRange (begin, end') = (GInt32.FFI.withVal &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) randomIntRange_ (begin & end')
    fun randomSetSeed seed = (GUInt32.FFI.withVal ---> I) randomSetSeed_ seed
    fun reloadUserSpecialDirsCache () = (I ---> I) reloadUserSpecialDirsCache_ ()
    fun returnIfFailWarning
      (
        logDomain,
        prettyFunction,
        expression
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        returnIfFailWarning_
        (
          logDomain
           & prettyFunction
           & expression
        )
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
    fun shellErrorQuark () = (I ---> GLibQuark.FFI.fromVal) shellErrorQuark_ ()
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
    fun spacedPrimesClosest num = (GUInt.FFI.withVal ---> GUInt.FFI.fromVal) spacedPrimesClosest_ num
    fun spawnClosePid pid = (GLibPid.FFI.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun spawnErrorQuark () = (I ---> GLibQuark.FFI.fromVal) spawnErrorQuark_ ()
    fun stpcpy (dest, src) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) stpcpy_ (dest & src)
    fun strHasPrefix (str, prefix) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) strHasPrefix_ (str & prefix)
    fun strHasSuffix (str, suffix) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) strHasSuffix_ (str & suffix)
    fun strcanon
      (
        string,
        validChars,
        substitutor
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GChar.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        strcanon_
        (
          string
           & validChars
           & substitutor
        )
    fun strcasecmp (s1, s2) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) strcasecmp_ (s1 & s2)
    fun strchomp string = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strchomp_ string
    fun strchug string = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strchug_ string
    fun strcmp0 (str1, str2) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) strcmp0_ (str1 & str2)
    fun strcompress source = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strcompress_ source
    fun strdelimit
      (
        string,
        delimiters,
        newDelimiter
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GChar.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        strdelimit_
        (
          string
           & delimiters
           & newDelimiter
        )
    fun strdown string = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strdown_ string
    fun strdup str = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strdup_ str
    fun strerror errnum = (GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) strerror_ errnum
    fun strescape (source, exceptions) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strescape_ (source & exceptions)
    fun strfreev strArray = (Utf8.FFI.withPtr ---> I) strfreev_ strArray
    fun stringNew init = (Utf8.FFI.withPtr ---> GLibStringRecord.FFI.fromPtr true) stringNew_ init
    fun stringNewLen (init, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) stringNewLen_ (init & len)
    fun stringSizedNew dflSize = (GSize.FFI.withVal ---> GLibStringRecord.FFI.fromPtr true) stringSizedNew_ dflSize
    fun stripContext (msgid, msgval) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) stripContext_ (msgid & msgval)
    fun strjoinv (separator, strArray) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strjoinv_ (separator & strArray)
    fun strlcat
      (
        dest,
        src,
        destSize
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         ---> GSize.FFI.fromVal
      )
        strlcat_
        (
          dest
           & src
           & destSize
        )
    fun strlcpy
      (
        dest,
        src,
        destSize
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         ---> GSize.FFI.fromVal
      )
        strlcpy_
        (
          dest
           & src
           & destSize
        )
    fun strncasecmp
      (
        s1,
        s2,
        n
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        strncasecmp_
        (
          s1
           & s2
           & n
        )
    fun strndup (str, n) = (Utf8.FFI.withPtr &&&> GSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) strndup_ (str & n)
    fun strnfill (length, fillChar) = (GSize.FFI.withVal &&&> GChar.FFI.withVal ---> Utf8.FFI.fromPtr 1) strnfill_ (length & fillChar)
    fun strreverse string = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strreverse_ string
    fun strrstr (haystack, needle) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strrstr_ (haystack & needle)
    fun strrstrLen
      (
        haystack,
        haystackLen,
        needle
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromPtr 1
      )
        strrstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strsignal signum = (GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) strsignal_ signum
    fun strstrLen
      (
        haystack,
        haystackLen,
        needle
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> Utf8.FFI.fromPtr 1
      )
        strstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strtod (nptr, endptr) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GDouble.FFI.fromVal) strtod_ (nptr & endptr)
    fun strup string = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) strup_ string
    fun strvLength strArray = (Utf8.FFI.withPtr ---> GUInt.FFI.fromVal) strvLength_ strArray
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
    fun unicharBreakType c = (GChar.FFI.withVal ---> GLibUnicodeBreakType.FFI.fromVal) unicharBreakType_ c
    fun unicharCombiningClass uc = (GChar.FFI.withVal ---> GInt.FFI.fromVal) unicharCombiningClass_ uc
    fun unicharDigitValue c = (GChar.FFI.withVal ---> GInt.FFI.fromVal) unicharDigitValue_ c
    fun unicharGetScript ch = (GChar.FFI.withVal ---> GLibUnicodeScript.FFI.fromVal) unicharGetScript_ ch
    fun unicharIsalnum c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsalnum_ c
    fun unicharIsalpha c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsalpha_ c
    fun unicharIscntrl c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIscntrl_ c
    fun unicharIsdefined c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsdefined_ c
    fun unicharIsdigit c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsdigit_ c
    fun unicharIsgraph c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsgraph_ c
    fun unicharIslower c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIslower_ c
    fun unicharIsmark c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsmark_ c
    fun unicharIsprint c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsprint_ c
    fun unicharIspunct c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIspunct_ c
    fun unicharIsspace c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsspace_ c
    fun unicharIstitle c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIstitle_ c
    fun unicharIsupper c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsupper_ c
    fun unicharIswide c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIswide_ c
    fun unicharIswideCjk c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIswideCjk_ c
    fun unicharIsxdigit c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIsxdigit_ c
    fun unicharIszerowidth c = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharIszerowidth_ c
    fun unicharToUtf8 (c, outbuf) = (GChar.FFI.withVal &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) unicharToUtf8_ (c & outbuf)
    fun unicharTolower c = (GChar.FFI.withVal ---> GChar.FFI.fromVal) unicharTolower_ c
    fun unicharTotitle c = (GChar.FFI.withVal ---> GChar.FFI.fromVal) unicharTotitle_ c
    fun unicharToupper c = (GChar.FFI.withVal ---> GChar.FFI.fromVal) unicharToupper_ c
    fun unicharType c = (GChar.FFI.withVal ---> GLibUnicodeType.FFI.fromVal) unicharType_ c
    fun unicharValidate ch = (GChar.FFI.withVal ---> GBool.FFI.fromVal) unicharValidate_ ch
    fun unicharXdigitValue c = (GChar.FFI.withVal ---> GInt.FFI.fromVal) unicharXdigitValue_ c
    fun unicodeScriptFromIso15924 iso15924 = (GUInt32.FFI.withVal ---> GLibUnicodeScript.FFI.fromVal) unicodeScriptFromIso15924_ iso15924
    fun unicodeScriptToIso15924 script = (GLibUnicodeScript.FFI.withVal ---> GUInt32.FFI.fromVal) unicodeScriptToIso15924_ script
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
    fun utf8Casefold (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8Casefold_ (str & len)
    fun utf8Collate (str1, str2) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) utf8Collate_ (str1 & str2)
    fun utf8CollateKey (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8CollateKey_ (str & len)
    fun utf8CollateKeyForFilename (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8CollateKeyForFilename_ (str & len)
    fun utf8FindNextChar (p, end') = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) utf8FindNextChar_ (p & end')
    fun utf8FindPrevChar (str, p) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) utf8FindPrevChar_ (str & p)
    fun utf8GetChar p = (Utf8.FFI.withPtr ---> GChar.FFI.fromVal) utf8GetChar_ p
    fun utf8GetCharValidated (p, maxLen) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> GChar.FFI.fromVal) utf8GetCharValidated_ (p & maxLen)
    fun utf8Normalize
      (
        str,
        len,
        mode
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GLibNormalizeMode.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        utf8Normalize_
        (
          str
           & len
           & mode
        )
    fun utf8OffsetToPointer (str, offset) = (Utf8.FFI.withPtr &&&> GLong.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8OffsetToPointer_ (str & offset)
    fun utf8PointerToOffset (str, pos) = (Utf8.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GLong.FFI.fromVal) utf8PointerToOffset_ (str & pos)
    fun utf8PrevChar p = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) utf8PrevChar_ p
    fun utf8Strchr
      (
        p,
        len,
        c
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GChar.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        utf8Strchr_
        (
          p
           & len
           & c
        )
    fun utf8Strdown (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8Strdown_ (str & len)
    fun utf8Strlen (p, max) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> GLong.FFI.fromVal) utf8Strlen_ (p & max)
    fun utf8Strncpy
      (
        dest,
        src,
        n
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GSize.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        utf8Strncpy_
        (
          dest
           & src
           & n
        )
    fun utf8Strrchr
      (
        p,
        len,
        c
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GSSize.FFI.withVal
         &&&> GChar.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        utf8Strrchr_
        (
          p
           & len
           & c
        )
    fun utf8Strreverse (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8Strreverse_ (str & len)
    fun utf8Strup (str, len) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) utf8Strup_ (str & len)
    fun utf8Substring
      (
        str,
        startPos,
        endPos
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GLong.FFI.withVal
         &&&> GLong.FFI.withVal
         ---> Utf8.FFI.fromPtr 1
      )
        utf8Substring_
        (
          str
           & startPos
           & endPos
        )
    fun utf8Validate (str, maxLen) =
      let
        val end' & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> Utf8.FFI.withRefOptPtr
             ---> Utf8.FFI.fromPtr 1 && GBool.FFI.fromVal
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
