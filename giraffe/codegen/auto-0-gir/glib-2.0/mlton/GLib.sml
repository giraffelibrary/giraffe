structure GLib : G_LIB =
  struct
    val access_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_access" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val asciiDigitValue_ = _import "g_ascii_digit_value" : FFI.Char.C.val_ -> FFI.Int.C.val_;
    val asciiDtostr_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_ascii_dtostr" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * FFI.Double.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val asciiFormatd_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_ascii_formatd" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Double.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val asciiStrcasecmp_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_ascii_strcasecmp" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val asciiStrdown_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_ascii_strdown" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val asciiStrncasecmp_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_ascii_strncasecmp" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val asciiStrtod_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_ascii_strtod" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Double.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val asciiStrtoll_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_ascii_strtoll" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt.C.val_
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val asciiStrtoull_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_ascii_strtoull" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt.C.val_
               -> FFI.UInt64.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val asciiStrup_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_ascii_strup" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val asciiTolower_ = _import "g_ascii_tolower" : FFI.Char.C.val_ -> FFI.Char.C.val_;
    val asciiToupper_ = _import "g_ascii_toupper" : FFI.Char.C.val_ -> FFI.Char.C.val_;
    val asciiXdigitValue_ = _import "g_ascii_xdigit_value" : FFI.Char.C.val_ -> FFI.Int.C.val_;
    val assertWarning_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_assert_warning" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
    val basename_ = _import "mlton_g_basename" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val bitNthLsf_ = fn x1 & x2 => (_import "g_bit_nth_lsf" : FFI.ULong.C.val_ * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val bitNthMsf_ = fn x1 & x2 => (_import "g_bit_nth_msf" : FFI.ULong.C.val_ * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val bitStorage_ = _import "g_bit_storage" : FFI.ULong.C.val_ -> FFI.UInt.C.val_;
    val blowChunks_ = _import "g_blow_chunks" : unit -> unit;
    val bookmarkFileErrorQuark_ = _import "g_bookmark_file_error_quark" : unit -> GLibQuark.C.val_;
    val chdir_ = _import "mlton_g_chdir" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Int.C.val_;
    val checkVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "glib_check_version" :
              FFI.UInt.C.val_
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val checksumTypeGetLength_ = _import "g_checksum_type_get_length" : GLibChecksumType.C.val_ -> FFI.SSize.C.val_;
    val childWatchSourceNew_ = _import "g_child_watch_source_new" : GLibPid.C.val_ -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val clearError_ = _import "g_clear_error" : (unit, unit) GLibErrorRecord.C.r -> unit;
    val computeChecksumForString_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_compute_checksum_for_string" :
              GLibChecksumType.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.ref_
               * FFI.Size.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
    val convertErrorQuark_ = _import "g_convert_error_quark" : unit -> GLibQuark.C.val_;
    val datalistClear_ = _import "g_datalist_clear" : GLibDataRecord.C.notnull GLibDataRecord.C.p -> unit;
    val datalistGetFlags_ = _import "g_datalist_get_flags" : GLibDataRecord.C.notnull GLibDataRecord.C.p -> FFI.UInt.C.val_;
    val datalistInit_ = _import "g_datalist_init" : GLibDataRecord.C.notnull GLibDataRecord.C.p -> unit;
    val datalistSetFlags_ = fn x1 & x2 => (_import "g_datalist_set_flags" : GLibDataRecord.C.notnull GLibDataRecord.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val datalistUnsetFlags_ = fn x1 & x2 => (_import "g_datalist_unset_flags" : GLibDataRecord.C.notnull GLibDataRecord.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val dateGetDaysInMonth_ = fn x1 & x2 => (_import "g_date_get_days_in_month" : GLibDateMonth.C.val_ * GLibDateYear.C.val_ -> FFI.UInt8.C.val_;) (x1, x2)
    val dateGetMondayWeeksInYear_ = _import "g_date_get_monday_weeks_in_year" : GLibDateYear.C.val_ -> FFI.UInt8.C.val_;
    val dateGetSundayWeeksInYear_ = _import "g_date_get_sunday_weeks_in_year" : GLibDateYear.C.val_ -> FFI.UInt8.C.val_;
    val dateIsLeapYear_ = _import "g_date_is_leap_year" : GLibDateYear.C.val_ -> FFI.Bool.C.val_;
    val dateStrftime_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_date_strftime" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GLibDateRecord.C.notnull GLibDateRecord.C.p
               -> FFI.Size.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val dateValidDay_ = _import "g_date_valid_day" : GLibDateDay.C.val_ -> FFI.Bool.C.val_;
    val dateValidDmy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_date_valid_dmy" :
              GLibDateDay.C.val_
               * GLibDateMonth.C.val_
               * GLibDateYear.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val dateValidJulian_ = _import "g_date_valid_julian" : FFI.UInt32.C.val_ -> FFI.Bool.C.val_;
    val dateValidMonth_ = _import "g_date_valid_month" : GLibDateMonth.C.val_ -> FFI.Bool.C.val_;
    val dateValidWeekday_ = _import "g_date_valid_weekday" : GLibDateWeekday.C.val_ -> FFI.Bool.C.val_;
    val dateValidYear_ = _import "g_date_valid_year" : GLibDateYear.C.val_ -> FFI.Bool.C.val_;
    val dcgettext_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_dcgettext" :
              GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dirMakeTmp_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_dir_make_tmp" :
              GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val dngettext_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_g_dngettext" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.ULong.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val dummyDecl_ = _import "glib_dummy_decl" : unit -> unit;
    val fileErrorFromErrno_ = _import "g_file_error_from_errno" : FFI.Int.C.val_ -> GLibFileError.C.val_;
    val fileErrorQuark_ = _import "g_file_error_quark" : unit -> GLibQuark.C.val_;
    val fileOpenTmp_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_file_open_tmp" :
              GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val fileReadLink_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_file_read_link" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val fileTest_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_file_test" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GLibFileTest.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val filenameDisplayBasename_ = _import "mlton_g_filename_display_basename" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val filenameDisplayName_ = _import "mlton_g_filename_display_name" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val filenameFromUri_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_filename_from_uri" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val findProgramInPath_ = _import "mlton_g_find_program_in_path" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val formatSize_ = _import "g_format_size" : FFI.UInt64.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val formatSizeForDisplay_ = _import "g_format_size_for_display" : FFI.Int64.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val formatSizeFull_ = fn x1 & x2 => (_import "g_format_size_full" : FFI.UInt64.C.val_ * GLibFormatSizeFlags.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val getApplicationName_ = _import "g_get_application_name" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getCharset_ = _import "mlton_g_get_charset" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val getCurrentDir_ = _import "g_get_current_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getCurrentTime_ = _import "g_get_current_time" : GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p -> unit;
    val getFilenameCharsets_ = _import "mlton_g_get_filename_charsets" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val getHomeDir_ = _import "g_get_home_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getHostName_ = _import "g_get_host_name" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getMonotonicTime_ = _import "g_get_monotonic_time" : unit -> FFI.Int64.C.val_;
    val getPrgname_ = _import "g_get_prgname" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getRealName_ = _import "g_get_real_name" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getRealTime_ = _import "g_get_real_time" : unit -> FFI.Int64.C.val_;
    val getTmpDir_ = _import "g_get_tmp_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUserCacheDir_ = _import "g_get_user_cache_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUserConfigDir_ = _import "g_get_user_config_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUserDataDir_ = _import "g_get_user_data_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUserName_ = _import "g_get_user_name" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUserRuntimeDir_ = _import "g_get_user_runtime_dir" : unit -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUserSpecialDir_ = _import "g_get_user_special_dir" : GLibUserDirectory.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val getenv_ = _import "mlton_g_getenv" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val hookDestroy_ = fn x1 & x2 => (_import "g_hook_destroy" : GLibHookListRecord.C.notnull GLibHookListRecord.C.p * FFI.ULong.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val hookDestroyLink_ = fn x1 & x2 => (_import "g_hook_destroy_link" : GLibHookListRecord.C.notnull GLibHookListRecord.C.p * GLibHookRecord.C.notnull GLibHookRecord.C.p -> unit;) (x1, x2)
    val hookFree_ = fn x1 & x2 => (_import "g_hook_free" : GLibHookListRecord.C.notnull GLibHookListRecord.C.p * GLibHookRecord.C.notnull GLibHookRecord.C.p -> unit;) (x1, x2)
    val hookInsertBefore_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_hook_insert_before" :
              GLibHookListRecord.C.notnull GLibHookListRecord.C.p
               * GLibHookRecord.C.notnull GLibHookRecord.C.p
               * GLibHookRecord.C.notnull GLibHookRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val hookPrepend_ = fn x1 & x2 => (_import "g_hook_prepend" : GLibHookListRecord.C.notnull GLibHookListRecord.C.p * GLibHookRecord.C.notnull GLibHookRecord.C.p -> unit;) (x1, x2)
    val hookUnref_ = fn x1 & x2 => (_import "g_hook_unref" : GLibHookListRecord.C.notnull GLibHookListRecord.C.p * GLibHookRecord.C.notnull GLibHookRecord.C.p -> unit;) (x1, x2)
    val hostnameIsAsciiEncoded_ = _import "mlton_g_hostname_is_ascii_encoded" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val hostnameIsIpAddress_ = _import "mlton_g_hostname_is_ip_address" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val hostnameIsNonAscii_ = _import "mlton_g_hostname_is_non_ascii" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val hostnameToAscii_ = _import "mlton_g_hostname_to_ascii" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val hostnameToUnicode_ = _import "mlton_g_hostname_to_unicode" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val idleSourceNew_ = _import "g_idle_source_new" : unit -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val internStaticString_ = _import "mlton_g_intern_static_string" : GCharVec.MLton.p1 * unit GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val internString_ = _import "mlton_g_intern_string" : GCharVec.MLton.p1 * unit GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val ioChannelErrorFromErrno_ = _import "g_io_channel_error_from_errno" : FFI.Int.C.val_ -> GLibIOChannelError.C.val_;
    val ioChannelErrorQuark_ = _import "g_io_channel_error_quark" : unit -> GLibQuark.C.val_;
    val ioCreateWatch_ = fn x1 & x2 => (_import "g_io_create_watch" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * GLibIOCondition.C.val_ -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;) (x1, x2)
    val keyFileErrorQuark_ = _import "g_key_file_error_quark" : unit -> GLibQuark.C.val_;
    val listPopAllocator_ = _import "g_list_pop_allocator" : unit -> unit;
    val logRemoveHandler_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_remove_handler" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val logSetAlwaysFatal_ = _import "g_log_set_always_fatal" : GLibLogLevelFlags.C.val_ -> GLibLogLevelFlags.C.val_;
    val logSetFatalMask_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_log_set_fatal_mask" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GLibLogLevelFlags.C.val_
               -> GLibLogLevelFlags.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mainContextDefault_ = _import "g_main_context_default" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val mainContextGetThreadDefault_ = _import "g_main_context_get_thread_default" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val mainCurrentSource_ = _import "g_main_current_source" : unit -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val mainDepth_ = _import "g_main_depth" : unit -> FFI.Int.C.val_;
    val markupErrorQuark_ = _import "g_markup_error_quark" : unit -> GLibQuark.C.val_;
    val markupEscapeText_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_markup_escape_text" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val memChunkInfo_ = _import "g_mem_chunk_info" : unit -> unit;
    val memIsSystemMalloc_ = _import "g_mem_is_system_malloc" : unit -> FFI.Bool.C.val_;
    val memProfile_ = _import "g_mem_profile" : unit -> unit;
    val memSetVtable_ = _import "g_mem_set_vtable" : GLibMemVTableRecord.C.notnull GLibMemVTableRecord.C.p -> unit;
    val mkdirWithParents_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_mkdir_with_parents" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val mkdtemp_ = _import "mlton_g_mkdtemp" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val mkdtempFull_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_mkdtemp_full" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val mkstemp_ = _import "mlton_g_mkstemp" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Int.C.val_;
    val mkstempFull_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_mkstemp_full" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val nodePopAllocator_ = _import "g_node_pop_allocator" : unit -> unit;
    val onErrorQuery_ = _import "mlton_g_on_error_query" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val onErrorStackTrace_ = _import "mlton_g_on_error_stack_trace" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val optionErrorQuark_ = _import "g_option_error_quark" : unit -> GLibQuark.C.val_;
    val pathGetBasename_ = _import "mlton_g_path_get_basename" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val pathGetDirname_ = _import "mlton_g_path_get_dirname" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val pathIsAbsolute_ = _import "mlton_g_path_is_absolute" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val pathSkipRoot_ = _import "mlton_g_path_skip_root" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val patternMatch_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_pattern_match" :
              GLibPatternSpecRecord.C.notnull GLibPatternSpecRecord.C.p
               * FFI.UInt.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
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
              GLibPatternSpecRecord.C.notnull GLibPatternSpecRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val poll_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_poll" :
              GLibPollFDRecord.C.notnull GLibPollFDRecord.C.p
               * FFI.UInt.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val quarkFromStaticString_ = _import "mlton_g_quark_from_static_string" : GCharVec.MLton.p1 * unit GCharVec.MLton.p2 -> GLibQuark.C.val_;
    val quarkFromString_ = _import "mlton_g_quark_from_string" : GCharVec.MLton.p1 * unit GCharVec.MLton.p2 -> GLibQuark.C.val_;
    val quarkToString_ = _import "g_quark_to_string" : GLibQuark.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val quarkTryString_ = _import "mlton_g_quark_try_string" : GCharVec.MLton.p1 * unit GCharVec.MLton.p2 -> GLibQuark.C.val_;
    val randomDouble_ = _import "g_random_double" : unit -> FFI.Double.C.val_;
    val randomDoubleRange_ = fn x1 & x2 => (_import "g_random_double_range" : FFI.Double.C.val_ * FFI.Double.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val randomInt_ = _import "g_random_int" : unit -> FFI.UInt32.C.val_;
    val randomIntRange_ = fn x1 & x2 => (_import "g_random_int_range" : FFI.Int32.C.val_ * FFI.Int32.C.val_ -> FFI.Int32.C.val_;) (x1, x2)
    val randomSetSeed_ = _import "g_random_set_seed" : FFI.UInt32.C.val_ -> unit;
    val regexCheckReplacement_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_regex_check_replacement" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Bool.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val regexErrorQuark_ = _import "g_regex_error_quark" : unit -> GLibQuark.C.val_;
    val regexEscapeNul_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_regex_escape_nul" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val regexMatchSimple_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_regex_match_simple" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GLibRegexCompileFlags.C.val_
               * GLibRegexMatchFlags.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val reloadUserSpecialDirsCache_ = _import "g_reload_user_special_dirs_cache" : unit -> unit;
    val returnIfFailWarning_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_return_if_fail_warning" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val rmdir_ = _import "mlton_g_rmdir" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Int.C.val_;
    val sequenceMove_ = fn x1 & x2 => (_import "g_sequence_move" : GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p * GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p -> unit;) (x1, x2)
    val sequenceMoveRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_sequence_move_range" :
              GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p
               * GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p
               * GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val sequenceRemove_ = _import "g_sequence_remove" : GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p -> unit;
    val sequenceRemoveRange_ = fn x1 & x2 => (_import "g_sequence_remove_range" : GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p * GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p -> unit;) (x1, x2)
    val sequenceSwap_ = fn x1 & x2 => (_import "g_sequence_swap" : GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p * GLibSequenceIterRecord.C.notnull GLibSequenceIterRecord.C.p -> unit;) (x1, x2)
    val setApplicationName_ = _import "mlton_g_set_application_name" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val setPrgname_ = _import "mlton_g_set_prgname" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val setenv_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_setenv" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val shellErrorQuark_ = _import "g_shell_error_quark" : unit -> GLibQuark.C.val_;
    val shellQuote_ = _import "mlton_g_shell_quote" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val shellUnquote_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_shell_unquote" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val sliceGetConfig_ = _import "g_slice_get_config" : GLibSliceConfig.C.val_ -> FFI.Int64.C.val_;
    val sliceSetConfig_ = fn x1 & x2 => (_import "g_slice_set_config" : GLibSliceConfig.C.val_ * FFI.Int64.C.val_ -> unit;) (x1, x2)
    val sourceRemove_ = _import "g_source_remove" : FFI.UInt.C.val_ -> FFI.Bool.C.val_;
    val sourceSetNameById_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_source_set_name_by_id" :
              FFI.UInt.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val spacedPrimesClosest_ = _import "g_spaced_primes_closest" : FFI.UInt.C.val_ -> FFI.UInt.C.val_;
    val spawnClosePid_ = _import "g_spawn_close_pid" : GLibPid.C.val_ -> unit;
    val spawnCommandLineAsync_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_spawn_command_line_async" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val spawnErrorQuark_ = _import "g_spawn_error_quark" : unit -> GLibQuark.C.val_;
    val stpcpy_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_stpcpy" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strHasPrefix_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_str_has_prefix" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strHasSuffix_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_str_has_suffix" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strcanon_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_strcanon" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Char.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strcasecmp_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strcasecmp" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strchomp_ = _import "mlton_g_strchomp" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strchug_ = _import "mlton_g_strchug" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strcmp0_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strcmp0" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strcompress_ = _import "mlton_g_strcompress" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strdelimit_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_strdelimit" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Char.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strdown_ = _import "mlton_g_strdown" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strdup_ = _import "mlton_g_strdup" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strerror_ = _import "g_strerror" : FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val strescape_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strescape" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strfreev_ = _import "mlton_g_strfreev" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val stringNew_ = _import "mlton_g_string_new" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GLibStringRecord.C.notnull GLibStringRecord.C.p;
    val stringNewLen_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_string_new_len" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> GLibStringRecord.C.notnull GLibStringRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val stringSizedNew_ = _import "g_string_sized_new" : FFI.Size.C.val_ -> GLibStringRecord.C.notnull GLibStringRecord.C.p;
    val stripContext_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strip_context" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strjoinv_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strjoinv" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strlcat_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_strlcat" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               -> FFI.Size.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strlcpy_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_strlcpy" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               -> FFI.Size.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strncasecmp_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_strncasecmp" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strndup_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_strndup" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val strnfill_ = fn x1 & x2 => (_import "g_strnfill" : FFI.Size.C.val_ * FFI.Char.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;) (x1, x2)
    val strreverse_ = _import "mlton_g_strreverse" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strrstr_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strrstr" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strrstrLen_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_strrstr_len" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strsignal_ = _import "g_strsignal" : FFI.Int.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val strstrLen_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_strstr_len" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val strtod_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_strtod" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Double.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val strup_ = _import "mlton_g_strup" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val strvLength_ = _import "mlton_g_strv_length" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.UInt.C.val_;
    val testBug_ = _import "mlton_g_test_bug" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val testBugBase_ = _import "mlton_g_test_bug_base" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val testFail_ = _import "g_test_fail" : unit -> unit;
    val testLogTypeName_ = _import "g_test_log_type_name" : GLibTestLogType.C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val testRandDouble_ = _import "g_test_rand_double" : unit -> FFI.Double.C.val_;
    val testRandDoubleRange_ = fn x1 & x2 => (_import "g_test_rand_double_range" : FFI.Double.C.val_ * FFI.Double.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val testRandInt_ = _import "g_test_rand_int" : unit -> FFI.Int32.C.val_;
    val testRandIntRange_ = fn x1 & x2 => (_import "g_test_rand_int_range" : FFI.Int32.C.val_ * FFI.Int32.C.val_ -> FFI.Int32.C.val_;) (x1, x2)
    val testRun_ = _import "g_test_run" : unit -> FFI.Int.C.val_;
    val testRunSuite_ = _import "g_test_run_suite" : GLibTestSuiteRecord.C.notnull GLibTestSuiteRecord.C.p -> FFI.Int.C.val_;
    val testTimerElapsed_ = _import "g_test_timer_elapsed" : unit -> FFI.Double.C.val_;
    val testTimerLast_ = _import "g_test_timer_last" : unit -> FFI.Double.C.val_;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.UInt64.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
    val testTrapFork_ = fn x1 & x2 => (_import "g_test_trap_fork" : FFI.UInt64.C.val_ * GLibTestTrapFlags.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val testTrapHasPassed_ = _import "g_test_trap_has_passed" : unit -> FFI.Bool.C.val_;
    val testTrapReachedTimeout_ = _import "g_test_trap_reached_timeout" : unit -> FFI.Bool.C.val_;
    val threadErrorQuark_ = _import "g_thread_error_quark" : unit -> GLibQuark.C.val_;
    val threadGetInitialized_ = _import "g_thread_get_initialized" : unit -> FFI.Bool.C.val_;
    val threadInit_ = _import "g_thread_init" : GLibThreadFunctionsRecord.C.notnull GLibThreadFunctionsRecord.C.p -> unit;
    val threadInitWithErrorcheckMutexes_ = _import "g_thread_init_with_errorcheck_mutexes" : GLibThreadFunctionsRecord.C.notnull GLibThreadFunctionsRecord.C.p -> unit;
    val threadPoolGetMaxIdleTime_ = _import "g_thread_pool_get_max_idle_time" : unit -> FFI.UInt.C.val_;
    val threadPoolGetMaxUnusedThreads_ = _import "g_thread_pool_get_max_unused_threads" : unit -> FFI.Int.C.val_;
    val threadPoolGetNumUnusedThreads_ = _import "g_thread_pool_get_num_unused_threads" : unit -> FFI.UInt.C.val_;
    val threadPoolSetMaxIdleTime_ = _import "g_thread_pool_set_max_idle_time" : FFI.UInt.C.val_ -> unit;
    val threadPoolSetMaxUnusedThreads_ = _import "g_thread_pool_set_max_unused_threads" : FFI.Int.C.val_ -> unit;
    val threadPoolStopUnusedThreads_ = _import "g_thread_pool_stop_unused_threads" : unit -> unit;
    val timeValFromIso8601_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_time_val_from_iso8601" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GLibTimeValRecord.C.notnull GLibTimeValRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val timeoutSourceNew_ = _import "g_timeout_source_new" : FFI.UInt.C.val_ -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val timeoutSourceNewSeconds_ = _import "g_timeout_source_new_seconds" : FFI.UInt.C.val_ -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val trashStackHeight_ = _import "g_trash_stack_height" : GLibTrashStackRecord.C.notnull GLibTrashStackRecord.C.p -> FFI.UInt.C.val_;
    val unicharBreakType_ = _import "g_unichar_break_type" : FFI.Char.C.val_ -> GLibUnicodeBreakType.C.val_;
    val unicharCombiningClass_ = _import "g_unichar_combining_class" : FFI.Char.C.val_ -> FFI.Int.C.val_;
    val unicharDigitValue_ = _import "g_unichar_digit_value" : FFI.Char.C.val_ -> FFI.Int.C.val_;
    val unicharGetScript_ = _import "g_unichar_get_script" : FFI.Char.C.val_ -> GLibUnicodeScript.C.val_;
    val unicharIsalnum_ = _import "g_unichar_isalnum" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsalpha_ = _import "g_unichar_isalpha" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIscntrl_ = _import "g_unichar_iscntrl" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsdefined_ = _import "g_unichar_isdefined" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsdigit_ = _import "g_unichar_isdigit" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsgraph_ = _import "g_unichar_isgraph" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIslower_ = _import "g_unichar_islower" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsmark_ = _import "g_unichar_ismark" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsprint_ = _import "g_unichar_isprint" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIspunct_ = _import "g_unichar_ispunct" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsspace_ = _import "g_unichar_isspace" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIstitle_ = _import "g_unichar_istitle" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsupper_ = _import "g_unichar_isupper" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIswide_ = _import "g_unichar_iswide" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIswideCjk_ = _import "g_unichar_iswide_cjk" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIsxdigit_ = _import "g_unichar_isxdigit" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharIszerowidth_ = _import "g_unichar_iszerowidth" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharToUtf8_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_unichar_to_utf8" :
              FFI.Char.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unicharTolower_ = _import "g_unichar_tolower" : FFI.Char.C.val_ -> FFI.Char.C.val_;
    val unicharTotitle_ = _import "g_unichar_totitle" : FFI.Char.C.val_ -> FFI.Char.C.val_;
    val unicharToupper_ = _import "g_unichar_toupper" : FFI.Char.C.val_ -> FFI.Char.C.val_;
    val unicharType_ = _import "g_unichar_type" : FFI.Char.C.val_ -> GLibUnicodeType.C.val_;
    val unicharValidate_ = _import "g_unichar_validate" : FFI.Char.C.val_ -> FFI.Bool.C.val_;
    val unicharXdigitValue_ = _import "g_unichar_xdigit_value" : FFI.Char.C.val_ -> FFI.Int.C.val_;
    val unicodeScriptFromIso15924_ = _import "g_unicode_script_from_iso15924" : FFI.UInt32.C.val_ -> GLibUnicodeScript.C.val_;
    val unicodeScriptToIso15924_ = _import "g_unicode_script_to_iso15924" : GLibUnicodeScript.C.val_ -> FFI.UInt32.C.val_;
    val unlink_ = _import "mlton_g_unlink" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Int.C.val_;
    val unsetenv_ = _import "mlton_g_unsetenv" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> unit;
    val uriEscapeString_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_uri_escape_string" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Bool.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val uriParseScheme_ = _import "mlton_g_uri_parse_scheme" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val uriUnescapeSegment_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_uri_unescape_segment" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val usleep_ = _import "g_usleep" : FFI.ULong.C.val_ -> unit;
    val utf8Casefold_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_casefold" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8Collate_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_utf8_collate" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8CollateKey_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_collate_key" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8CollateKeyForFilename_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_collate_key_for_filename" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8FindNextChar_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_utf8_find_next_char" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8FindPrevChar_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_utf8_find_prev_char" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8GetChar_ = _import "mlton_g_utf8_get_char" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Char.C.val_;
    val utf8GetCharValidated_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_get_char_validated" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.Char.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8Normalize_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_utf8_normalize" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * GLibNormalizeMode.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8OffsetToPointer_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_offset_to_pointer" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Long.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8PointerToOffset_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_utf8_pointer_to_offset" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Long.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8PrevChar_ = _import "mlton_g_utf8_prev_char" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.String.C.notnull FFI.String.C.out_p;
    val utf8Strchr_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_utf8_strchr" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * FFI.Char.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8Strdown_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_strdown" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8Strlen_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_strlen" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.Long.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8Strncpy_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_utf8_strncpy" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Size.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val utf8Strrchr_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_utf8_strrchr" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * FFI.Char.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8Strreverse_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_strreverse" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8Strup_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_utf8_strup" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val utf8Substring_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_utf8_substring" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Long.C.val_
               * FFI.Long.C.val_
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val utf8Validate_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_utf8_validate" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.SSize.C.val_
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val variantGetType_ = _import "g_variant_get_type" : GLibVariantRecord.C.notnull GLibVariantRecord.C.p -> GLibVariantTypeRecord.C.notnull GLibVariantTypeRecord.C.p;
    val variantIsObjectPath_ = _import "mlton_g_variant_is_object_path" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val variantIsSignature_ = _import "mlton_g_variant_is_signature" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val variantParse_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_g_variant_parse" :
              GLibVariantTypeRecord.C.notnull GLibVariantTypeRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
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
    val variantParserGetErrorQuark_ = _import "g_variant_parser_get_error_quark" : unit -> GLibQuark.C.val_;
    val variantTypeStringIsValid_ = _import "mlton_g_variant_type_string_is_valid" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> FFI.Bool.C.val_;
    val variantTypeStringScan_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_g_variant_type_string_scan" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val warnMessage_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7)
         & (x8, x9) =>
          (
            _import "mlton_g_warn_message" :
              GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * FFI.Int.C.val_
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
    fun access filename mode = (FFI.String.C.withConstPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) access_ (filename & mode)
    fun asciiDigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) asciiDigitValue_ c
    fun asciiDtostr buffer bufLen d =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Double.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        asciiDtostr_
        (
          buffer
           & bufLen
           & d
        )
    fun asciiFormatd buffer bufLen format d =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        asciiFormatd_
        (
          buffer
           & bufLen
           & format
           & d
        )
    fun asciiStrcasecmp s1 s2 = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) asciiStrcasecmp_ (s1 & s2)
    fun asciiStrdown str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) asciiStrdown_ (str & len)
    fun asciiStrncasecmp s1 s2 n =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Size.C.withVal
         ---> FFI.Int.C.fromVal
      )
        asciiStrncasecmp_
        (
          s1
           & s2
           & n
        )
    fun asciiStrtod nptr endptr = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Double.C.fromVal) asciiStrtod_ (nptr & endptr)
    fun asciiStrtoll nptr endptr base =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.UInt64.C.fromVal
      )
        asciiStrtoull_
        (
          nptr
           & endptr
           & base
        )
    fun asciiStrup str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) asciiStrup_ (str & len)
    fun asciiTolower c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) asciiTolower_ c
    fun asciiToupper c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) asciiToupper_ c
    fun asciiXdigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) asciiXdigitValue_ c
    fun assertWarning logDomain file line prettyFunction expression =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
    fun basename fileName = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) basename_ fileName
    fun bitNthLsf mask nthBit = (FFI.ULong.C.withVal &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) bitNthLsf_ (mask & nthBit)
    fun bitNthMsf mask nthBit = (FFI.ULong.C.withVal &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) bitNthMsf_ (mask & nthBit)
    fun bitStorage number = (FFI.ULong.C.withVal ---> FFI.UInt.C.fromVal) bitStorage_ number
    fun blowChunks () = (I ---> I) blowChunks_ ()
    fun bookmarkFileErrorQuark () = (I ---> GLibQuark.C.fromVal) bookmarkFileErrorQuark_ ()
    fun chdir path = (FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) chdir_ path
    fun checkVersion requiredMajor requiredMinor requiredMicro =
      (
        FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> FFI.String.C.fromPtr false
      )
        checkVersion_
        (
          requiredMajor
           & requiredMinor
           & requiredMicro
        )
    fun checksumTypeGetLength checksumType = (GLibChecksumType.C.withVal ---> FFI.SSize.C.fromVal) checksumTypeGetLength_ checksumType
    fun childWatchSourceNew pid = (GLibPid.C.withVal ---> GLibSourceRecord.C.fromPtr true) childWatchSourceNew_ pid
    fun clearError () = (GLibErrorRecord.C.handleError ---> I) clearError_ []
    fun computeChecksumForString checksumType str length =
      (
        GLibChecksumType.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         ---> FFI.String.C.fromPtr true
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
            FFI.String.C.withConstPtr
             &&&> FFI.SSize.C.withVal
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.Size.C.withRefVal
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal
                   && FFI.Size.C.fromVal
                   && FFI.String.C.fromPtr true
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
        FFI.String.C.withConstPtr
         &&&> FFI.Size.C.withVal
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstOptPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.String.C.fromPtr false
      )
        dcgettext_
        (
          domain
           & msgid
           & category
        )
    fun dgettext domain msgid = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) dgettext_ (domain & msgid)
    fun dirMakeTmp tmpl = (FFI.String.C.withConstOptPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.C.fromPtr true) dirMakeTmp_ (tmpl & [])
    fun dngettext domain msgid msgidPlural n =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.ULong.C.withVal
         ---> FFI.String.C.fromPtr false
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Size.C.withVal
         ---> FFI.String.C.fromPtr false
      )
        dpgettext_
        (
          domain
           & msgctxtid
           & msgidoffset
        )
    fun dpgettext2 domain context msgid =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromPtr false
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
            FFI.String.C.withConstOptPtr
             &&&> FFI.String.C.withRefConstOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.String.C.fromPtr true && FFI.Int.C.fromVal
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
    fun fileReadLink filename = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.C.fromPtr true) fileReadLink_ (filename & [])
    fun fileTest filename test = (FFI.String.C.withConstPtr &&&> GLibFileTest.C.withVal ---> FFI.Bool.C.fromVal) fileTest_ (filename & test)
    fun filenameDisplayBasename filename = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) filenameDisplayBasename_ filename
    fun filenameDisplayName filename = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) filenameDisplayName_ filename
    fun filenameFromUri uri hostname =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        filenameFromUri_
        (
          uri
           & hostname
           & []
        )
    fun filenameToUri filename hostname =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.String.C.fromPtr true
      )
        filenameToUri_
        (
          filename
           & hostname
           & []
        )
    fun findProgramInPath program = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) findProgramInPath_ program
    fun formatSize size = (FFI.UInt64.C.withVal ---> FFI.String.C.fromPtr true) formatSize_ size
    fun formatSizeForDisplay size = (FFI.Int64.C.withVal ---> FFI.String.C.fromPtr true) formatSizeForDisplay_ size
    fun formatSizeFull size flags = (FFI.UInt64.C.withVal &&&> GLibFormatSizeFlags.C.withVal ---> FFI.String.C.fromPtr true) formatSizeFull_ (size & flags)
    fun getApplicationName () = (I ---> FFI.String.C.fromPtr false) getApplicationName_ ()
    fun getCharset charset = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) getCharset_ charset
    fun getCurrentDir () = (I ---> FFI.String.C.fromPtr true) getCurrentDir_ ()
    fun getCurrentTime result = (GLibTimeValRecord.C.withPtr ---> I) getCurrentTime_ result
    fun getFilenameCharsets charsets = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) getFilenameCharsets_ charsets
    fun getHomeDir () = (I ---> FFI.String.C.fromPtr false) getHomeDir_ ()
    fun getHostName () = (I ---> FFI.String.C.fromPtr false) getHostName_ ()
    fun getMonotonicTime () = (I ---> FFI.Int64.C.fromVal) getMonotonicTime_ ()
    fun getPrgname () = (I ---> FFI.String.C.fromPtr true) getPrgname_ ()
    fun getRealName () = (I ---> FFI.String.C.fromPtr false) getRealName_ ()
    fun getRealTime () = (I ---> FFI.Int64.C.fromVal) getRealTime_ ()
    fun getTmpDir () = (I ---> FFI.String.C.fromPtr false) getTmpDir_ ()
    fun getUserCacheDir () = (I ---> FFI.String.C.fromPtr false) getUserCacheDir_ ()
    fun getUserConfigDir () = (I ---> FFI.String.C.fromPtr false) getUserConfigDir_ ()
    fun getUserDataDir () = (I ---> FFI.String.C.fromPtr false) getUserDataDir_ ()
    fun getUserName () = (I ---> FFI.String.C.fromPtr false) getUserName_ ()
    fun getUserRuntimeDir () = (I ---> FFI.String.C.fromPtr false) getUserRuntimeDir_ ()
    fun getUserSpecialDir directory = (GLibUserDirectory.C.withVal ---> FFI.String.C.fromPtr false) getUserSpecialDir_ directory
    fun getenv variable = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getenv_ variable
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
    fun hostnameIsAsciiEncoded hostname = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hostnameIsAsciiEncoded_ hostname
    fun hostnameIsIpAddress hostname = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hostnameIsIpAddress_ hostname
    fun hostnameIsNonAscii hostname = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hostnameIsNonAscii_ hostname
    fun hostnameToAscii hostname = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) hostnameToAscii_ hostname
    fun hostnameToUnicode hostname = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) hostnameToUnicode_ hostname
    fun idleSourceNew () = (I ---> GLibSourceRecord.C.fromPtr true) idleSourceNew_ ()
    fun internStaticString string = (FFI.String.C.withConstOptPtr ---> FFI.String.C.fromPtr false) internStaticString_ string
    fun internString string = (FFI.String.C.withConstOptPtr ---> FFI.String.C.fromPtr false) internString_ string
    fun ioChannelErrorFromErrno en = (FFI.Int.C.withVal ---> GLibIOChannelError.C.fromVal) ioChannelErrorFromErrno_ en
    fun ioChannelErrorQuark () = (I ---> GLibQuark.C.fromVal) ioChannelErrorQuark_ ()
    fun ioCreateWatch channel condition = (GLibIOChannelRecord.C.withPtr &&&> GLibIOCondition.C.withVal ---> GLibSourceRecord.C.fromPtr true) ioCreateWatch_ (channel & condition)
    fun keyFileErrorQuark () = (I ---> GLibQuark.C.fromVal) keyFileErrorQuark_ ()
    fun listPopAllocator () = (I ---> I) listPopAllocator_ ()
    fun logRemoveHandler logDomain handlerId = (FFI.String.C.withConstPtr &&&> FFI.UInt.C.withVal ---> I) logRemoveHandler_ (logDomain & handlerId)
    fun logSetAlwaysFatal fatalMask = (GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetAlwaysFatal_ fatalMask
    fun logSetFatalMask logDomain fatalMask = (FFI.String.C.withConstPtr &&&> GLibLogLevelFlags.C.withVal ---> GLibLogLevelFlags.C.fromVal) logSetFatalMask_ (logDomain & fatalMask)
    fun mainContextDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextDefault_ ()
    fun mainContextGetThreadDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) mainContextGetThreadDefault_ ()
    fun mainCurrentSource () = (I ---> GLibSourceRecord.C.fromPtr false) mainCurrentSource_ ()
    fun mainDepth () = (I ---> FFI.Int.C.fromVal) mainDepth_ ()
    fun markupErrorQuark () = (I ---> GLibQuark.C.fromVal) markupErrorQuark_ ()
    fun markupEscapeText text length = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) markupEscapeText_ (text & length)
    fun memChunkInfo () = (I ---> I) memChunkInfo_ ()
    fun memIsSystemMalloc () = (I ---> FFI.Bool.C.fromVal) memIsSystemMalloc_ ()
    fun memProfile () = (I ---> I) memProfile_ ()
    fun memSetVtable vtable = (GLibMemVTableRecord.C.withPtr ---> I) memSetVtable_ vtable
    fun mkdirWithParents pathname mode = (FFI.String.C.withConstPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) mkdirWithParents_ (pathname & mode)
    fun mkdtemp tmpl = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) mkdtemp_ tmpl
    fun mkdtempFull tmpl mode = (FFI.String.C.withConstPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr true) mkdtempFull_ (tmpl & mode)
    fun mkstemp tmpl = (FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) mkstemp_ tmpl
    fun mkstempFull tmpl flags mode =
      (
        FFI.String.C.withConstPtr
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
    fun onErrorQuery prgName = (FFI.String.C.withConstPtr ---> I) onErrorQuery_ prgName
    fun onErrorStackTrace prgName = (FFI.String.C.withConstPtr ---> I) onErrorStackTrace_ prgName
    fun optionErrorQuark () = (I ---> GLibQuark.C.fromVal) optionErrorQuark_ ()
    fun pathGetBasename fileName = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) pathGetBasename_ fileName
    fun pathGetDirname fileName = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) pathGetDirname_ fileName
    fun pathIsAbsolute fileName = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) pathIsAbsolute_ fileName
    fun pathSkipRoot fileName = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) pathSkipRoot_ fileName
    fun patternMatch pspec stringLength string stringReversed =
      (
        GLibPatternSpecRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.Bool.C.fromVal
      )
        patternMatch_
        (
          pspec
           & stringLength
           & string
           & stringReversed
        )
    fun patternMatchSimple pattern string = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) patternMatchSimple_ (pattern & string)
    fun patternMatchString pspec string = (GLibPatternSpecRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) patternMatchString_ (pspec & string)
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
    fun quarkFromStaticString string = (FFI.String.C.withConstOptPtr ---> GLibQuark.C.fromVal) quarkFromStaticString_ string
    fun quarkFromString string = (FFI.String.C.withConstOptPtr ---> GLibQuark.C.fromVal) quarkFromString_ string
    fun quarkToString quark = (GLibQuark.C.withVal ---> FFI.String.C.fromPtr false) quarkToString_ quark
    fun quarkTryString string = (FFI.String.C.withConstOptPtr ---> GLibQuark.C.fromVal) quarkTryString_ string
    fun randomDouble () = (I ---> FFI.Double.C.fromVal) randomDouble_ ()
    fun randomDoubleRange begin end' = (FFI.Double.C.withVal &&&> FFI.Double.C.withVal ---> FFI.Double.C.fromVal) randomDoubleRange_ (begin & end')
    fun randomInt () = (I ---> FFI.UInt32.C.fromVal) randomInt_ ()
    fun randomIntRange begin end' = (FFI.Int32.C.withVal &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) randomIntRange_ (begin & end')
    fun randomSetSeed seed = (FFI.UInt32.C.withVal ---> I) randomSetSeed_ seed
    fun regexCheckReplacement replacement =
      let
        val hasReferences & retVal =
          (
            FFI.String.C.withConstPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
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
    fun regexEscapeNul string length = (FFI.String.C.withConstPtr &&&> FFI.Int.C.withVal ---> FFI.String.C.fromPtr true) regexEscapeNul_ (string & length)
    fun regexMatchSimple pattern string compileOptions matchOptions =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        returnIfFailWarning_
        (
          logDomain
           & prettyFunction
           & expression
        )
    fun rmdir filename = (FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) rmdir_ filename
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
    fun setApplicationName applicationName = (FFI.String.C.withConstPtr ---> I) setApplicationName_ applicationName
    fun setPrgname prgname = (FFI.String.C.withConstPtr ---> I) setPrgname_ prgname
    fun setenv variable value overwrite =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
    fun shellQuote unquotedString = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) shellQuote_ unquotedString
    fun shellUnquote quotedString = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.String.C.fromPtr true) shellUnquote_ (quotedString & [])
    fun sliceGetConfig ckey = (GLibSliceConfig.C.withVal ---> FFI.Int64.C.fromVal) sliceGetConfig_ ckey
    fun sliceSetConfig ckey value = (GLibSliceConfig.C.withVal &&&> FFI.Int64.C.withVal ---> I) sliceSetConfig_ (ckey & value)
    fun sourceRemove tag = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) sourceRemove_ tag
    fun sourceSetNameById tag name = (FFI.UInt.C.withVal &&&> FFI.String.C.withConstPtr ---> I) sourceSetNameById_ (tag & name)
    fun spacedPrimesClosest num = (FFI.UInt.C.withVal ---> FFI.UInt.C.fromVal) spacedPrimesClosest_ num
    fun spawnClosePid pid = (GLibPid.C.withVal ---> I) spawnClosePid_ pid
    fun spawnCommandLineAsync commandLine = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.C.fromVal) spawnCommandLineAsync_ (commandLine & [])
    fun spawnErrorQuark () = (I ---> GLibQuark.C.fromVal) spawnErrorQuark_ ()
    fun stpcpy dest src = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) stpcpy_ (dest & src)
    fun strHasPrefix str prefix = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) strHasPrefix_ (str & prefix)
    fun strHasSuffix str suffix = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) strHasSuffix_ (str & suffix)
    fun strcanon string validChars substitutor =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Char.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        strcanon_
        (
          string
           & validChars
           & substitutor
        )
    fun strcasecmp s1 s2 = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) strcasecmp_ (s1 & s2)
    fun strchomp string = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strchomp_ string
    fun strchug string = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strchug_ string
    fun strcmp0 str1 str2 = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) strcmp0_ (str1 & str2)
    fun strcompress source = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strcompress_ source
    fun strdelimit string delimiters newDelimiter =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Char.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        strdelimit_
        (
          string
           & delimiters
           & newDelimiter
        )
    fun strdown string = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strdown_ string
    fun strdup str = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strdup_ str
    fun strerror errnum = (FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) strerror_ errnum
    fun strescape source exceptions = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strescape_ (source & exceptions)
    fun strfreev strArray = (FFI.String.C.withConstPtr ---> I) strfreev_ strArray
    fun stringNew init = (FFI.String.C.withConstPtr ---> GLibStringRecord.C.fromPtr true) stringNew_ init
    fun stringNewLen init len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> GLibStringRecord.C.fromPtr true) stringNewLen_ (init & len)
    fun stringSizedNew dflSize = (FFI.Size.C.withVal ---> GLibStringRecord.C.fromPtr true) stringSizedNew_ dflSize
    fun stripContext msgid msgval = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) stripContext_ (msgid & msgval)
    fun strjoinv separator strArray = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strjoinv_ (separator & strArray)
    fun strlcat dest src destSize =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.Int.C.fromVal
      )
        strncasecmp_
        (
          s1
           & s2
           & n
        )
    fun strndup str n = (FFI.String.C.withConstPtr &&&> FFI.Size.C.withVal ---> FFI.String.C.fromPtr true) strndup_ (str & n)
    fun strnfill length fillChar = (FFI.Size.C.withVal &&&> FFI.Char.C.withVal ---> FFI.String.C.fromPtr true) strnfill_ (length & fillChar)
    fun strreverse string = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strreverse_ string
    fun strrstr haystack needle = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strrstr_ (haystack & needle)
    fun strrstrLen haystack haystackLen needle =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromPtr true
      )
        strrstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strsignal signum = (FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) strsignal_ signum
    fun strstrLen haystack haystackLen needle =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromPtr true
      )
        strstrLen_
        (
          haystack
           & haystackLen
           & needle
        )
    fun strtod nptr endptr = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Double.C.fromVal) strtod_ (nptr & endptr)
    fun strup string = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) strup_ string
    fun strvLength strArray = (FFI.String.C.withConstPtr ---> FFI.UInt.C.fromVal) strvLength_ strArray
    fun testBug bugUriSnippet = (FFI.String.C.withConstPtr ---> I) testBug_ bugUriSnippet
    fun testBugBase uriPattern = (FFI.String.C.withConstPtr ---> I) testBugBase_ uriPattern
    fun testFail () = (I ---> I) testFail_ ()
    fun testLogTypeName logType = (GLibTestLogType.C.withVal ---> FFI.String.C.fromPtr false) testLogTypeName_ logType
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.UInt64.C.withVal
         &&&> FFI.String.C.withConstPtr
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
    fun timeValFromIso8601 isoDate time = (FFI.String.C.withConstPtr &&&> GLibTimeValRecord.C.withPtr ---> FFI.Bool.C.fromVal) timeValFromIso8601_ (isoDate & time)
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
    fun unicharToUtf8 c outbuf = (FFI.Char.C.withVal &&&> FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) unicharToUtf8_ (c & outbuf)
    fun unicharTolower c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) unicharTolower_ c
    fun unicharTotitle c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) unicharTotitle_ c
    fun unicharToupper c = (FFI.Char.C.withVal ---> FFI.Char.C.fromVal) unicharToupper_ c
    fun unicharType c = (FFI.Char.C.withVal ---> GLibUnicodeType.C.fromVal) unicharType_ c
    fun unicharValidate ch = (FFI.Char.C.withVal ---> FFI.Bool.C.fromVal) unicharValidate_ ch
    fun unicharXdigitValue c = (FFI.Char.C.withVal ---> FFI.Int.C.fromVal) unicharXdigitValue_ c
    fun unicodeScriptFromIso15924 iso15924 = (FFI.UInt32.C.withVal ---> GLibUnicodeScript.C.fromVal) unicodeScriptFromIso15924_ iso15924
    fun unicodeScriptToIso15924 script = (GLibUnicodeScript.C.withVal ---> FFI.UInt32.C.fromVal) unicodeScriptToIso15924_ script
    fun unlink filename = (FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) unlink_ filename
    fun unsetenv variable = (FFI.String.C.withConstPtr ---> I) unsetenv_ variable
    fun uriEscapeString unescaped reservedCharsAllowed allowUtf8 =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        uriEscapeString_
        (
          unescaped
           & reservedCharsAllowed
           & allowUtf8
        )
    fun uriParseScheme uri = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) uriParseScheme_ uri
    fun uriUnescapeSegment escapedString escapedStringEnd illegalCharacters =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         ---> FFI.String.C.fromPtr true
      )
        uriUnescapeSegment_
        (
          escapedString
           & escapedStringEnd
           & illegalCharacters
        )
    fun uriUnescapeString escapedString illegalCharacters = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) uriUnescapeString_ (escapedString & illegalCharacters)
    fun usleep microseconds = (FFI.ULong.C.withVal ---> I) usleep_ microseconds
    fun utf8Casefold str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) utf8Casefold_ (str & len)
    fun utf8Collate str1 str2 = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) utf8Collate_ (str1 & str2)
    fun utf8CollateKey str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) utf8CollateKey_ (str & len)
    fun utf8CollateKeyForFilename str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) utf8CollateKeyForFilename_ (str & len)
    fun utf8FindNextChar p end' = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) utf8FindNextChar_ (p & end')
    fun utf8FindPrevChar str p = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) utf8FindPrevChar_ (str & p)
    fun utf8GetChar p = (FFI.String.C.withConstPtr ---> FFI.Char.C.fromVal) utf8GetChar_ p
    fun utf8GetCharValidated p maxLen = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.Char.C.fromVal) utf8GetCharValidated_ (p & maxLen)
    fun utf8Normalize str len mode =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         &&&> GLibNormalizeMode.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        utf8Normalize_
        (
          str
           & len
           & mode
        )
    fun utf8OffsetToPointer str offset = (FFI.String.C.withConstPtr &&&> FFI.Long.C.withVal ---> FFI.String.C.fromPtr true) utf8OffsetToPointer_ (str & offset)
    fun utf8PointerToOffset str pos = (FFI.String.C.withConstPtr &&&> FFI.String.C.withConstPtr ---> FFI.Long.C.fromVal) utf8PointerToOffset_ (str & pos)
    fun utf8PrevChar p = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) utf8PrevChar_ p
    fun utf8Strchr p len c =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         &&&> FFI.Char.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        utf8Strchr_
        (
          p
           & len
           & c
        )
    fun utf8Strdown str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) utf8Strdown_ (str & len)
    fun utf8Strlen p max = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.Long.C.fromVal) utf8Strlen_ (p & max)
    fun utf8Strncpy dest src n =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Size.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        utf8Strncpy_
        (
          dest
           & src
           & n
        )
    fun utf8Strrchr p len c =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.SSize.C.withVal
         &&&> FFI.Char.C.withVal
         ---> FFI.String.C.fromPtr true
      )
        utf8Strrchr_
        (
          p
           & len
           & c
        )
    fun utf8Strreverse str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) utf8Strreverse_ (str & len)
    fun utf8Strup str len = (FFI.String.C.withConstPtr &&&> FFI.SSize.C.withVal ---> FFI.String.C.fromPtr true) utf8Strup_ (str & len)
    fun utf8Substring str startPos endPos =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Long.C.withVal
         &&&> FFI.Long.C.withVal
         ---> FFI.String.C.fromPtr true
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
            FFI.String.C.withConstPtr
             &&&> FFI.SSize.C.withVal
             &&&> FFI.String.C.withRefConstOptPtr
             ---> FFI.String.C.fromPtr true && FFI.Bool.C.fromVal
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
    fun variantIsObjectPath string = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) variantIsObjectPath_ string
    fun variantIsSignature string = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) variantIsSignature_ string
    fun variantParse type' text limit endptr =
      (
        GLibVariantTypeRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
    fun variantParserGetErrorQuark () = (I ---> GLibQuark.C.fromVal) variantParserGetErrorQuark_ ()
    fun variantTypeStringIsValid typeString = (FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) variantTypeStringIsValid_ typeString
    fun variantTypeStringScan string limit =
      let
        val endptr & retVal =
          (
            FFI.String.C.withConstPtr
             &&&> FFI.String.C.withConstOptPtr
             &&&> FFI.String.C.withRefConstOptPtr
             ---> FFI.String.C.fromPtr true && FFI.Bool.C.fromVal
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
