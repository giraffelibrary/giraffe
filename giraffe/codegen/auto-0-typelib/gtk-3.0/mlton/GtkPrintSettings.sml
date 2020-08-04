structure GtkPrintSettings :>
  GTK_PRINT_SETTINGS
    where type 'a class = 'a GtkPrintSettingsClass.class
    where type print_duplex_t = GtkPrintDuplex.t
    where type number_up_layout_t = GtkNumberUpLayout.t
    where type page_orientation_t = GtkPageOrientation.t
    where type page_range_record_c_array_n_t = GtkPageRangeRecordCArrayN.t
    where type page_set_t = GtkPageSet.t
    where type paper_size_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t
    where type print_pages_t = GtkPrintPages.t
    where type print_quality_t = GtkPrintQuality.t =
  struct
    val getType_ = _import "gtk_print_settings_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_print_settings_new" : unit -> GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_print_settings_new_from_file" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromGvariant_ = _import "gtk_print_settings_new_from_gvariant" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p;
    val newFromKeyFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_new_from_key_file" :
              GLibKeyFileRecord.FFI.non_opt GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_print_settings_copy" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p;
    val get_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> Utf8.FFI.non_opt Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBool_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get_bool" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCollate_ = _import "gtk_print_settings_get_collate" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GBool.FFI.val_;
    val getDefaultSource_ = _import "gtk_print_settings_get_default_source" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDither_ = _import "gtk_print_settings_get_dither" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDouble_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get_double" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GDouble.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDoubleWithDefault_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_get_double_with_default" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               -> GDouble.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDuplex_ = _import "gtk_print_settings_get_duplex" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPrintDuplex.FFI.val_;
    val getFinishings_ = _import "gtk_print_settings_get_finishings" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getInt_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get_int" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIntWithDefault_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_get_int_with_default" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getLength_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_get_length" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkUnit.FFI.val_
               -> GDouble.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMediaType_ = _import "gtk_print_settings_get_media_type" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNCopies_ = _import "gtk_print_settings_get_n_copies" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GInt32.FFI.val_;
    val getNumberUp_ = _import "gtk_print_settings_get_number_up" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GInt32.FFI.val_;
    val getNumberUpLayout_ = _import "gtk_print_settings_get_number_up_layout" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkNumberUpLayout.FFI.val_;
    val getOrientation_ = _import "gtk_print_settings_get_orientation" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPageOrientation.FFI.val_;
    val getOutputBin_ = _import "gtk_print_settings_get_output_bin" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPageRanges_ = fn x1 & x2 => (_import "gtk_print_settings_get_page_ranges" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GInt32.FFI.ref_ -> GtkPageRangeRecordCArrayN.FFI.non_opt GtkPageRangeRecordCArrayN.FFI.out_p;) (x1, x2)
    val getPageSet_ = _import "gtk_print_settings_get_page_set" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPageSet.FFI.val_;
    val getPaperHeight_ = fn x1 & x2 => (_import "gtk_print_settings_get_paper_height" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getPaperSize_ = _import "gtk_print_settings_get_paper_size" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPaperSizeRecord.FFI.non_opt GtkPaperSizeRecord.FFI.p;
    val getPaperWidth_ = fn x1 & x2 => (_import "gtk_print_settings_get_paper_width" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkUnit.FFI.val_ -> GDouble.FFI.val_;) (x1, x2)
    val getPrintPages_ = _import "gtk_print_settings_get_print_pages" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPrintPages.FFI.val_;
    val getPrinter_ = _import "gtk_print_settings_get_printer" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPrinterLpi_ = _import "gtk_print_settings_get_printer_lpi" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GDouble.FFI.val_;
    val getQuality_ = _import "gtk_print_settings_get_quality" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GtkPrintQuality.FFI.val_;
    val getResolution_ = _import "gtk_print_settings_get_resolution" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GInt32.FFI.val_;
    val getResolutionX_ = _import "gtk_print_settings_get_resolution_x" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GInt32.FFI.val_;
    val getResolutionY_ = _import "gtk_print_settings_get_resolution_y" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GInt32.FFI.val_;
    val getReverse_ = _import "gtk_print_settings_get_reverse" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GBool.FFI.val_;
    val getScale_ = _import "gtk_print_settings_get_scale" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GDouble.FFI.val_;
    val getUseColor_ = _import "gtk_print_settings_get_use_color" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GBool.FFI.val_;
    val hasKey_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_has_key" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val loadFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_load_file" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_print_settings_load_key_file" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * GLibKeyFileRecord.FFI.non_opt GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val set_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_print_settings_set" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setBool_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_set_bool" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setCollate_ = fn x1 & x2 => (_import "gtk_print_settings_set_collate" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setDefaultSource_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_default_source" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDither_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_dither" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDouble_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_set_double" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDuplex_ = fn x1 & x2 => (_import "gtk_print_settings_set_duplex" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkPrintDuplex.FFI.val_ -> unit;) (x1, x2)
    val setFinishings_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_finishings" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInt_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_set_int" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setLength_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_print_settings_set_length" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setMediaType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_media_type" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNCopies_ = fn x1 & x2 => (_import "gtk_print_settings_set_n_copies" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setNumberUp_ = fn x1 & x2 => (_import "gtk_print_settings_set_number_up" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setNumberUpLayout_ = fn x1 & x2 => (_import "gtk_print_settings_set_number_up_layout" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkNumberUpLayout.FFI.val_ -> unit;) (x1, x2)
    val setOrientation_ = fn x1 & x2 => (_import "gtk_print_settings_set_orientation" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkPageOrientation.FFI.val_ -> unit;) (x1, x2)
    val setOutputBin_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_output_bin" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageRanges_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_set_page_ranges" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * GtkPageRangeRecordCArrayN.MLton.p1
               * GtkPageRangeRecordCArrayN.FFI.non_opt GtkPageRangeRecordCArrayN.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setPageSet_ = fn x1 & x2 => (_import "gtk_print_settings_set_page_set" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkPageSet.FFI.val_ -> unit;) (x1, x2)
    val setPaperHeight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_settings_set_paper_height" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPaperSize_ = fn x1 & x2 => (_import "gtk_print_settings_set_paper_size" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkPaperSizeRecord.FFI.non_opt GtkPaperSizeRecord.FFI.p -> unit;) (x1, x2)
    val setPaperWidth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_settings_set_paper_width" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * GDouble.FFI.val_
               * GtkUnit.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPrintPages_ = fn x1 & x2 => (_import "gtk_print_settings_set_print_pages" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkPrintPages.FFI.val_ -> unit;) (x1, x2)
    val setPrinter_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_printer" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPrinterLpi_ = fn x1 & x2 => (_import "gtk_print_settings_set_printer_lpi" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setQuality_ = fn x1 & x2 => (_import "gtk_print_settings_set_quality" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GtkPrintQuality.FFI.val_ -> unit;) (x1, x2)
    val setResolution_ = fn x1 & x2 => (_import "gtk_print_settings_set_resolution" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setResolutionXy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_settings_set_resolution_xy" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReverse_ = fn x1 & x2 => (_import "gtk_print_settings_set_reverse" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScale_ = fn x1 & x2 => (_import "gtk_print_settings_set_scale" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setUseColor_ = fn x1 & x2 => (_import "gtk_print_settings_set_use_color" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val toFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_to_file" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toGvariant_ = _import "gtk_print_settings_to_gvariant" : GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val toKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_print_settings_to_key_file" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * GLibKeyFileRecord.FFI.non_opt GLibKeyFileRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val unset_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_unset" :
              GtkPrintSettingsClass.FFI.non_opt GtkPrintSettingsClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkPrintSettingsClass.class
    type print_duplex_t = GtkPrintDuplex.t
    type number_up_layout_t = GtkNumberUpLayout.t
    type page_orientation_t = GtkPageOrientation.t
    type page_range_record_c_array_n_t = GtkPageRangeRecordCArrayN.t
    type page_set_t = GtkPageSet.t
    type paper_size_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type print_pages_t = GtkPrintPages.t
    type print_quality_t = GtkPrintQuality.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPrintSettingsClass.FFI.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GtkPrintSettingsClass.FFI.fromPtr true) newFromFile_ (fileName & [])
    fun newFromGvariant variant = (GLibVariantRecord.FFI.withPtr false ---> GtkPrintSettingsClass.FFI.fromPtr true) newFromGvariant_ variant
    fun newFromKeyFile (keyFile, groupName) =
      (
        GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GtkPrintSettingsClass.FFI.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPrintSettingsClass.FFI.fromPtr true) copy_ self
    fun get self key = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr 0) get_ (self & key)
    fun getBool self key = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) getBool_ (self & key)
    fun getCollate self = (GtkPrintSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCollate_ self
    fun getDefaultSource self = (GtkPrintSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDefaultSource_ self
    fun getDither self = (GtkPrintSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDither_ self
    fun getDouble self key = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GDouble.FFI.fromVal) getDouble_ (self & key)
    fun getDoubleWithDefault self (key, def) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         ---> GDouble.FFI.fromVal
      )
        getDoubleWithDefault_
        (
          self
           & key
           & def
        )
    fun getDuplex self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPrintDuplex.FFI.fromVal) getDuplex_ self
    fun getFinishings self = (GtkPrintSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFinishings_ self
    fun getInt self key = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GInt32.FFI.fromVal) getInt_ (self & key)
    fun getIntWithDefault self (key, def) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        getIntWithDefault_
        (
          self
           & key
           & def
        )
    fun getLength self (key, unit) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkUnit.FFI.withVal
         ---> GDouble.FFI.fromVal
      )
        getLength_
        (
          self
           & key
           & unit
        )
    fun getMediaType self = (GtkPrintSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMediaType_ self
    fun getNCopies self = (GtkPrintSettingsClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNCopies_ self
    fun getNumberUp self = (GtkPrintSettingsClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNumberUp_ self
    fun getNumberUpLayout self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkNumberUpLayout.FFI.fromVal) getNumberUpLayout_ self
    fun getOrientation self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPageOrientation.FFI.fromVal) getOrientation_ self
    fun getOutputBin self = (GtkPrintSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getOutputBin_ self
    fun getPageRanges self =
      let
        val numRanges & retVal = (GtkPrintSettingsClass.FFI.withPtr false &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GtkPageRangeRecordCArrayN.FFI.fromPtr ~1) getPageRanges_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt numRanges)
      end
    fun getPageSet self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPageSet.FFI.fromVal) getPageSet_ self
    fun getPaperHeight self unit = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPaperSizeRecord.FFI.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperWidth_ (self & unit)
    fun getPrintPages self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPrintPages.FFI.fromVal) getPrintPages_ self
    fun getPrinter self = (GtkPrintSettingsClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPrinter_ self
    fun getPrinterLpi self = (GtkPrintSettingsClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getPrinterLpi_ self
    fun getQuality self = (GtkPrintSettingsClass.FFI.withPtr false ---> GtkPrintQuality.FFI.fromVal) getQuality_ self
    fun getResolution self = (GtkPrintSettingsClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getResolution_ self
    fun getResolutionX self = (GtkPrintSettingsClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getResolutionX_ self
    fun getResolutionY self = (GtkPrintSettingsClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getResolutionY_ self
    fun getReverse self = (GtkPrintSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReverse_ self
    fun getScale self = (GtkPrintSettingsClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getScale_ self
    fun getUseColor self = (GtkPrintSettingsClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseColor_ self
    fun hasKey self key = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasKey_ (self & key)
    fun loadFile self fileName =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadFile_
        (
          self
           & fileName
           & []
        )
    fun loadKeyFile self (keyFile, groupName) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        loadKeyFile_
        (
          self
           & keyFile
           & groupName
           & []
        )
    fun set self (key, value) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        set_
        (
          self
           & key
           & value
        )
    fun setBool self (key, value) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         ---> I
      )
        setBool_
        (
          self
           & key
           & value
        )
    fun setCollate self collate = (GtkPrintSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCollate_ (self & collate)
    fun setDefaultSource self defaultSource = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDefaultSource_ (self & defaultSource)
    fun setDither self dither = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setDither_ (self & dither)
    fun setDouble self (key, value) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setDouble_
        (
          self
           & key
           & value
        )
    fun setDuplex self duplex = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkPrintDuplex.FFI.withVal ---> I) setDuplex_ (self & duplex)
    fun setFinishings self finishings = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFinishings_ (self & finishings)
    fun setInt self (key, value) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setInt_
        (
          self
           & key
           & value
        )
    fun setLength
      self
      (
        key,
        value,
        unit
      ) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setLength_
        (
          self
           & key
           & value
           & unit
        )
    fun setMediaType self mediaType = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setMediaType_ (self & mediaType)
    fun setNCopies self numCopies = (GtkPrintSettingsClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setNCopies_ (self & numCopies)
    fun setNumberUp self numberUp = (GtkPrintSettingsClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setNumberUp_ (self & numberUp)
    fun setNumberUpLayout self numberUpLayout = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkNumberUpLayout.FFI.withVal ---> I) setNumberUpLayout_ (self & numberUpLayout)
    fun setOrientation self orientation = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkPageOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    fun setOutputBin self outputBin = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setOutputBin_ (self & outputBin)
    fun setPageRanges self pageRanges =
      let
        val numRanges = LargeInt.fromInt (GtkPageRangeRecordCArrayN.length pageRanges)
        val () =
          (
            GtkPrintSettingsClass.FFI.withPtr false
             &&&> GtkPageRangeRecordCArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             ---> I
          )
            setPageRanges_
            (
              self
               & pageRanges
               & numRanges
            )
      in
        ()
      end
    fun setPageSet self pageSet = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkPageSet.FFI.withVal ---> I) setPageSet_ (self & pageSet)
    fun setPaperHeight self (height, unit) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setPaperHeight_
        (
          self
           & height
           & unit
        )
    fun setPaperSize self paperSize = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkPaperSizeRecord.FFI.withPtr false ---> I) setPaperSize_ (self & paperSize)
    fun setPaperWidth self (width, unit) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setPaperWidth_
        (
          self
           & width
           & unit
        )
    fun setPrintPages self pages = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkPrintPages.FFI.withVal ---> I) setPrintPages_ (self & pages)
    fun setPrinter self printer = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setPrinter_ (self & printer)
    fun setPrinterLpi self lpi = (GtkPrintSettingsClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setPrinterLpi_ (self & lpi)
    fun setQuality self quality = (GtkPrintSettingsClass.FFI.withPtr false &&&> GtkPrintQuality.FFI.withVal ---> I) setQuality_ (self & quality)
    fun setResolution self resolution = (GtkPrintSettingsClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setResolution_ (self & resolution)
    fun setResolutionXy self (resolutionX, resolutionY) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setResolutionXy_
        (
          self
           & resolutionX
           & resolutionY
        )
    fun setReverse self reverse = (GtkPrintSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReverse_ (self & reverse)
    fun setScale self scale = (GtkPrintSettingsClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setScale_ (self & scale)
    fun setUseColor self useColor = (GtkPrintSettingsClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseColor_ (self & useColor)
    fun toFile self fileName =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        toFile_
        (
          self
           & fileName
           & []
        )
    fun toGvariant self = (GtkPrintSettingsClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) toGvariant_ self
    fun toKeyFile self (keyFile, groupName) =
      (
        GtkPrintSettingsClass.FFI.withPtr false
         &&&> GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun unset self key = (GtkPrintSettingsClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) unset_ (self & key)
  end
