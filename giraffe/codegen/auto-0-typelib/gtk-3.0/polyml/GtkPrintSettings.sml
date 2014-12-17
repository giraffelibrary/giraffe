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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_settings_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_print_settings_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newFromFile_ = call (load_sym libgtk "gtk_print_settings_new_from_file") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val copy_ = call (load_sym libgtk "gtk_print_settings_copy") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val get_ = call (load_sym libgtk "gtk_print_settings_get") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
      val getBool_ = call (load_sym libgtk "gtk_print_settings_get_bool") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val getCollate_ = call (load_sym libgtk "gtk_print_settings_get_collate") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getDefaultSource_ = call (load_sym libgtk "gtk_print_settings_get_default_source") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getDither_ = call (load_sym libgtk "gtk_print_settings_get_dither") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getDouble_ = call (load_sym libgtk "gtk_print_settings_get_double") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Double.PolyML.VAL)
      val getDoubleWithDefault_ =
        call (load_sym libgtk "gtk_print_settings_get_double_with_default")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             --> FFI.Double.PolyML.VAL
          )
      val getDuplex_ = call (load_sym libgtk "gtk_print_settings_get_duplex") (GObjectObjectClass.PolyML.PTR --> GtkPrintDuplex.PolyML.VAL)
      val getFinishings_ = call (load_sym libgtk "gtk_print_settings_get_finishings") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getInt_ = call (load_sym libgtk "gtk_print_settings_get_int") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Int32.PolyML.VAL)
      val getIntWithDefault_ =
        call (load_sym libgtk "gtk_print_settings_get_int_with_default")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Int32.PolyML.VAL
          )
      val getLength_ =
        call (load_sym libgtk "gtk_print_settings_get_length")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GtkUnit.PolyML.VAL
             --> FFI.Double.PolyML.VAL
          )
      val getMediaType_ = call (load_sym libgtk "gtk_print_settings_get_media_type") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getNCopies_ = call (load_sym libgtk "gtk_print_settings_get_n_copies") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getNumberUp_ = call (load_sym libgtk "gtk_print_settings_get_number_up") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getNumberUpLayout_ = call (load_sym libgtk "gtk_print_settings_get_number_up_layout") (GObjectObjectClass.PolyML.PTR --> GtkNumberUpLayout.PolyML.VAL)
      val getOrientation_ = call (load_sym libgtk "gtk_print_settings_get_orientation") (GObjectObjectClass.PolyML.PTR --> GtkPageOrientation.PolyML.VAL)
      val getOutputBin_ = call (load_sym libgtk "gtk_print_settings_get_output_bin") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPageSet_ = call (load_sym libgtk "gtk_print_settings_get_page_set") (GObjectObjectClass.PolyML.PTR --> GtkPageSet.PolyML.VAL)
      val getPaperHeight_ = call (load_sym libgtk "gtk_print_settings_get_paper_height") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getPaperSize_ = call (load_sym libgtk "gtk_print_settings_get_paper_size") (GObjectObjectClass.PolyML.PTR --> GtkPaperSizeRecord.PolyML.PTR)
      val getPaperWidth_ = call (load_sym libgtk "gtk_print_settings_get_paper_width") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getPrintPages_ = call (load_sym libgtk "gtk_print_settings_get_print_pages") (GObjectObjectClass.PolyML.PTR --> GtkPrintPages.PolyML.VAL)
      val getPrinter_ = call (load_sym libgtk "gtk_print_settings_get_printer") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPrinterLpi_ = call (load_sym libgtk "gtk_print_settings_get_printer_lpi") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getQuality_ = call (load_sym libgtk "gtk_print_settings_get_quality") (GObjectObjectClass.PolyML.PTR --> GtkPrintQuality.PolyML.VAL)
      val getResolution_ = call (load_sym libgtk "gtk_print_settings_get_resolution") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getResolutionX_ = call (load_sym libgtk "gtk_print_settings_get_resolution_x") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getResolutionY_ = call (load_sym libgtk "gtk_print_settings_get_resolution_y") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getReverse_ = call (load_sym libgtk "gtk_print_settings_get_reverse") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getScale_ = call (load_sym libgtk "gtk_print_settings_get_scale") (GObjectObjectClass.PolyML.PTR --> FFI.Double.PolyML.VAL)
      val getUseColor_ = call (load_sym libgtk "gtk_print_settings_get_use_color") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val hasKey_ = call (load_sym libgtk "gtk_print_settings_has_key") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val loadFile_ =
        call (load_sym libgtk "gtk_print_settings_load_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val loadKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_load_key_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val set_ =
        call (load_sym libgtk "gtk_print_settings_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val setBool_ =
        call (load_sym libgtk "gtk_print_settings_set_bool")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setCollate_ = call (load_sym libgtk "gtk_print_settings_set_collate") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setDefaultSource_ = call (load_sym libgtk "gtk_print_settings_set_default_source") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setDither_ = call (load_sym libgtk "gtk_print_settings_set_dither") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setDouble_ =
        call (load_sym libgtk "gtk_print_settings_set_double")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setDuplex_ = call (load_sym libgtk "gtk_print_settings_set_duplex") (GObjectObjectClass.PolyML.PTR &&> GtkPrintDuplex.PolyML.VAL --> FFI.PolyML.VOID)
      val setFinishings_ = call (load_sym libgtk "gtk_print_settings_set_finishings") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setInt_ =
        call (load_sym libgtk "gtk_print_settings_set_int")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setLength_ =
        call (load_sym libgtk "gtk_print_settings_set_length")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setMediaType_ = call (load_sym libgtk "gtk_print_settings_set_media_type") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setNCopies_ = call (load_sym libgtk "gtk_print_settings_set_n_copies") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setNumberUp_ = call (load_sym libgtk "gtk_print_settings_set_number_up") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setNumberUpLayout_ = call (load_sym libgtk "gtk_print_settings_set_number_up_layout") (GObjectObjectClass.PolyML.PTR &&> GtkNumberUpLayout.PolyML.VAL --> FFI.PolyML.VOID)
      val setOrientation_ = call (load_sym libgtk "gtk_print_settings_set_orientation") (GObjectObjectClass.PolyML.PTR &&> GtkPageOrientation.PolyML.VAL --> FFI.PolyML.VOID)
      val setOutputBin_ = call (load_sym libgtk "gtk_print_settings_set_output_bin") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setPageSet_ = call (load_sym libgtk "gtk_print_settings_set_page_set") (GObjectObjectClass.PolyML.PTR &&> GtkPageSet.PolyML.VAL --> FFI.PolyML.VOID)
      val setPaperHeight_ =
        call (load_sym libgtk "gtk_print_settings_set_paper_height")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setPaperSize_ = call (load_sym libgtk "gtk_print_settings_set_paper_size") (GObjectObjectClass.PolyML.PTR &&> GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setPaperWidth_ =
        call (load_sym libgtk "gtk_print_settings_set_paper_width")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setPrintPages_ = call (load_sym libgtk "gtk_print_settings_set_print_pages") (GObjectObjectClass.PolyML.PTR &&> GtkPrintPages.PolyML.VAL --> FFI.PolyML.VOID)
      val setPrinter_ = call (load_sym libgtk "gtk_print_settings_set_printer") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setPrinterLpi_ = call (load_sym libgtk "gtk_print_settings_set_printer_lpi") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setQuality_ = call (load_sym libgtk "gtk_print_settings_set_quality") (GObjectObjectClass.PolyML.PTR &&> GtkPrintQuality.PolyML.VAL --> FFI.PolyML.VOID)
      val setResolution_ = call (load_sym libgtk "gtk_print_settings_set_resolution") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setResolutionXy_ =
        call (load_sym libgtk "gtk_print_settings_set_resolution_xy")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setReverse_ = call (load_sym libgtk "gtk_print_settings_set_reverse") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setScale_ = call (load_sym libgtk "gtk_print_settings_set_scale") (GObjectObjectClass.PolyML.PTR &&> FFI.Double.PolyML.VAL --> FFI.PolyML.VOID)
      val setUseColor_ = call (load_sym libgtk "gtk_print_settings_set_use_color") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val toFile_ =
        call (load_sym libgtk "gtk_print_settings_to_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_to_key_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val unset_ = call (load_sym libgtk "gtk_print_settings_unset") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkPrintSettingsClass.t
    type printduplex_t = GtkPrintDuplex.t
    type numberuplayout_t = GtkNumberUpLayout.t
    type pageorientation_t = GtkPageOrientation.t
    type pageset_t = GtkPageSet.t
    type papersizerecord_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type printpages_t = GtkPrintPages.t
    type printquality_t = GtkPrintQuality.t
    type t = base class_t
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
