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
    val canonicalizeFilename_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_canonicalize_filename" :
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
            _import "g_child_watch_add_full" :
              GInt.FFI.val_
               * GLibPid.FFI.val_
               * GLibChildWatchFunc.FFI.non_opt GLibChildWatchFunc.FFI.dispatch_p
               * GLibChildWatchFunc.FFI.non_opt GLibChildWatchFunc.FFI.p
               * GLibChildWatchFunc.FFI.destroy_notify_p
               -> GUInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val childWatchSourceNew_ = _import "g_child_watch_source_new" : GLibPid.FFI.val_ -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
    val close_ = fn x1 & x2 => (_import "g_close" : GFileDesc.FFI.val_ * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
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
              GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              x6,
              x7,
              x8,
              x9,
              x10
            )
    val convertWithFallback_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & (x6, x7)
         & (x8, x9)
         & x10
         & x11
         & x12 =>
          (
            _import "mlton_g_convert_with_fallback" :
              GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSSize.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              x6,
              x7,
              x8,
              x9,
              x10,
              x11,
              x12
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
    val environSetenv_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_environ_setenv" :
              Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
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
    val environUnsetenv_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_environ_unsetenv" :
              Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val fileSetContentsFull_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "mlton_g_file_set_contents_full" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSSize.FFI.val_
               * GLibFileSetContentsFlags.FFI.val_
               * GInt.FFI.val_
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
               * (Utf8.FFI.opt, Utf8.FFI.opt) Utf8.MLton.r2
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
    val findProgramInPath_ = _import "mlton_g_find_program_in_path" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.opt Utf8.FFI.out_p;
    val formatSize_ = _import "g_format_size" : GUInt64.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val formatSizeForDisplay_ = _import "g_format_size_for_display" : GInt64.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val formatSizeFull_ = fn x1 & x2 => (_import "g_format_size_full" : GUInt64.FFI.val_ * GLibFormatSizeFlags.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val getApplicationName_ = _import "g_get_application_name" : unit -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getCodeset_ = _import "g_get_codeset" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getConsoleCharset_ = _import "mlton_g_get_console_charset" : Utf8.MLton.r1 * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2 -> GBool.FFI.val_;
    val getCurrentDir_ = _import "g_get_current_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getCurrentTime_ = _import "g_get_current_time" : GLibTimeValRecord.FFI.non_opt GLibTimeValRecord.FFI.p -> unit;
    val getEnviron_ = _import "g_get_environ" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getHomeDir_ = _import "g_get_home_dir" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getHostName_ = _import "g_get_host_name" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLanguageNames_ = _import "g_get_language_names" : unit -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getLanguageNamesWithCategory_ = _import "mlton_g_get_language_names_with_category" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getLocaleVariants_ = _import "mlton_g_get_locale_variants" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val getMonotonicTime_ = _import "g_get_monotonic_time" : unit -> GInt64.FFI.val_;
    val getNumProcessors_ = _import "g_get_num_processors" : unit -> GUInt.FFI.val_;
    val getOsInfo_ = _import "mlton_g_get_os_info" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getPrgname_ = _import "g_get_prgname" : unit -> Utf8.FFI.opt Utf8.FFI.out_p;
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
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.dispatch_p
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.destroy_notify_p
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
               * GLibIOFunc.FFI.non_opt GLibIOFunc.FFI.dispatch_p
               * GLibIOFunc.FFI.non_opt GLibIOFunc.FFI.p
               * GLibIOFunc.FFI.destroy_notify_p
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
    val localeToUtf8_ =
      fn
        (x1, x2)
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_locale_to_utf8" :
              GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
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
    val onErrorQuery_ = _import "mlton_g_on_error_query" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val onErrorStackTrace_ = _import "mlton_g_on_error_stack_trace" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
    val pathGetBasename_ = _import "mlton_g_path_get_basename" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val pathGetDirname_ = _import "mlton_g_path_get_dirname" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val pathIsAbsolute_ = _import "mlton_g_path_is_absolute" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val pathSkipRoot_ = _import "mlton_g_path_skip_root" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.opt Utf8.FFI.out_p;
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
    val quarkFromString_ = _import "mlton_g_quark_from_string" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GLibQuark.FFI.val_;
    val quarkToString_ = _import "g_quark_to_string" : GLibQuark.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val randomDouble_ = _import "g_random_double" : unit -> GDouble.FFI.val_;
    val randomDoubleRange_ = fn x1 & x2 => (_import "g_random_double_range" : GDouble.FFI.val_ * GDouble.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val randomInt_ = _import "g_random_int" : unit -> GUInt32.FFI.val_;
    val randomIntRange_ = fn x1 & x2 => (_import "g_random_int_range" : GInt32.FFI.val_ * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val randomSetSeed_ = _import "g_random_set_seed" : GUInt32.FFI.val_ -> unit;
    val refStringAcquire_ = _import "mlton_g_ref_string_acquire" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val refStringLength_ = _import "mlton_g_ref_string_length" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GSize.FFI.val_;
    val refStringNew_ = _import "mlton_g_ref_string_new" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val refStringNewIntern_ = _import "mlton_g_ref_string_new_intern" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val refStringNewLen_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_ref_string_new_len" :
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
    val refStringRelease_ = _import "mlton_g_ref_string_release" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
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
               * Utf8CPtrArray.MLton.r1
               * (Utf8CPtrArray.FFI.opt, Utf8CPtrArray.FFI.non_opt) Utf8CPtrArray.MLton.r2
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
               * GLibSpawnChildSetupFunc.FFI.opt GLibSpawnChildSetupFunc.FFI.dispatch_p
               * GLibSpawnChildSetupFunc.FFI.opt GLibSpawnChildSetupFunc.FFI.p
               * GLibPid.FFI.ref_
               * GFileDesc.FFI.ref_
               * GFileDesc.FFI.ref_
               * GFileDesc.FFI.ref_
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
    val testSetNonfatalAssertions_ = _import "g_test_set_nonfatal_assertions" : unit -> unit;
    val testSkip_ = _import "mlton_g_test_skip" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> unit;
    val testSubprocess_ = _import "g_test_subprocess" : unit -> GBool.FFI.val_;
    val testSummary_ = _import "mlton_g_test_summary" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> unit;
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
            _import "g_timeout_add_full" :
              GInt.FFI.val_
               * GUInt.FFI.val_
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.dispatch_p
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.destroy_notify_p
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
            _import "g_timeout_add_seconds_full" :
              GInt.FFI.val_
               * GUInt.FFI.val_
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.dispatch_p
               * GLibSourceFunc.FFI.non_opt GLibSourceFunc.FFI.p
               * GLibSourceFunc.FFI.destroy_notify_p
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
    val usleep_ = _import "g_usleep" : GULong.FFI.val_ -> unit;
    val uuidStringIsValid_ = _import "mlton_g_uuid_string_is_valid" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GBool.FFI.val_;
    val uuidStringRandom_ = _import "g_uuid_string_random" : unit -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val variantGetGtype_ = _import "g_variant_get_gtype" : unit -> GObjectType.FFI.val_;
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
