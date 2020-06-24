structure GLib : G_LIB =
  struct
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val base64Decode_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_base64_decode" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSize.FFI.ref_
               -> GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.FFI.out_p;
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
              GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val buildFilenamev_ = _import "mlton_g_build_filenamev" : Utf8CPtrArray.MLton.p1 * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val buildPathv_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_build_pathv" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val chdir_ = _import "mlton_g_chdir" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GInt.FFI.val_;
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
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val childWatchAdd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_child_watch_add" :
              GInt.FFI.val_
               * GLibPid.FFI.val_
               * GLibChildWatchFunc.FFI.non_opt GLibChildWatchFunc.FFI.p
               * GLibChildWatchFunc.FFI.callback
               * GLibChildWatchFunc.FFI.non_opt GLibChildWatchFunc.FFI.p
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val childWatchSourceNew_ = fn x1 & x2 => (_import "giraffe_g_child_watch_source_new" : GLibPid.FFI.val_ * GLibChildWatchFunc.FFI.callback -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;) (x1, x2)
    val close_ = fn x1 & x2 => (_import "g_close" : FileDesc.FFI.val_ * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val computeChecksumForBytes_ = fn x1 & x2 => (_import "g_compute_checksum_for_bytes" : GLibChecksumType.FFI.val_ * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val computeChecksumForData_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_compute_checksum_for_data" :
              GLibChecksumType.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val computeChecksumForString_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_compute_checksum_for_string" :
              GLibChecksumType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val computeHmacForBytes_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_compute_hmac_for_bytes" :
              GLibChecksumType.FFI.val_
               * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p
               * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val computeHmacForData_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_compute_hmac_for_data" :
              GLibChecksumType.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GULong.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val environGetenv_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_environ_getenv" :
              Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val filenameDisplayBasename_ = _import "mlton_g_filename_display_basename" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val filenameDisplayName_ = _import "mlton_g_filename_display_name" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val filenameFromUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_from_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val filenameFromUtf8_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_filename_from_utf8" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val filenameToUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_to_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val filenameToUtf8_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_filename_to_utf8" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val findProgramInPath_ = _import "mlton_g_find_program_in_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val formatSize_ = _import "g_format_size" : GUInt64.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val formatSizeForDisplay_ = _import "g_format_size_for_display" : GInt64.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val formatSizeFull_ = fn x1 & x2 => (_import "g_format_size_full" : GUInt64.FFI.val_ * GLibFormatSizeFlags.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getApplicationName_ = _import "g_get_application_name" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCodeset_ = _import "g_get_codeset" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrentDir_ = _import "g_get_current_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrentTime_ = _import "g_get_current_time" : GLibTimeValRecord.FFI.non_opt GLibTimeValRecord.FFI.p -> unit;
    val getEnviron_ = _import "g_get_environ" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getHomeDir_ = _import "g_get_home_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getHostName_ = _import "g_get_host_name" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLanguageNames_ = _import "g_get_language_names" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getLocaleVariants_ = _import "mlton_g_get_locale_variants" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getMonotonicTime_ = _import "g_get_monotonic_time" : unit -> GInt64.FFI.val_;
    val getNumProcessors_ = _import "g_get_num_processors" : unit -> GUInt.FFI.val_;
    val getPrgname_ = _import "g_get_prgname" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getRealName_ = _import "g_get_real_name" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getRealTime_ = _import "g_get_real_time" : unit -> GInt64.FFI.val_;
    val getSystemConfigDirs_ = _import "g_get_system_config_dirs" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getSystemDataDirs_ = _import "g_get_system_data_dirs" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getTmpDir_ = _import "g_get_tmp_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUserCacheDir_ = _import "g_get_user_cache_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUserConfigDir_ = _import "g_get_user_config_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUserDataDir_ = _import "g_get_user_data_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUserName_ = _import "g_get_user_name" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUserRuntimeDir_ = _import "g_get_user_runtime_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUserSpecialDir_ = _import "g_get_user_special_dir" : GLibUserDirectory.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getenv_ = _import "mlton_g_getenv" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val hostnameIsAsciiEncoded_ = _import "mlton_g_hostname_is_ascii_encoded" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val hostnameIsIpAddress_ = _import "mlton_g_hostname_is_ip_address" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val hostnameIsNonAscii_ = _import "mlton_g_hostname_is_non_ascii" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val hostnameToAscii_ = _import "mlton_g_hostname_to_ascii" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val hostnameToUnicode_ = _import "mlton_g_hostname_to_unicode" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val idleSourceNew_ = _import "g_idle_source_new" : unit -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
    val idleAdd_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_idle_add_full" :
              GInt.FFI.val_
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.callback
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val ioAddWatch_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "g_io_add_watch_full" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GInt.FFI.val_
               * GLibIOCondition.FFI.val_
               * GLibIOFunc.FFI.non_opt GLibIOFunc.FFI.p
               * GLibIOFunc.FFI.callback
               * GLibIOFunc.FFI.non_opt GLibIOFunc.FFI.p
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val ioCreateWatch_ = fn x1 & x2 => (_import "g_io_create_watch" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GLibIOCondition.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;) (x1, x2)
    val listenv_ = _import "g_listenv" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val localeFromUtf8_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_locale_from_utf8" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val localeToUtf8_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_locale_to_utf8" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val log_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_log" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val logRemoveHandler_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_remove_handler" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               -> GLibLogLevelFlags.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val logVariant_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_log_variant" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               * GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val logWriterIsJournald_ = _import "g_log_writer_is_journald" : GInt.FFI.val_ -> GBool.FFI.val_;
    val logWriterSupportsColor_ = _import "g_log_writer_supports_color" : GInt.FFI.val_ -> GBool.FFI.val_;
    val mainCurrentSource_ = _import "g_main_current_source" : unit -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
    val mainDepth_ = _import "g_main_depth" : unit -> GInt.FFI.val_;
    val markupEscapeText_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_markup_escape_text" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GSSize.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mkdtemp_ = _import "mlton_g_mkdtemp" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.opt Utf8.FFI.out_p;
    val mkdtempFull_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_mkdtemp_full" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> Utf8.FFI.opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val mkstemp_ = _import "mlton_g_mkstemp" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GInt.FFI.val_;
    val mkstempFull_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_mkstemp_full" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val onErrorQuery_ = _import "mlton_g_on_error_query" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val onErrorStackTrace_ = _import "mlton_g_on_error_stack_trace" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val parseDebugString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_parse_debug_string" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GLibDebugKeyRecordCArrayN.MLton.p1
               * GLibDebugKeyRecordCArrayN.FFI.non_opt GLibDebugKeyRecordCArrayN.MLton.p2
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
    val pathGetBasename_ = _import "mlton_g_path_get_basename" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val pathGetDirname_ = _import "mlton_g_path_get_dirname" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val pathIsAbsolute_ = _import "mlton_g_path_is_absolute" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val pathSkipRoot_ = _import "mlton_g_path_skip_root" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.opt Utf8.FFI.out_p;
    val patternMatch_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_pattern_match" :
              GLibPatternSpecRecord.FFI.non_opt GLibPatternSpecRecord.FFI.p
               * GUInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GLibPatternSpecRecord.FFI.non_opt GLibPatternSpecRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val rmdir_ = _import "mlton_g_rmdir" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GInt.FFI.val_;
    val setApplicationName_ = _import "mlton_g_set_application_name" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val setPrgname_ = _import "mlton_g_set_prgname" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val setenv_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_setenv" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.ref_
               * Utf8CPtrArrayN.MLton.r1
               * (Utf8CPtrArrayN.FFI.opt, Utf8CPtrArrayN.FFI.non_opt) Utf8CPtrArrayN.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    val shellQuote_ = _import "mlton_g_shell_quote" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val shellUnquote_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_shell_unquote" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val sliceGetConfig_ = _import "g_slice_get_config" : GLibSliceConfig.FFI.val_ -> GInt64.FFI.val_;
    val sliceSetConfig_ = fn x1 & x2 => (_import "g_slice_set_config" : GLibSliceConfig.FFI.val_ * GInt64.FFI.val_ -> unit;) (x1, x2)
    val spawnAsyncWithPipes_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10
         & x11
         & x12
         & x13
         & x14 =>
          (
            _import "mlton_g_spawn_async_with_pipes" :
              Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.MLton.p2
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               * GLibSpawnFlags.FFI.val_
               * GLibSpawnChildSetupFunc.FFI.non_opt GLibSpawnChildSetupFunc.FFI.p
               * GLibSpawnChildSetupFunc.FFI.callback
               * GLibPid.FFI.ref_
               * FileDesc.FFI.ref_
               * FileDesc.FFI.ref_
               * FileDesc.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> bool;
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
              x14
            )
    val spawnCheckExitStatus_ = fn x1 & x2 => (_import "g_spawn_check_exit_status" : GInt.FFI.val_ * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val spawnClosePid_ = _import "g_spawn_close_pid" : GLibPid.FFI.val_ -> unit;
    val spawnCommandLineAsync_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_spawn_command_line_async" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt8CArray.MLton.r1
               * (GUInt8CArray.FFI.opt, GUInt8CArray.FFI.non_opt) GUInt8CArray.MLton.r2
               * GUInt8CArray.MLton.r1
               * (GUInt8CArray.FFI.opt, GUInt8CArray.FFI.non_opt) GUInt8CArray.MLton.r2
               * GInt.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    val testAssertExpectedMessagesInternal_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7) =>
          (
            _import "mlton_g_test_assert_expected_messages_internal" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
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
    val testBug_ = _import "mlton_g_test_bug" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val testBugBase_ = _import "mlton_g_test_bug_base" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val testExpectMessage_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_test_expect_message" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GLibLogLevelFlags.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val testFail_ = _import "g_test_fail" : unit -> unit;
    val testFailed_ = _import "g_test_failed" : unit -> GBool.FFI.val_;
    val testGetDir_ = _import "g_test_get_dir" : GLibTestFileType.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val testIncomplete_ = _import "mlton_g_test_incomplete" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> unit;
    val testLogTypeName_ = _import "g_test_log_type_name" : GLibTestLogType.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val testRandDouble_ = _import "g_test_rand_double" : unit -> GDouble.FFI.val_;
    val testRandDoubleRange_ = fn x1 & x2 => (_import "g_test_rand_double_range" : GDouble.FFI.val_ * GDouble.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val testRandInt_ = _import "g_test_rand_int" : unit -> GInt32.FFI.val_;
    val testRandIntRange_ = fn x1 & x2 => (_import "g_test_rand_int_range" : GInt32.FFI.val_ * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val testRun_ = _import "g_test_run" : unit -> GInt.FFI.val_;
    val testRunSuite_ = _import "g_test_run_suite" : GLibTestSuiteRecord.FFI.non_opt GLibTestSuiteRecord.FFI.p -> GInt.FFI.val_;
    val testSetNonfatalAssertions_ = _import "g_test_set_nonfatal_assertions" : unit -> unit;
    val testSkip_ = _import "mlton_g_test_skip" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> unit;
    val testSubprocess_ = _import "g_test_subprocess" : unit -> GBool.FFI.val_;
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt64.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
    val testTrapSubprocess_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_test_trap_subprocess" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GUInt64.FFI.val_
               * GLibTestSubprocessFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val timeoutAdd_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_timeout_add" :
              GInt.FFI.val_
               * GUInt.FFI.val_
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.callback
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val timeoutAddSeconds_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_timeout_add_seconds" :
              GInt.FFI.val_
               * GUInt.FFI.val_
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.callback
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val timeoutSourceNew_ = _import "g_timeout_source_new" : GUInt.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
    val timeoutSourceNewSeconds_ = _import "g_timeout_source_new_seconds" : GUInt.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
    val unixFdSourceNew_ = fn x1 & x2 => (_import "g_unix_fd_source_new" : GInt.FFI.val_ * GLibIOCondition.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;) (x1, x2)
    val unixSetFdNonblocking_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_set_fd_nonblocking" :
              GInt.FFI.val_
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unixSignalSourceNew_ = _import "g_unix_signal_source_new" : GInt.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
    val unlink_ = _import "mlton_g_unlink" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GInt.FFI.val_;
    val unsetenv_ = _import "mlton_g_unsetenv" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val uriEscapeString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_uri_escape_string" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val uriListExtractUris_ = _import "mlton_g_uri_list_extract_uris" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val uriParseScheme_ = _import "mlton_g_uri_parse_scheme" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val uriUnescapeSegment_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_uri_unescape_segment" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
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
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val usleep_ = _import "g_usleep" : GULong.FFI.val_ -> unit;
    val variantGetGtype_ = _import "g_variant_get_gtype" : unit -> GObjectType.FFI.val_;
    structure PidType = GLibPidType
    structure SourceFunc = GLibSourceFunc
    structure SpawnChildSetupFunc = GLibSpawnChildSetupFunc
    structure DateDay = GLibDateDay
    structure DateYear = GLibDateYear
    structure Quark = GLibQuark
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
    structure IOFunc = GLibIOFunc
    structure Pid = GLibPid
    structure Bytes = GLibBytes
    structure Checksum = GLibChecksum
    structure Date = GLibDate
    structure DateTime = GLibDateTime
    structure DebugKey = GLibDebugKey
    structure ErrorRecord = GLibErrorRecord
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
    structure VariantRecordCPtrArrayN = GLibVariantRecordCPtrArrayN
    structure VariantBuilder = GLibVariantBuilder
    structure VariantDict = GLibVariantDict
    structure VariantTypeRecordCPtrArrayN = GLibVariantTypeRecordCPtrArrayN
    structure DebugKeyRecordCArrayN = GLibDebugKeyRecordCArrayN
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
    fun base64Decode text =
      let
        val outLen & retVal = (Utf8.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1) base64Decode_ (text & GSize.null)
      in
        retVal outLen
      end
    fun base64Encode data =
      let
        val len = GUInt8CArrayN.length data
        val retVal = (GUInt8CArrayN.FFI.withPtr &&&> GSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) base64Encode_ (data & len)
      in
        retVal
      end
    fun buildFilenamev args = (Utf8CPtrArray.FFI.withPtr ---> Utf8.FFI.fromPtr 1) buildFilenamev_ args
    fun buildPathv (separator, args) = (Utf8.FFI.withPtr &&&> Utf8CPtrArray.FFI.withPtr ---> Utf8.FFI.fromPtr 1) buildPathv_ (separator & args)
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
    fun childWatchAdd (priority, pid, function) =
      (
        GInt.FFI.withVal
         &&&> GLibPid.FFI.withVal
         &&&> GLibChildWatchFunc.FFI.withPtrToDispatch
         &&&> GLibChildWatchFunc.FFI.withCallback
         &&&> GLibChildWatchFunc.FFI.withPtrToDestroy
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
    fun childWatchSourceNew (pid, function) = (GLibPid.FFI.withVal &&&> GLibChildWatchFunc.FFI.withCallback ---> GLibSourceRecord.FFI.fromPtr true) childWatchSourceNew_ (pid & function)
    fun close fd = (FileDesc.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore) close_ (fd & [])
    fun computeChecksumForBytes (checksumType, data) = (GLibChecksumType.FFI.withVal &&&> GLibBytesRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) computeChecksumForBytes_ (checksumType & data)
    fun computeChecksumForData (checksumType, data) =
      let
        val length = GUInt8CArrayN.length data
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
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
         &&&> GSSize.FFI.withVal
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
        val keyLen = GUInt8CArrayN.length key
        val length = GUInt8CArrayN.length data
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
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
        val keyLen = GUInt8CArrayN.length key
        val retVal =
          (
            GLibChecksumType.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
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
    fun dgettext (domain, msgid) = (Utf8.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) dgettext_ (domain & msgid)
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
        Utf8.FFI.withOptPtr
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
    fun environGetenv (envp, variable) = (Utf8CPtrArray.FFI.withOptPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) environGetenv_ (envp & variable)
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
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && GUInt8CArrayN.FFI.fromPtr 1
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
        (retVal bytesWritten, bytesRead)
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
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
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
    fun findProgramInPath program = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) findProgramInPath_ program
    fun formatSize size = (GUInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSize_ size
    fun formatSizeForDisplay size = (GInt64.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSizeForDisplay_ size
    fun formatSizeFull (size, flags) = (GUInt64.FFI.withVal &&&> GLibFormatSizeFlags.FFI.withVal ---> Utf8.FFI.fromPtr 1) formatSizeFull_ (size & flags)
    fun getApplicationName () = (I ---> Utf8.FFI.fromPtr 0) getApplicationName_ ()
    fun getCodeset () = (I ---> Utf8.FFI.fromPtr 1) getCodeset_ ()
    fun getCurrentDir () = (I ---> Utf8.FFI.fromPtr 1) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.FFI.withPtr ---> I) getCurrentTime_ result
    fun getEnviron () = (I ---> Utf8CPtrArray.FFI.fromPtr 2) getEnviron_ ()
    fun getHomeDir () = (I ---> Utf8.FFI.fromPtr 0) getHomeDir_ ()
    fun getHostName () = (I ---> Utf8.FFI.fromPtr 0) getHostName_ ()
    fun getLanguageNames () = (I ---> Utf8CPtrArray.FFI.fromPtr 0) getLanguageNames_ ()
    fun getLocaleVariants locale = (Utf8.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) getLocaleVariants_ locale
    fun getMonotonicTime () = (I ---> GInt64.FFI.fromVal) getMonotonicTime_ ()
    fun getNumProcessors () = (I ---> GUInt.FFI.fromVal) getNumProcessors_ ()
    fun getPrgname () = (I ---> Utf8.FFI.fromPtr 0) getPrgname_ ()
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
    fun getenv variable = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getenv_ variable
    fun hostnameIsAsciiEncoded hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) hostnameToUnicode_ hostname
    fun idleSourceNew () = (I ---> GLibSourceRecord.FFI.fromPtr true) idleSourceNew_ ()
    fun idleAdd (priority, function) =
      (
        GInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withPtrToDispatch
         &&&> GLibSourceFunc.FFI.withCallback
         &&&> GLibSourceFunc.FFI.withPtrToDestroy
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
        GLibIOChannelRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibIOCondition.FFI.withVal
         &&&> GLibIOFunc.FFI.withPtrToDispatch
         &&&> GLibIOFunc.FFI.withCallback
         &&&> GLibIOFunc.FFI.withPtrToDestroy
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
    fun ioCreateWatch (channel, condition) = (GLibIOChannelRecord.FFI.withPtr &&&> GLibIOCondition.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr true) ioCreateWatch_ (channel & condition)
    fun listenv () = (I ---> Utf8CPtrArray.FFI.fromPtr 2) listenv_ ()
    fun localeFromUtf8 (utf8string, len) =
      let
        val bytesRead
         & bytesWritten
         & retVal =
          (
            Utf8.FFI.withPtr
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
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
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && Utf8.FFI.fromPtr 1
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
        Utf8.FFI.withPtr
         &&&> GLibLogLevelFlags.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        log_
        (
          logDomain
           & logLevel
           & format
        )
    fun logRemoveHandler (logDomain, handlerId) = (Utf8.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
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
    fun logWriterIsJournald outputFd = (GInt.FFI.withVal ---> GBool.FFI.fromVal) logWriterIsJournald_ outputFd
    fun logWriterSupportsColor outputFd = (GInt.FFI.withVal ---> GBool.FFI.fromVal) logWriterSupportsColor_ outputFd
    fun mainCurrentSource () = (I ---> GLibSourceRecord.FFI.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> GInt.FFI.fromVal) mainDepth_ ()
    fun markupEscapeText (text, length) = (Utf8.FFI.withPtr &&&> GSSize.FFI.withVal ---> Utf8.FFI.fromPtr 1) markupEscapeText_ (text & length)
    fun mkdirWithParents (pathname, mode) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) mkdirWithParents_ (pathname & mode)
    fun mkdtemp tmpl = (Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) mkdtemp_ tmpl
    fun mkdtempFull (tmpl, mode) = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromOptPtr 1) mkdtempFull_ (tmpl & mode)
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
        val nkeys = LargeInt.fromInt (GLibDebugKeyRecordCArrayN.length keys)
        val retVal =
          (
            Utf8.FFI.withOptPtr
             &&&> GLibDebugKeyRecordCArrayN.FFI.withPtr
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
         &&&> GUInt.FFI.withVal
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
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> Utf8CPtrArrayN.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal
                   && Utf8CPtrArrayN.FFI.fromPtr 2
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
        argvp (LargeInt.toInt argcp)
      end
    fun shellQuote unquotedString = (Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) shellQuote_ unquotedString
    fun shellUnquote quotedString = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> Utf8.FFI.fromPtr 1) shellUnquote_ (quotedString & [])
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
            Utf8.FFI.withOptPtr
             &&&> Utf8CPtrArray.FFI.withPtr
             &&&> Utf8CPtrArray.FFI.withOptPtr
             &&&> GLibSpawnFlags.FFI.withVal
             &&&> GLibSpawnChildSetupFunc.FFI.withPtrToDispatch
             &&&> GLibSpawnChildSetupFunc.FFI.withOptCallback
             &&&> GLibPid.FFI.withRefVal
             &&&> FileDesc.FFI.withRefVal
             &&&> FileDesc.FFI.withRefVal
             &&&> FileDesc.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GLibPid.FFI.fromVal
                   && FileDesc.FFI.fromVal
                   && FileDesc.FFI.fromVal
                   && FileDesc.FFI.fromVal
                   && ignore
          )
            spawnAsyncWithPipes_
            (
              workingDirectory
               & argv
               & envp
               & flags
               & ()
               & childSetup
               & GLibPid.null
               & FileDesc.null
               & FileDesc.null
               & FileDesc.null
               & [GLibSpawnError.handler]
            )
      in
        (childPid, standardInput, standardOutput, standardError)
      end
    fun spawnCheckExitStatus exitStatus = (GInt.FFI.withVal &&&> GLibErrorRecord.handleError ---> ignore) spawnCheckExitStatus_ (exitStatus & [])
    fun spawnClosePid pid = (GLibPid.FFI.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) spawnCommandLineAsync_ (commandLine & [])
    fun spawnCommandLineSync commandLine =
      let
        val standardOutput
         & standardError
         & exitStatus
         & () =
          (
            Utf8.FFI.withPtr
             &&&> GUInt8CArray.FFI.withRefOptPtr
             &&&> GUInt8CArray.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArray.FFI.fromPtr 1
                   && GUInt8CArray.FFI.fromPtr 1
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
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
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
    fun testRun () = (I ---> GInt.FFI.fromVal) testRun_ ()
    fun testRunSuite suite = (GLibTestSuiteRecord.FFI.withPtr ---> GInt.FFI.fromVal) testRunSuite_ suite
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
    fun timeoutAdd (priority, interval, function) =
      (
        GInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GLibSourceFunc.FFI.withPtrToDispatch
         &&&> GLibSourceFunc.FFI.withCallback
         &&&> GLibSourceFunc.FFI.withPtrToDestroy
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
         &&&> GLibSourceFunc.FFI.withPtrToDispatch
         &&&> GLibSourceFunc.FFI.withCallback
         &&&> GLibSourceFunc.FFI.withPtrToDestroy
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
    fun uriListExtractUris uriList = (Utf8.FFI.withPtr ---> Utf8CPtrArray.FFI.fromPtr 2) uriListExtractUris_ uriList
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
    fun usleep microseconds = (GULong.FFI.withVal ---> I) usleep_ microseconds
    fun variantGetGtype () = (I ---> GObjectType.FFI.fromVal) variantGetGtype_ ()
  end
