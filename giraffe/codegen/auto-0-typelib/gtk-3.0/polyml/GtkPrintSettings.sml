structure GtkPrintSettings :>
  GTK_PRINT_SETTINGS
    where type 'a class = 'a GtkPrintSettingsClass.class
    where type print_duplex_t = GtkPrintDuplex.t
    where type number_up_layout_t = GtkNumberUpLayout.t
    where type page_orientation_t = GtkPageOrientation.t
    where type page_set_t = GtkPageSet.t
    where type paper_size_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t
    where type print_pages_t = GtkPrintPages.t
    where type print_quality_t = GtkPrintQuality.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_print_settings_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_print_settings_new") (FFI.PolyML.cVoid --> GtkPrintSettingsClass.PolyML.cPtr)
      val newFromFile_ = call (load_sym libgtk "gtk_print_settings_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GtkPrintSettingsClass.PolyML.cPtr)
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPrintSettingsClass.PolyML.cPtr
          )
      val copy_ = call (load_sym libgtk "gtk_print_settings_copy") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintSettingsClass.PolyML.cPtr)
      val get_ = call (load_sym libgtk "gtk_print_settings_get") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getBool_ = call (load_sym libgtk "gtk_print_settings_get_bool") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val getCollate_ = call (load_sym libgtk "gtk_print_settings_get_collate") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDefaultSource_ = call (load_sym libgtk "gtk_print_settings_get_default_source") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDither_ = call (load_sym libgtk "gtk_print_settings_get_dither") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDouble_ = call (load_sym libgtk "gtk_print_settings_get_double") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Double.PolyML.cVal)
      val getDoubleWithDefault_ =
        call (load_sym libgtk "gtk_print_settings_get_double_with_default")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             --> FFI.Double.PolyML.cVal
          )
      val getDuplex_ = call (load_sym libgtk "gtk_print_settings_get_duplex") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintDuplex.PolyML.cVal)
      val getFinishings_ = call (load_sym libgtk "gtk_print_settings_get_finishings") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getInt_ = call (load_sym libgtk "gtk_print_settings_get_int") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Int32.PolyML.cVal)
      val getIntWithDefault_ =
        call (load_sym libgtk "gtk_print_settings_get_int_with_default")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getLength_ =
        call (load_sym libgtk "gtk_print_settings_get_length")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkUnit.PolyML.cVal
             --> FFI.Double.PolyML.cVal
          )
      val getMediaType_ = call (load_sym libgtk "gtk_print_settings_get_media_type") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNCopies_ = call (load_sym libgtk "gtk_print_settings_get_n_copies") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNumberUp_ = call (load_sym libgtk "gtk_print_settings_get_number_up") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNumberUpLayout_ = call (load_sym libgtk "gtk_print_settings_get_number_up_layout") (GtkPrintSettingsClass.PolyML.cPtr --> GtkNumberUpLayout.PolyML.cVal)
      val getOrientation_ = call (load_sym libgtk "gtk_print_settings_get_orientation") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPageOrientation.PolyML.cVal)
      val getOutputBin_ = call (load_sym libgtk "gtk_print_settings_get_output_bin") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPageSet_ = call (load_sym libgtk "gtk_print_settings_get_page_set") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPageSet.PolyML.cVal)
      val getPaperHeight_ = call (load_sym libgtk "gtk_print_settings_get_paper_height") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPaperSize_ = call (load_sym libgtk "gtk_print_settings_get_paper_size") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getPaperWidth_ = call (load_sym libgtk "gtk_print_settings_get_paper_width") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPrintPages_ = call (load_sym libgtk "gtk_print_settings_get_print_pages") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintPages.PolyML.cVal)
      val getPrinter_ = call (load_sym libgtk "gtk_print_settings_get_printer") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPrinterLpi_ = call (load_sym libgtk "gtk_print_settings_get_printer_lpi") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getQuality_ = call (load_sym libgtk "gtk_print_settings_get_quality") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintQuality.PolyML.cVal)
      val getResolution_ = call (load_sym libgtk "gtk_print_settings_get_resolution") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getResolutionX_ = call (load_sym libgtk "gtk_print_settings_get_resolution_x") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getResolutionY_ = call (load_sym libgtk "gtk_print_settings_get_resolution_y") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getReverse_ = call (load_sym libgtk "gtk_print_settings_get_reverse") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getScale_ = call (load_sym libgtk "gtk_print_settings_get_scale") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getUseColor_ = call (load_sym libgtk "gtk_print_settings_get_use_color") (GtkPrintSettingsClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasKey_ = call (load_sym libgtk "gtk_print_settings_has_key") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val loadFile_ =
        call (load_sym libgtk "gtk_print_settings_load_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val loadKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_load_key_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val set_ =
        call (load_sym libgtk "gtk_print_settings_set")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setBool_ =
        call (load_sym libgtk "gtk_print_settings_set_bool")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setCollate_ = call (load_sym libgtk "gtk_print_settings_set_collate") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDefaultSource_ = call (load_sym libgtk "gtk_print_settings_set_default_source") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setDither_ = call (load_sym libgtk "gtk_print_settings_set_dither") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setDouble_ =
        call (load_sym libgtk "gtk_print_settings_set_double")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDuplex_ = call (load_sym libgtk "gtk_print_settings_set_duplex") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPrintDuplex.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFinishings_ = call (load_sym libgtk "gtk_print_settings_set_finishings") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setInt_ =
        call (load_sym libgtk "gtk_print_settings_set_int")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setLength_ =
        call (load_sym libgtk "gtk_print_settings_set_length")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setMediaType_ = call (load_sym libgtk "gtk_print_settings_set_media_type") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setNCopies_ = call (load_sym libgtk "gtk_print_settings_set_n_copies") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNumberUp_ = call (load_sym libgtk "gtk_print_settings_set_number_up") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNumberUpLayout_ = call (load_sym libgtk "gtk_print_settings_set_number_up_layout") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkNumberUpLayout.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOrientation_ = call (load_sym libgtk "gtk_print_settings_set_orientation") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPageOrientation.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOutputBin_ = call (load_sym libgtk "gtk_print_settings_set_output_bin") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setPageSet_ = call (load_sym libgtk "gtk_print_settings_set_page_set") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPageSet.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPaperHeight_ =
        call (load_sym libgtk "gtk_print_settings_set_paper_height")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setPaperSize_ = call (load_sym libgtk "gtk_print_settings_set_paper_size") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setPaperWidth_ =
        call (load_sym libgtk "gtk_print_settings_set_paper_width")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setPrintPages_ = call (load_sym libgtk "gtk_print_settings_set_print_pages") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPrintPages.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPrinter_ = call (load_sym libgtk "gtk_print_settings_set_printer") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setPrinterLpi_ = call (load_sym libgtk "gtk_print_settings_set_printer_lpi") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setQuality_ = call (load_sym libgtk "gtk_print_settings_set_quality") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPrintQuality.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResolution_ = call (load_sym libgtk "gtk_print_settings_set_resolution") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResolutionXy_ =
        call (load_sym libgtk "gtk_print_settings_set_resolution_xy")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setReverse_ = call (load_sym libgtk "gtk_print_settings_set_reverse") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScale_ = call (load_sym libgtk "gtk_print_settings_set_scale") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseColor_ = call (load_sym libgtk "gtk_print_settings_set_use_color") (GtkPrintSettingsClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val toFile_ =
        call (load_sym libgtk "gtk_print_settings_to_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_print_settings_to_key_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val unset_ = call (load_sym libgtk "gtk_print_settings_unset") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkPrintSettingsClass.class
    type print_duplex_t = GtkPrintDuplex.t
    type number_up_layout_t = GtkNumberUpLayout.t
    type page_orientation_t = GtkPageOrientation.t
    type page_set_t = GtkPageSet.t
    type paper_size_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type print_pages_t = GtkPrintPages.t
    type print_quality_t = GtkPrintQuality.t
    type t = base class
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
    fun copy self = (GtkPrintSettingsClass.C.withPtr ---> GtkPrintSettingsClass.C.fromPtr true) copy_ self
    fun get self key = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) get_ (self & key)
    fun getBool self key = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getBool_ (self & key)
    fun getCollate self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Bool.C.fromVal) getCollate_ self
    fun getDefaultSource self = (GtkPrintSettingsClass.C.withPtr ---> Utf8.C.fromPtr false) getDefaultSource_ self
    fun getDither self = (GtkPrintSettingsClass.C.withPtr ---> Utf8.C.fromPtr false) getDither_ self
    fun getDouble self key = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Double.C.fromVal) getDouble_ (self & key)
    fun getDoubleWithDefault self key def =
      (
        GtkPrintSettingsClass.C.withPtr
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
    fun getDuplex self = (GtkPrintSettingsClass.C.withPtr ---> GtkPrintDuplex.C.fromVal) getDuplex_ self
    fun getFinishings self = (GtkPrintSettingsClass.C.withPtr ---> Utf8.C.fromPtr false) getFinishings_ self
    fun getInt self key = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Int32.C.fromVal) getInt_ (self & key)
    fun getIntWithDefault self key def =
      (
        GtkPrintSettingsClass.C.withPtr
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
        GtkPrintSettingsClass.C.withPtr
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
    fun getMediaType self = (GtkPrintSettingsClass.C.withPtr ---> Utf8.C.fromPtr false) getMediaType_ self
    fun getNCopies self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Int32.C.fromVal) getNCopies_ self
    fun getNumberUp self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Int32.C.fromVal) getNumberUp_ self
    fun getNumberUpLayout self = (GtkPrintSettingsClass.C.withPtr ---> GtkNumberUpLayout.C.fromVal) getNumberUpLayout_ self
    fun getOrientation self = (GtkPrintSettingsClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getOutputBin self = (GtkPrintSettingsClass.C.withPtr ---> Utf8.C.fromPtr false) getOutputBin_ self
    fun getPageSet self = (GtkPrintSettingsClass.C.withPtr ---> GtkPageSet.C.fromVal) getPageSet_ self
    fun getPaperHeight self unit = (GtkPrintSettingsClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GtkPrintSettingsClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GtkPrintSettingsClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperWidth_ (self & unit)
    fun getPrintPages self = (GtkPrintSettingsClass.C.withPtr ---> GtkPrintPages.C.fromVal) getPrintPages_ self
    fun getPrinter self = (GtkPrintSettingsClass.C.withPtr ---> Utf8.C.fromPtr false) getPrinter_ self
    fun getPrinterLpi self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Double.C.fromVal) getPrinterLpi_ self
    fun getQuality self = (GtkPrintSettingsClass.C.withPtr ---> GtkPrintQuality.C.fromVal) getQuality_ self
    fun getResolution self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolution_ self
    fun getResolutionX self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolutionX_ self
    fun getResolutionY self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Int32.C.fromVal) getResolutionY_ self
    fun getReverse self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Bool.C.fromVal) getReverse_ self
    fun getScale self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Double.C.fromVal) getScale_ self
    fun getUseColor self = (GtkPrintSettingsClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseColor_ self
    fun hasKey self key = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasKey_ (self & key)
    fun loadFile self fileName =
      (
        GtkPrintSettingsClass.C.withPtr
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
        GtkPrintSettingsClass.C.withPtr
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
        GtkPrintSettingsClass.C.withPtr
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
        GtkPrintSettingsClass.C.withPtr
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
    fun setCollate self collate = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCollate_ (self & collate)
    fun setDefaultSource self defaultSource = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDefaultSource_ (self & defaultSource)
    fun setDither self dither = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setDither_ (self & dither)
    fun setDouble self key value =
      (
        GtkPrintSettingsClass.C.withPtr
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
    fun setDuplex self duplex = (GtkPrintSettingsClass.C.withPtr &&&> GtkPrintDuplex.C.withVal ---> I) setDuplex_ (self & duplex)
    fun setFinishings self finishings = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFinishings_ (self & finishings)
    fun setInt self key value =
      (
        GtkPrintSettingsClass.C.withPtr
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
        GtkPrintSettingsClass.C.withPtr
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
    fun setMediaType self mediaType = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMediaType_ (self & mediaType)
    fun setNCopies self numCopies = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNCopies_ (self & numCopies)
    fun setNumberUp self numberUp = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setNumberUp_ (self & numberUp)
    fun setNumberUpLayout self numberUpLayout = (GtkPrintSettingsClass.C.withPtr &&&> GtkNumberUpLayout.C.withVal ---> I) setNumberUpLayout_ (self & numberUpLayout)
    fun setOrientation self orientation = (GtkPrintSettingsClass.C.withPtr &&&> GtkPageOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    fun setOutputBin self outputBin = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setOutputBin_ (self & outputBin)
    fun setPageSet self pageSet = (GtkPrintSettingsClass.C.withPtr &&&> GtkPageSet.C.withVal ---> I) setPageSet_ (self & pageSet)
    fun setPaperHeight self height unit =
      (
        GtkPrintSettingsClass.C.withPtr
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
    fun setPaperSize self paperSize = (GtkPrintSettingsClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSize_ (self & paperSize)
    fun setPaperWidth self width unit =
      (
        GtkPrintSettingsClass.C.withPtr
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
    fun setPrintPages self pages = (GtkPrintSettingsClass.C.withPtr &&&> GtkPrintPages.C.withVal ---> I) setPrintPages_ (self & pages)
    fun setPrinter self printer = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPrinter_ (self & printer)
    fun setPrinterLpi self lpi = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setPrinterLpi_ (self & lpi)
    fun setQuality self quality = (GtkPrintSettingsClass.C.withPtr &&&> GtkPrintQuality.C.withVal ---> I) setQuality_ (self & quality)
    fun setResolution self resolution = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setResolution_ (self & resolution)
    fun setResolutionXy self resolutionX resolutionY =
      (
        GtkPrintSettingsClass.C.withPtr
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
    fun setReverse self reverse = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReverse_ (self & reverse)
    fun setScale self scale = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setScale_ (self & scale)
    fun setUseColor self useColor = (GtkPrintSettingsClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseColor_ (self & useColor)
    fun toFile self fileName =
      (
        GtkPrintSettingsClass.C.withPtr
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
        GtkPrintSettingsClass.C.withPtr
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
    fun unset self key = (GtkPrintSettingsClass.C.withPtr &&&> Utf8.C.withPtr ---> I) unset_ (self & key)
  end
