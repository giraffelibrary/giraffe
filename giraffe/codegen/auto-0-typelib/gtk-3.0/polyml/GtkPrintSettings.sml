structure GtkPrintSettings :>
  GTK_PRINT_SETTINGS
    where type 'a class_t = 'a GtkPrintSettingsClass.t
    where type print_duplex_t = GtkPrintDuplex.t
    where type number_up_layout_t = GtkNumberUpLayout.t
    where type page_orientation_t = GtkPageOrientation.t
    where type page_set_t = GtkPageSet.t
    where type paper_size_record_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t
    where type print_pages_t = GtkPrintPages.t
    where type print_quality_t = GtkPrintQuality.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_settings_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_print_settings_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newFromFile_ = call (load_sym libgtk "gtk_print_settings_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val copy_ = call (load_sym libgtk "gtk_print_settings_copy") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val get_ = call (load_sym libgtk "gtk_print_settings_get") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getBool_ = call (load_sym libgtk "gtk_print_settings_get_bool") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getCollate_ = call (load_sym libgtk "gtk_print_settings_get_collate") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDefaultSource_ = call (load_sym libgtk "gtk_print_settings_get_default_source") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDither_ = call (load_sym libgtk "gtk_print_settings_get_dither") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDouble_ = call (load_sym libgtk "gtk_print_settings_get_double") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Double.PolyML.cVal)
      val getDoubleWithDefault_ =
        call (load_sym libgtk "gtk_print_settings_get_double_with_default")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             --> FFI.Double.PolyML.cVal
          )
      val getDuplex_ = call (load_sym libgtk "gtk_print_settings_get_duplex") (GObjectObjectClass.PolyML.cPtr --> GtkPrintDuplex.PolyML.cVal)
      val getFinishings_ = call (load_sym libgtk "gtk_print_settings_get_finishings") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getInt_ = call (load_sym libgtk "gtk_print_settings_get_int") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int32.PolyML.cVal)
      val getIntWithDefault_ =
        call (load_sym libgtk "gtk_print_settings_get_int_with_default")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getLength_ =
        call (load_sym libgtk "gtk_print_settings_get_length")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkUnit.PolyML.cVal
             --> FFI.Double.PolyML.cVal
          )
      val getMediaType_ = call (load_sym libgtk "gtk_print_settings_get_media_type") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNCopies_ = call (load_sym libgtk "gtk_print_settings_get_n_copies") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNumberUp_ = call (load_sym libgtk "gtk_print_settings_get_number_up") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNumberUpLayout_ = call (load_sym libgtk "gtk_print_settings_get_number_up_layout") (GObjectObjectClass.PolyML.cPtr --> GtkNumberUpLayout.PolyML.cVal)
      val getOrientation_ = call (load_sym libgtk "gtk_print_settings_get_orientation") (GObjectObjectClass.PolyML.cPtr --> GtkPageOrientation.PolyML.cVal)
      val getOutputBin_ = call (load_sym libgtk "gtk_print_settings_get_output_bin") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPageSet_ = call (load_sym libgtk "gtk_print_settings_get_page_set") (GObjectObjectClass.PolyML.cPtr --> GtkPageSet.PolyML.cVal)
      val getPaperHeight_ = call (load_sym libgtk "gtk_print_settings_get_paper_height") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPaperSize_ = call (load_sym libgtk "gtk_print_settings_get_paper_size") (GObjectObjectClass.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getPaperWidth_ = call (load_sym libgtk "gtk_print_settings_get_paper_width") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPrintPages_ = call (load_sym libgtk "gtk_print_settings_get_print_pages") (GObjectObjectClass.PolyML.cPtr --> GtkPrintPages.PolyML.cVal)
      val getPrinter_ = call (load_sym libgtk "gtk_print_settings_get_printer") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPrinterLpi_ = call (load_sym libgtk "gtk_print_settings_get_printer_lpi") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getQuality_ = call (load_sym libgtk "gtk_print_settings_get_quality") (GObjectObjectClass.PolyML.cPtr --> GtkPrintQuality.PolyML.cVal)
      val getResolution_ = call (load_sym libgtk "gtk_print_settings_get_resolution") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getResolutionX_ = call (load_sym libgtk "gtk_print_settings_get_resolution_x") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getResolutionY_ = call (load_sym libgtk "gtk_print_settings_get_resolution_y") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getReverse_ = call (load_sym libgtk "gtk_print_settings_get_reverse") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getScale_ = call (load_sym libgtk "gtk_print_settings_get_scale") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getUseColor_ = call (load_sym libgtk "gtk_print_settings_get_use_color") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasKey_ = call (load_sym libgtk "gtk_print_settings_has_key") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val loadFile_ =
        call (load_sym libgtk "gtk_print_settings_load_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val loadKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_load_key_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val set_ =
        call (load_sym libgtk "gtk_print_settings_set")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setBool_ =
        call (load_sym libgtk "gtk_print_settings_set_bool")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setCollate_ = call (load_sym libgtk "gtk_print_settings_set_collate") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultSource_ = call (load_sym libgtk "gtk_print_settings_set_default_source") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setDither_ = call (load_sym libgtk "gtk_print_settings_set_dither") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setDouble_ =
        call (load_sym libgtk "gtk_print_settings_set_double")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDuplex_ = call (load_sym libgtk "gtk_print_settings_set_duplex") (GObjectObjectClass.PolyML.cPtr &&> GtkPrintDuplex.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFinishings_ = call (load_sym libgtk "gtk_print_settings_set_finishings") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setInt_ =
        call (load_sym libgtk "gtk_print_settings_set_int")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setLength_ =
        call (load_sym libgtk "gtk_print_settings_set_length")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setMediaType_ = call (load_sym libgtk "gtk_print_settings_set_media_type") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setNCopies_ = call (load_sym libgtk "gtk_print_settings_set_n_copies") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNumberUp_ = call (load_sym libgtk "gtk_print_settings_set_number_up") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNumberUpLayout_ = call (load_sym libgtk "gtk_print_settings_set_number_up_layout") (GObjectObjectClass.PolyML.cPtr &&> GtkNumberUpLayout.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOrientation_ = call (load_sym libgtk "gtk_print_settings_set_orientation") (GObjectObjectClass.PolyML.cPtr &&> GtkPageOrientation.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOutputBin_ = call (load_sym libgtk "gtk_print_settings_set_output_bin") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setPageSet_ = call (load_sym libgtk "gtk_print_settings_set_page_set") (GObjectObjectClass.PolyML.cPtr &&> GtkPageSet.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPaperHeight_ =
        call (load_sym libgtk "gtk_print_settings_set_paper_height")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setPaperSize_ = call (load_sym libgtk "gtk_print_settings_set_paper_size") (GObjectObjectClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setPaperWidth_ =
        call (load_sym libgtk "gtk_print_settings_set_paper_width")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setPrintPages_ = call (load_sym libgtk "gtk_print_settings_set_print_pages") (GObjectObjectClass.PolyML.cPtr &&> GtkPrintPages.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPrinter_ = call (load_sym libgtk "gtk_print_settings_set_printer") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setPrinterLpi_ = call (load_sym libgtk "gtk_print_settings_set_printer_lpi") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setQuality_ = call (load_sym libgtk "gtk_print_settings_set_quality") (GObjectObjectClass.PolyML.cPtr &&> GtkPrintQuality.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResolution_ = call (load_sym libgtk "gtk_print_settings_set_resolution") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResolutionXy_ =
        call (load_sym libgtk "gtk_print_settings_set_resolution_xy")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setReverse_ = call (load_sym libgtk "gtk_print_settings_set_reverse") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScale_ = call (load_sym libgtk "gtk_print_settings_set_scale") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseColor_ = call (load_sym libgtk "gtk_print_settings_set_use_color") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val toFile_ =
        call (load_sym libgtk "gtk_print_settings_to_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_to_key_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val unset_ = call (load_sym libgtk "gtk_print_settings_unset") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkPrintSettingsClass.t
    type print_duplex_t = GtkPrintDuplex.t
    type number_up_layout_t = GtkNumberUpLayout.t
    type page_orientation_t = GtkPageOrientation.t
    type page_set_t = GtkPageSet.t
    type paper_size_record_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type print_pages_t = GtkPrintPages.t
    type print_quality_t = GtkPrintQuality.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPrintSettingsClass.C.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GtkPrintSettingsClass.C.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPrintSettingsClass.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkPrintSettingsClass.C.fromPtr true) copy_ self
    fun get self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) get_ (self & key)
    fun getBool self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getBool_ (self & key)
    fun getCollate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCollate_ self
    fun getDefaultSource self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultSource_ self
    fun getDither self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDither_ self
    fun getDouble self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Double.C.fromVal) getDouble_ (self & key)
    fun getDoubleWithDefault self key def =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun getFinishings self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getFinishings_ self
    fun getInt self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getInt_ (self & key)
    fun getIntWithDefault self key def =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
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
         &&&> Utf8.C.withPtr
         &&&> GtkUnit.C.withVal
         ---> FFI.Double.C.fromVal
      )
        getLength_
        (
          self
           & key
           & unit
        )
    fun getMediaType self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getMediaType_ self
    fun getNCopies self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNCopies_ self
    fun getNumberUp self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNumberUp_ self
    fun getNumberUpLayout self = (GObjectObjectClass.C.withPtr ---> GtkNumberUpLayout.C.fromVal) getNumberUpLayout_ self
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getOutputBin self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getOutputBin_ self
    fun getPageSet self = (GObjectObjectClass.C.withPtr ---> GtkPageSet.C.fromVal) getPageSet_ self
    fun getPaperHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GObjectObjectClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperWidth_ (self & unit)
    fun getPrintPages self = (GObjectObjectClass.C.withPtr ---> GtkPrintPages.C.fromVal) getPrintPages_ self
    fun getPrinter self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPrinter_ self
    fun getPrinterLpi self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getPrinterLpi_ self
    fun getQuality self = (GObjectObjectClass.C.withPtr ---> GtkPrintQuality.C.fromVal) getQuality_ self
    fun getResolution self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolution_ self
    fun getResolutionX self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolutionX_ self
    fun getResolutionY self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolutionY_ self
    fun getReverse self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReverse_ self
    fun getScale self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getScale_ self
    fun getUseColor self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseColor_ self
    fun hasKey self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasKey_ (self & key)
    fun loadFile self fileName =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
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
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
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
         &&&> Utf8.C.withPtr
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
    fun setDefaultSource self defaultSource = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDefaultSource_ (self & defaultSource)
    fun setDither self dither = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDither_ (self & dither)
    fun setDouble self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
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
    fun setFinishings self finishings = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFinishings_ (self & finishings)
    fun setInt self key value =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
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
         &&&> Utf8.C.withPtr
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
    fun setMediaType self mediaType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMediaType_ (self & mediaType)
    fun setNCopies self numCopies = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNCopies_ (self & numCopies)
    fun setNumberUp self numberUp = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNumberUp_ (self & numberUp)
    fun setNumberUpLayout self numberUpLayout = (GObjectObjectClass.C.withPtr &&&> GtkNumberUpLayout.C.withVal ---> I) setNumberUpLayout_ (self & numberUpLayout)
    fun setOrientation self orientation = (GObjectObjectClass.C.withPtr &&&> GtkPageOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    fun setOutputBin self outputBin = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setOutputBin_ (self & outputBin)
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
    fun setPrinter self printer = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPrinter_ (self & printer)
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
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
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
         &&&> Utf8.C.withPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun unset self key = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) unset_ (self & key)
  end
