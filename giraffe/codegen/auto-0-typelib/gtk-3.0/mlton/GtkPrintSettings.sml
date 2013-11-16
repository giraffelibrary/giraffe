structure GtkPrintSettings :>
  GTK_PRINT_SETTINGS
    where type 'a class_t = 'a GtkPrintSettingsClass.t
    where type printduplex_t = GtkPrintDuplex.t
    where type numberuplayout_t = GtkNumberUpLayout.t
    where type pageorientation_t = GtkPageOrientation.t
    where type pageset_t = GtkPageSet.t
    where type papersizerecord_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t
    where type printpages_t = GtkPrintPages.t
    where type printquality_t = GtkPrintQuality.t =
  struct
    val getType_ = _import "gtk_print_settings_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_print_settings_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromFile_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_print_settings_new_from_file" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newFromKeyFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_new_from_key_file" :
              GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val copy_ = _import "gtk_print_settings_copy" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val get_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getCollate_ = _import "gtk_print_settings_get_collate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getDefaultSource_ = _import "gtk_print_settings_get_default_source" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDither_ = _import "gtk_print_settings_get_dither" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDouble_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get_double" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Double.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               -> FFI.Double.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getDuplex_ = _import "gtk_print_settings_get_duplex" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPrintDuplex.C.val_;
    val getFinishings_ = _import "gtk_print_settings_get_finishings" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getInt_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_get_int" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Int32.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
               -> FFI.Int32.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GtkUnit.C.val_
               -> FFI.Double.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMediaType_ = _import "gtk_print_settings_get_media_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getNCopies_ = _import "gtk_print_settings_get_n_copies" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getNumberUp_ = _import "gtk_print_settings_get_number_up" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getNumberUpLayout_ = _import "gtk_print_settings_get_number_up_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkNumberUpLayout.C.val_;
    val getOrientation_ = _import "gtk_print_settings_get_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPageOrientation.C.val_;
    val getOutputBin_ = _import "gtk_print_settings_get_output_bin" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPageSet_ = _import "gtk_print_settings_get_page_set" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPageSet.C.val_;
    val getPaperHeight_ = fn x1 & x2 => (_import "gtk_print_settings_get_paper_height" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPaperSize_ = _import "gtk_print_settings_get_paper_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p;
    val getPaperWidth_ = fn x1 & x2 => (_import "gtk_print_settings_get_paper_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkUnit.C.val_ -> FFI.Double.C.val_;) (x1, x2)
    val getPrintPages_ = _import "gtk_print_settings_get_print_pages" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPrintPages.C.val_;
    val getPrinter_ = _import "gtk_print_settings_get_printer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPrinterLpi_ = _import "gtk_print_settings_get_printer_lpi" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getQuality_ = _import "gtk_print_settings_get_quality" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPrintQuality.C.val_;
    val getResolution_ = _import "gtk_print_settings_get_resolution" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getResolutionX_ = _import "gtk_print_settings_get_resolution_x" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getResolutionY_ = _import "gtk_print_settings_get_resolution_y" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getReverse_ = _import "gtk_print_settings_get_reverse" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getScale_ = _import "gtk_print_settings_get_scale" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getUseColor_ = _import "gtk_print_settings_get_use_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val hasKey_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_has_key" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setCollate_ = fn x1 & x2 => (_import "gtk_print_settings_set_collate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDefaultSource_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_default_source" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDuplex_ = fn x1 & x2 => (_import "gtk_print_settings_set_duplex" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPrintDuplex.C.val_ -> unit;) (x1, x2)
    val setFinishings_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_finishings" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Double.C.val_
               * GtkUnit.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNCopies_ = fn x1 & x2 => (_import "gtk_print_settings_set_n_copies" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setNumberUp_ = fn x1 & x2 => (_import "gtk_print_settings_set_number_up" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setNumberUpLayout_ = fn x1 & x2 => (_import "gtk_print_settings_set_number_up_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkNumberUpLayout.C.val_ -> unit;) (x1, x2)
    val setOrientation_ = fn x1 & x2 => (_import "gtk_print_settings_set_orientation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPageOrientation.C.val_ -> unit;) (x1, x2)
    val setOutputBin_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_output_bin" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPageSet_ = fn x1 & x2 => (_import "gtk_print_settings_set_page_set" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPageSet.C.val_ -> unit;) (x1, x2)
    val setPaperHeight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_settings_set_paper_height" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPaperSize_ = fn x1 & x2 => (_import "gtk_print_settings_set_paper_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPaperSizeRecord.C.notnull GtkPaperSizeRecord.C.p -> unit;) (x1, x2)
    val setPaperWidth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_settings_set_paper_width" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Double.C.val_
               * GtkUnit.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPrintPages_ = fn x1 & x2 => (_import "gtk_print_settings_set_print_pages" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPrintPages.C.val_ -> unit;) (x1, x2)
    val setPrinter_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_print_settings_set_printer" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPrinterLpi_ = fn x1 & x2 => (_import "gtk_print_settings_set_printer_lpi" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setQuality_ = fn x1 & x2 => (_import "gtk_print_settings_set_quality" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPrintQuality.C.val_ -> unit;) (x1, x2)
    val setResolution_ = fn x1 & x2 => (_import "gtk_print_settings_set_resolution" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setResolutionXy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_print_settings_set_resolution_xy" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReverse_ = fn x1 & x2 => (_import "gtk_print_settings_set_reverse" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScale_ = fn x1 & x2 => (_import "gtk_print_settings_set_scale" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setUseColor_ = fn x1 & x2 => (_import "gtk_print_settings_set_use_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val toFile_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_print_settings_to_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val toKeyFile_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_print_settings_to_key_file" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkPrintSettingsClass.t
    type printduplex_t = GtkPrintDuplex.t
    type numberuplayout_t = GtkNumberUpLayout.t
    type pageorientation_t = GtkPageOrientation.t
    type pageset_t = GtkPageSet.t
    type papersizerecord_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type printpages_t = GtkPrintPages.t
    type printquality_t = GtkPrintQuality.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPrintSettingsClass.C.fromPtr true) new_ ()
    fun newFromFile fileName = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GtkPrintSettingsClass.C.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GtkPrintSettingsClass.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkPrintSettingsClass.C.fromPtr true) copy_ self
    fun get self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) get_ (self & key)
    fun getBool self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) getBool_ (self & key)
    fun getCollate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCollate_ self
    fun getDefaultSource self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDefaultSource_ self
    fun getDither self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDither_ self
    fun getDouble self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Double.C.fromVal) getDouble_ (self & key)
    fun getDoubleWithDefault self key def =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         ---> FFI.Double.C.fromVal
      )
        getDoubleWithDefault_
        (
          self
           & key
           & def
        )
    fun getDuplex self = (GObjectObjectClass.C.withPtr ---> GtkPrintDuplex.C.fromVal) getDuplex_ self
    fun getFinishings self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getFinishings_ self
    fun getInt self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Int32.C.fromVal) getInt_ (self & key)
    fun getIntWithDefault self key def =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getIntWithDefault_
        (
          self
           & key
           & def
        )
    fun getLength self key unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GtkUnit.C.withVal
         ---> FFI.Double.C.fromVal
      )
        getLength_
        (
          self
           & key
           & unit
        )
    fun getMediaType self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getMediaType_ self
    fun getNCopies self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNCopies_ self
    fun getNumberUp self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNumberUp_ self
    fun getNumberUpLayout self = (GObjectObjectClass.C.withPtr ---> GtkNumberUpLayout.C.fromVal) getNumberUpLayout_ self
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getOutputBin self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getOutputBin_ self
    fun getPageSet self = (GObjectObjectClass.C.withPtr ---> GtkPageSet.C.fromVal) getPageSet_ self
    fun getPaperHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GObjectObjectClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperWidth_ (self & unit)
    fun getPrintPages self = (GObjectObjectClass.C.withPtr ---> GtkPrintPages.C.fromVal) getPrintPages_ self
    fun getPrinter self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getPrinter_ self
    fun getPrinterLpi self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPrinterLpi_ self
    fun getQuality self = (GObjectObjectClass.C.withPtr ---> GtkPrintQuality.C.fromVal) getQuality_ self
    fun getResolution self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolution_ self
    fun getResolutionX self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolutionX_ self
    fun getResolutionY self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolutionY_ self
    fun getReverse self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReverse_ self
    fun getScale self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getScale_ self
    fun getUseColor self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseColor_ self
    fun hasKey self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasKey_ (self & key)
    fun loadFile self fileName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadFile_
        (
          self
           & fileName
           & []
        )
    fun loadKeyFile self keyFile groupName =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        loadKeyFile_
        (
          self
           & keyFile
           & groupName
           & []
        )
    fun set self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         ---> I
      )
        set_
        (
          self
           & key
           & value
        )
    fun setBool self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setBool_
        (
          self
           & key
           & value
        )
    fun setCollate self collate = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCollate_ (self & collate)
    fun setDefaultSource self defaultSource = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDefaultSource_ (self & defaultSource)
    fun setDither self dither = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setDither_ (self & dither)
    fun setDouble self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         ---> I
      )
        setDouble_
        (
          self
           & key
           & value
        )
    fun setDuplex self duplex = (GObjectObjectClass.C.withPtr &&&> GtkPrintDuplex.C.withVal ---> I) setDuplex_ (self & duplex)
    fun setFinishings self finishings = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setFinishings_ (self & finishings)
    fun setInt self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setInt_
        (
          self
           & key
           & value
        )
    fun setLength self key value unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setLength_
        (
          self
           & key
           & value
           & unit
        )
    fun setMediaType self mediaType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setMediaType_ (self & mediaType)
    fun setNCopies self numCopies = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNCopies_ (self & numCopies)
    fun setNumberUp self numberUp = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNumberUp_ (self & numberUp)
    fun setNumberUpLayout self numberUpLayout = (GObjectObjectClass.C.withPtr &&&> GtkNumberUpLayout.C.withVal ---> I) setNumberUpLayout_ (self & numberUpLayout)
    fun setOrientation self orientation = (GObjectObjectClass.C.withPtr &&&> GtkPageOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    fun setOutputBin self outputBin = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setOutputBin_ (self & outputBin)
    fun setPageSet self pageSet = (GObjectObjectClass.C.withPtr &&&> GtkPageSet.C.withVal ---> I) setPageSet_ (self & pageSet)
    fun setPaperHeight self height unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setPaperHeight_
        (
          self
           & height
           & unit
        )
    fun setPaperSize self paperSize = (GObjectObjectClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSize_ (self & paperSize)
    fun setPaperWidth self width unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setPaperWidth_
        (
          self
           & width
           & unit
        )
    fun setPrintPages self pages = (GObjectObjectClass.C.withPtr &&&> GtkPrintPages.C.withVal ---> I) setPrintPages_ (self & pages)
    fun setPrinter self printer = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setPrinter_ (self & printer)
    fun setPrinterLpi self lpi = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPrinterLpi_ (self & lpi)
    fun setQuality self quality = (GObjectObjectClass.C.withPtr &&&> GtkPrintQuality.C.withVal ---> I) setQuality_ (self & quality)
    fun setResolution self resolution = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setResolution_ (self & resolution)
    fun setResolutionXy self resolutionX resolutionY =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        setResolutionXy_
        (
          self
           & resolutionX
           & resolutionY
        )
    fun setReverse self reverse = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReverse_ (self & reverse)
    fun setScale self scale = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setScale_ (self & scale)
    fun setUseColor self useColor = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseColor_ (self & useColor)
    fun toFile self fileName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        toFile_
        (
          self
           & fileName
           & []
        )
    fun toKeyFile self keyFile groupName =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun unset self key = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) unset_ (self & key)
  end
