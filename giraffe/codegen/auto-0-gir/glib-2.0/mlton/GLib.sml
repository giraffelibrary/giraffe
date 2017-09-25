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
    val assertWarning_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_assert_warning" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val assertionMessage_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_assertion_message" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val assertionMessageCmpstr_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9)
         & (x10, x11)
         & (x12, x13)
         & (x14, x15) =>
          (
            _import "mlton_g_assertion_message_cmpstr" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12,
              x13,
              x14,
              x15
            )
    val assertionMessageExpr_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_assertion_message_expr" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val base64Decode_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_base64_decode" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               -> GUInt8CVectorN.FFI.notnull GUInt8CVectorN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val base64Encode_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_base64_encode" :
              GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val buildFilenamev_ = _import "mlton_g_build_filenamev" : Utf8CVector.MLton.p1 * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val buildPathv_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_build_pathv" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8CVector.MLton.p1
               * Utf8CVector.FFI.notnull Utf8CVector.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val chdir_ = _import "mlton_g_chdir" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GInt.FFI.val_;
    val checkVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "glib_check_version" :
              GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val childWatchSourceNew_ = _import "g_child_watch_source_new" : GLibPid.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val computeChecksumForString_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_compute_checksum_for_string" :
              GLibChecksumType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSSize.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val computeHmacForString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_compute_hmac_for_string" :
              GLibChecksumType.FFI.val_
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSSize.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val convert_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & (x6, x7)
         & x8
         & x9
         & x10 =>
          (
            _import "mlton_g_convert" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val dcgettext_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_dcgettext" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dgettext_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_dgettext" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dngettext_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_dngettext" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GULong.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val dpgettext_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_dpgettext" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dpgettext2_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_dpgettext2" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val filenameDisplayBasename_ = _import "mlton_g_filename_display_basename" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val filenameDisplayName_ = _import "mlton_g_filename_display_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val filenameFromUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_from_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val filenameToUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_to_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val findProgramInPath_ = _import "mlton_g_find_program_in_path" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val formatSize_ = _import "g_format_size" : GUInt64.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val formatSizeForDisplay_ = _import "g_format_size_for_display" : GInt64.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val formatSizeFull_ = fn x1 & x2 => (_import "g_format_size_full" : GUInt64.FFI.val_ * GLibFormatSizeFlags.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getApplicationName_ = _import "g_get_application_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCurrentDir_ = _import "g_get_current_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getCurrentTime_ = _import "g_get_current_time" : GLibTimeValRecord.FFI.notnull GLibTimeValRecord.FFI.p -> unit;
    val getEnviron_ = _import "g_get_environ" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getHomeDir_ = _import "g_get_home_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getHostName_ = _import "g_get_host_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getLanguageNames_ = _import "g_get_language_names" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getLocaleVariants_ = _import "mlton_g_get_locale_variants" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getMonotonicTime_ = _import "g_get_monotonic_time" : unit -> GInt64.FFI.val_;
    val getPrgname_ = _import "g_get_prgname" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRealName_ = _import "g_get_real_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRealTime_ = _import "g_get_real_time" : unit -> GInt64.FFI.val_;
    val getSystemConfigDirs_ = _import "g_get_system_config_dirs" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getSystemDataDirs_ = _import "g_get_system_data_dirs" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getTmpDir_ = _import "g_get_tmp_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserCacheDir_ = _import "g_get_user_cache_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserConfigDir_ = _import "g_get_user_config_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserDataDir_ = _import "g_get_user_data_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserName_ = _import "g_get_user_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserRuntimeDir_ = _import "g_get_user_runtime_dir" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUserSpecialDir_ = _import "g_get_user_special_dir" : GLibUserDirectory.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getenv_ = _import "mlton_g_getenv" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val hostnameIsAsciiEncoded_ = _import "mlton_g_hostname_is_ascii_encoded" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val hostnameIsIpAddress_ = _import "mlton_g_hostname_is_ip_address" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val hostnameIsNonAscii_ = _import "mlton_g_hostname_is_non_ascii" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val hostnameToAscii_ = _import "mlton_g_hostname_to_ascii" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val hostnameToUnicode_ = _import "mlton_g_hostname_to_unicode" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val idleSourceNew_ = _import "g_idle_source_new" : unit -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val ioCreateWatch_ = fn x1 & x2 => (_import "g_io_create_watch" : GLibIOChannelRecord.FFI.notnull GLibIOChannelRecord.FFI.p * GLibIOCondition.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;) (x1, x2)
    val listenv_ = _import "g_listenv" : unit -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val logRemoveHandler_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_remove_handler" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val logSetAlwaysFatal_ = _import "g_log_set_always_fatal" : GLibLogLevelFlags.FFI.val_ -> GLibLogLevelFlags.FFI.val_;
    val logSetFatalMask_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_set_fatal_mask" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               -> GLibLogLevelFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mainCurrentSource_ = _import "g_main_current_source" : unit -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val mainDepth_ = _import "g_main_depth" : unit -> GInt.FFI.val_;
    val markupEscapeText_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_markup_escape_text" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GSSize.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val mkdirWithParents_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_mkdir_with_parents" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mkdtemp_ = _import "mlton_g_mkdtemp" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val mkdtempFull_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_mkdtemp_full" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val mkstemp_ = _import "mlton_g_mkstemp" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GInt.FFI.val_;
    val mkstempFull_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_mkstemp_full" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val onErrorQuery_ = _import "mlton_g_on_error_query" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val onErrorStackTrace_ = _import "mlton_g_on_error_stack_trace" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val parseDebugString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_parse_debug_string" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GLibDebugKeyRecordCVectorN.MLton.p1
               * GLibDebugKeyRecordCVectorN.FFI.notnull GLibDebugKeyRecordCVectorN.MLton.p2
               * GUInt.FFI.val_
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val pathGetBasename_ = _import "mlton_g_path_get_basename" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val pathGetDirname_ = _import "mlton_g_path_get_dirname" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val pathIsAbsolute_ = _import "mlton_g_path_is_absolute" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GBool.FFI.val_;
    val pathSkipRoot_ = _import "mlton_g_path_skip_root" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val patternMatch_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_pattern_match" :
              GLibPatternSpecRecord.FFI.notnull GLibPatternSpecRecord.FFI.p
               * GUInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val patternMatchSimple_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_pattern_match_simple" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val patternMatchString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_pattern_match_string" :
              GLibPatternSpecRecord.FFI.notnull GLibPatternSpecRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val randomDouble_ = _import "g_random_double" : unit -> GDouble.FFI.val_;
    val randomDoubleRange_ = fn x1 & x2 => (_import "g_random_double_range" : GDouble.FFI.val_ * GDouble.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val randomInt_ = _import "g_random_int" : unit -> GUInt32.FFI.val_;
    val randomIntRange_ = fn x1 & x2 => (_import "g_random_int_range" : GInt32.FFI.val_ * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val randomSetSeed_ = _import "g_random_set_seed" : GUInt32.FFI.val_ -> unit;
    val reloadUserSpecialDirsCache_ = _import "g_reload_user_special_dirs_cache" : unit -> unit;
    val rmdir_ = _import "mlton_g_rmdir" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GInt.FFI.val_;
    val setApplicationName_ = _import "mlton_g_set_application_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val setPrgname_ = _import "mlton_g_set_prgname" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val setenv_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_setenv" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val shellParseArgv_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_shell_parse_argv" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.ref_
               * Utf8CVectorN.MLton.r1
               * (unit, Utf8CVectorN.FFI.notnull) Utf8CVectorN.MLton.r2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val shellQuote_ = _import "mlton_g_shell_quote" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val shellUnquote_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_shell_unquote" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val sliceGetConfig_ = _import "g_slice_get_config" : GLibSliceConfig.FFI.val_ -> GInt64.FFI.val_;
    val sliceSetConfig_ = fn x1 & x2 => (_import "g_slice_set_config" : GLibSliceConfig.FFI.val_ * GInt64.FFI.val_ -> unit;) (x1, x2)
    val spawnClosePid_ = _import "g_spawn_close_pid" : GLibPid.FFI.val_ -> unit;
    val spawnCommandLineAsync_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_spawn_command_line_async" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val spawnCommandLineSync_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8 =>
          (
            _import "mlton_g_spawn_command_line_sync" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt8CVector.MLton.r1
               * (unit, GUInt8CVector.FFI.notnull) GUInt8CVector.MLton.r2
               * GUInt8CVector.MLton.r1
               * (unit, GUInt8CVector.FFI.notnull) GUInt8CVector.MLton.r2
               * GInt.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val testBug_ = _import "mlton_g_test_bug" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val testBugBase_ = _import "mlton_g_test_bug_base" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val testFail_ = _import "g_test_fail" : unit -> unit;
    val testLogTypeName_ = _import "g_test_log_type_name" : GLibTestLogType.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val testRandDouble_ = _import "g_test_rand_double" : unit -> GDouble.FFI.val_;
    val testRandDoubleRange_ = fn x1 & x2 => (_import "g_test_rand_double_range" : GDouble.FFI.val_ * GDouble.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val testRandInt_ = _import "g_test_rand_int" : unit -> GInt32.FFI.val_;
    val testRandIntRange_ = fn x1 & x2 => (_import "g_test_rand_int_range" : GInt32.FFI.val_ * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val testRun_ = _import "g_test_run" : unit -> GInt.FFI.val_;
    val testRunSuite_ = _import "g_test_run_suite" : GLibTestSuiteRecord.FFI.notnull GLibTestSuiteRecord.FFI.p -> GInt.FFI.val_;
    val testTimerElapsed_ = _import "g_test_timer_elapsed" : unit -> GDouble.FFI.val_;
    val testTimerLast_ = _import "g_test_timer_last" : unit -> GDouble.FFI.val_;
    val testTimerStart_ = _import "g_test_timer_start" : unit -> unit;
    val testTrapAssertions_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & x8
         & (x9, x10) =>
          (
            _import "mlton_g_test_trap_assertions" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GUInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val testTrapFork_ = fn x1 & x2 => (_import "g_test_trap_fork" : GUInt64.FFI.val_ * GLibTestTrapFlags.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val testTrapHasPassed_ = _import "g_test_trap_has_passed" : unit -> GBool.FFI.val_;
    val testTrapReachedTimeout_ = _import "g_test_trap_reached_timeout" : unit -> GBool.FFI.val_;
    val timeoutSourceNew_ = _import "g_timeout_source_new" : GUInt.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val timeoutSourceNewSeconds_ = _import "g_timeout_source_new_seconds" : GUInt.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;
    val unlink_ = _import "mlton_g_unlink" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GInt.FFI.val_;
    val unsetenv_ = _import "mlton_g_unsetenv" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val uriEscapeString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_uri_escape_string" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val uriParseScheme_ = _import "mlton_g_uri_parse_scheme" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val uriUnescapeSegment_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_uri_unescape_segment" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val uriUnescapeString_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_uri_unescape_string" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val usleep_ = _import "g_usleep" : GULong.FFI.val_ -> unit;
    val variantGetType_ = _import "g_variant_get_type" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GLibVariantTypeRecord.FFI.notnull GLibVariantTypeRecord.FFI.p;
    val warnMessage_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_warn_message" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
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
    structure MainContextRecord = GLibMainContextRecord
    structure MarkupCollectType = GLibMarkupCollectType
    structure MarkupParseFlags = GLibMarkupParseFlags
    structure MatchInfoRecord = GLibMatchInfoRecord
    structure NormalizeMode = GLibNormalizeMode
    structure OnceStatus = GLibOnceStatus
    structure OptionArg = GLibOptionArg
    structure OptionEntryRecord = GLibOptionEntryRecord
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
    structure DebugKey = GLibDebugKey
    structure KeyFile = GLibKeyFile
    structure MainContext = GLibMainContext
    structure MatchInfo = GLibMatchInfo
    structure OptionEntry = GLibOptionEntry
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
    val LOG_LEVEL_USER_SHIFT = 8
    val MAJOR_VERSION = 2
    val MICRO_VERSION = 90
    val MINOR_VERSION = 29
    val PRIORITY_DEFAULT = 0
    val PRIORITY_DEFAULT_IDLE = 200
    val PRIORITY_HIGH = ~100
    val PRIORITY_HIGH_IDLE = 100
    val PRIORITY_LOW = 300
    val URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@"
    val URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;="
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
    fun parseDebugString (string, keys) =
      let
        val nkeys = LargeInt.fromInt (GLibDebugKeyRecordCVectorN.length keys)
        val retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> GLibDebugKeyRecordCVectorN.FFI.withPtr
             &&&> GUInt.FFI.withVal
             ---> GUInt.FFI.fromVal
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
    fun spawnCommandLineSync commandLine =
      let
        val standardOutput
         & standardError
         & exitStatus
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GUInt8CVector.FFI.withRefOptPtr
             &&&> GUInt8CVector.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CVector.FFI.fromPtr 1
                   && GUInt8CVector.FFI.fromPtr 1
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
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
        if retVal
        then
          SOME
            (
              standardOutput,
              standardError,
              exitStatus
            )
        else NONE
      end
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
