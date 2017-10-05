structure GtkPrintSettings :>
  GTK_PRINT_SETTINGS
    where type 'a class = 'a GtkPrintSettingsClass.class
    where type print_duplex_t = GtkPrintDuplex.t
    where type number_up_layout_t = GtkNumberUpLayout.t
    where type page_orientation_t = GtkPageOrientation.t
    where type page_range_t = GtkPageRangeRecord.t
    where type page_set_t = GtkPageSet.t
    where type paper_size_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t
    where type print_pages_t = GtkPrintPages.t
    where type print_quality_t = GtkPrintQuality.t =
  struct
    structure GtkPageRangeRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GtkPageRangeRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GtkPageRangeRecordCVectorN = CVectorN(GtkPageRangeRecordCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_settings_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_print_settings_new") (cVoid --> GtkPrintSettingsClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_print_settings_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GtkPrintSettingsClass.PolyML.cPtr)
      val newFromKeyFile_ =
        call (getSymbol "gtk_print_settings_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPrintSettingsClass.PolyML.cPtr
          )
      val copy_ = call (getSymbol "gtk_print_settings_copy") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintSettingsClass.PolyML.cPtr)
      val get_ = call (getSymbol "gtk_print_settings_get") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getBool_ = call (getSymbol "gtk_print_settings_get_bool") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getCollate_ = call (getSymbol "gtk_print_settings_get_collate") (GtkPrintSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDefaultSource_ = call (getSymbol "gtk_print_settings_get_default_source") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDither_ = call (getSymbol "gtk_print_settings_get_dither") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDouble_ = call (getSymbol "gtk_print_settings_get_double") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GDouble.PolyML.cVal)
      val getDoubleWithDefault_ =
        call (getSymbol "gtk_print_settings_get_double_with_default")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             --> GDouble.PolyML.cVal
          )
      val getDuplex_ = call (getSymbol "gtk_print_settings_get_duplex") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintDuplex.PolyML.cVal)
      val getFinishings_ = call (getSymbol "gtk_print_settings_get_finishings") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getInt_ = call (getSymbol "gtk_print_settings_get_int") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GInt.PolyML.cVal)
      val getIntWithDefault_ =
        call (getSymbol "gtk_print_settings_get_int_with_default")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val getLength_ =
        call (getSymbol "gtk_print_settings_get_length")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkUnit.PolyML.cVal
             --> GDouble.PolyML.cVal
          )
      val getMediaType_ = call (getSymbol "gtk_print_settings_get_media_type") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNCopies_ = call (getSymbol "gtk_print_settings_get_n_copies") (GtkPrintSettingsClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNumberUp_ = call (getSymbol "gtk_print_settings_get_number_up") (GtkPrintSettingsClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNumberUpLayout_ = call (getSymbol "gtk_print_settings_get_number_up_layout") (GtkPrintSettingsClass.PolyML.cPtr --> GtkNumberUpLayout.PolyML.cVal)
      val getOrientation_ = call (getSymbol "gtk_print_settings_get_orientation") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPageOrientation.PolyML.cVal)
      val getOutputBin_ = call (getSymbol "gtk_print_settings_get_output_bin") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPageRanges_ = call (getSymbol "gtk_print_settings_get_page_ranges") (GtkPrintSettingsClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GtkPageRangeRecordCVectorN.PolyML.cOutPtr)
      val getPageSet_ = call (getSymbol "gtk_print_settings_get_page_set") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPageSet.PolyML.cVal)
      val getPaperHeight_ = call (getSymbol "gtk_print_settings_get_paper_height") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getPaperSize_ = call (getSymbol "gtk_print_settings_get_paper_size") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getPaperWidth_ = call (getSymbol "gtk_print_settings_get_paper_width") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getPrintPages_ = call (getSymbol "gtk_print_settings_get_print_pages") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintPages.PolyML.cVal)
      val getPrinter_ = call (getSymbol "gtk_print_settings_get_printer") (GtkPrintSettingsClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPrinterLpi_ = call (getSymbol "gtk_print_settings_get_printer_lpi") (GtkPrintSettingsClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getQuality_ = call (getSymbol "gtk_print_settings_get_quality") (GtkPrintSettingsClass.PolyML.cPtr --> GtkPrintQuality.PolyML.cVal)
      val getResolution_ = call (getSymbol "gtk_print_settings_get_resolution") (GtkPrintSettingsClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getResolutionX_ = call (getSymbol "gtk_print_settings_get_resolution_x") (GtkPrintSettingsClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getResolutionY_ = call (getSymbol "gtk_print_settings_get_resolution_y") (GtkPrintSettingsClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getReverse_ = call (getSymbol "gtk_print_settings_get_reverse") (GtkPrintSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getScale_ = call (getSymbol "gtk_print_settings_get_scale") (GtkPrintSettingsClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getUseColor_ = call (getSymbol "gtk_print_settings_get_use_color") (GtkPrintSettingsClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasKey_ = call (getSymbol "gtk_print_settings_has_key") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val loadFile_ =
        call (getSymbol "gtk_print_settings_load_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadKeyFile_ =
        call (getSymbol "gtk_print_settings_load_key_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val set_ =
        call (getSymbol "gtk_print_settings_set")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setBool_ =
        call (getSymbol "gtk_print_settings_set_bool")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setCollate_ = call (getSymbol "gtk_print_settings_set_collate") (GtkPrintSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setDefaultSource_ = call (getSymbol "gtk_print_settings_set_default_source") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDither_ = call (getSymbol "gtk_print_settings_set_dither") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDouble_ =
        call (getSymbol "gtk_print_settings_set_double")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             --> cVoid
          )
      val setDuplex_ = call (getSymbol "gtk_print_settings_set_duplex") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPrintDuplex.PolyML.cVal --> cVoid)
      val setFinishings_ = call (getSymbol "gtk_print_settings_set_finishings") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setInt_ =
        call (getSymbol "gtk_print_settings_set_int")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setLength_ =
        call (getSymbol "gtk_print_settings_set_length")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setMediaType_ = call (getSymbol "gtk_print_settings_set_media_type") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setNCopies_ = call (getSymbol "gtk_print_settings_set_n_copies") (GtkPrintSettingsClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setNumberUp_ = call (getSymbol "gtk_print_settings_set_number_up") (GtkPrintSettingsClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setNumberUpLayout_ = call (getSymbol "gtk_print_settings_set_number_up_layout") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkNumberUpLayout.PolyML.cVal --> cVoid)
      val setOrientation_ = call (getSymbol "gtk_print_settings_set_orientation") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPageOrientation.PolyML.cVal --> cVoid)
      val setOutputBin_ = call (getSymbol "gtk_print_settings_set_output_bin") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setPageRanges_ =
        call (getSymbol "gtk_print_settings_set_page_ranges")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GtkPageRangeRecordCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setPageSet_ = call (getSymbol "gtk_print_settings_set_page_set") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPageSet.PolyML.cVal --> cVoid)
      val setPaperHeight_ =
        call (getSymbol "gtk_print_settings_set_paper_height")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setPaperSize_ = call (getSymbol "gtk_print_settings_set_paper_size") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> cVoid)
      val setPaperWidth_ =
        call (getSymbol "gtk_print_settings_set_paper_width")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setPrintPages_ = call (getSymbol "gtk_print_settings_set_print_pages") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPrintPages.PolyML.cVal --> cVoid)
      val setPrinter_ = call (getSymbol "gtk_print_settings_set_printer") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setPrinterLpi_ = call (getSymbol "gtk_print_settings_set_printer_lpi") (GtkPrintSettingsClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setQuality_ = call (getSymbol "gtk_print_settings_set_quality") (GtkPrintSettingsClass.PolyML.cPtr &&> GtkPrintQuality.PolyML.cVal --> cVoid)
      val setResolution_ = call (getSymbol "gtk_print_settings_set_resolution") (GtkPrintSettingsClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setResolutionXy_ =
        call (getSymbol "gtk_print_settings_set_resolution_xy")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setReverse_ = call (getSymbol "gtk_print_settings_set_reverse") (GtkPrintSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScale_ = call (getSymbol "gtk_print_settings_set_scale") (GtkPrintSettingsClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setUseColor_ = call (getSymbol "gtk_print_settings_set_use_color") (GtkPrintSettingsClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val toFile_ =
        call (getSymbol "gtk_print_settings_to_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val toKeyFile_ =
        call (getSymbol "gtk_print_settings_to_key_file")
          (
            GtkPrintSettingsClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val unset_ = call (getSymbol "gtk_print_settings_unset") (GtkPrintSettingsClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkPrintSettingsClass.class
    type print_duplex_t = GtkPrintDuplex.t
    type number_up_layout_t = GtkNumberUpLayout.t
    type page_orientation_t = GtkPageOrientation.t
    type page_range_t = GtkPageRangeRecord.t
    type page_set_t = GtkPageSet.t
    type paper_size_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type print_pages_t = GtkPrintPages.t
    type print_quality_t = GtkPrintQuality.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPrintSettingsClass.FFI.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GtkPrintSettingsClass.FFI.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile (keyFile, groupName) =
      (
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPrintSettingsClass.FFI.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPrintSettingsClass.FFI.fromPtr true) copy_ self
    fun get self key = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) get_ (self & key)
    fun getBool self key = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getBool_ (self & key)
    fun getCollate self = (GtkPrintSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getCollate_ self
    fun getDefaultSource self = (GtkPrintSettingsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDefaultSource_ self
    fun getDither self = (GtkPrintSettingsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDither_ self
    fun getDouble self key = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GDouble.FFI.fromVal) getDouble_ (self & key)
    fun getDoubleWithDefault self (key, def) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> GDouble.FFI.fromVal
      )
        getDoubleWithDefault_
        (
          self
           & key
           & def
        )
    fun getDuplex self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPrintDuplex.FFI.fromVal) getDuplex_ self
    fun getFinishings self = (GtkPrintSettingsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFinishings_ self
    fun getInt self key = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GInt.FFI.fromVal) getInt_ (self & key)
    fun getIntWithDefault self (key, def) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        getIntWithDefault_
        (
          self
           & key
           & def
        )
    fun getLength self (key, unit) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkUnit.FFI.withVal
         ---> GDouble.FFI.fromVal
      )
        getLength_
        (
          self
           & key
           & unit
        )
    fun getMediaType self = (GtkPrintSettingsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMediaType_ self
    fun getNCopies self = (GtkPrintSettingsClass.FFI.withPtr ---> GInt.FFI.fromVal) getNCopies_ self
    fun getNumberUp self = (GtkPrintSettingsClass.FFI.withPtr ---> GInt.FFI.fromVal) getNumberUp_ self
    fun getNumberUpLayout self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkNumberUpLayout.FFI.fromVal) getNumberUpLayout_ self
    fun getOrientation self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPageOrientation.FFI.fromVal) getOrientation_ self
    fun getOutputBin self = (GtkPrintSettingsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getOutputBin_ self
    fun getPageRanges self =
      let
        val numRanges & retVal = (GtkPrintSettingsClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GtkPageRangeRecordCVectorN.FFI.fromPtr 1) getPageRanges_ (self & GInt.null)
      in
        retVal (LargeInt.toInt numRanges)
      end
    fun getPageSet self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPageSet.FFI.fromVal) getPageSet_ self
    fun getPaperHeight self unit = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPaperSizeRecord.FFI.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperWidth_ (self & unit)
    fun getPrintPages self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPrintPages.FFI.fromVal) getPrintPages_ self
    fun getPrinter self = (GtkPrintSettingsClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPrinter_ self
    fun getPrinterLpi self = (GtkPrintSettingsClass.FFI.withPtr ---> GDouble.FFI.fromVal) getPrinterLpi_ self
    fun getQuality self = (GtkPrintSettingsClass.FFI.withPtr ---> GtkPrintQuality.FFI.fromVal) getQuality_ self
    fun getResolution self = (GtkPrintSettingsClass.FFI.withPtr ---> GInt.FFI.fromVal) getResolution_ self
    fun getResolutionX self = (GtkPrintSettingsClass.FFI.withPtr ---> GInt.FFI.fromVal) getResolutionX_ self
    fun getResolutionY self = (GtkPrintSettingsClass.FFI.withPtr ---> GInt.FFI.fromVal) getResolutionY_ self
    fun getReverse self = (GtkPrintSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getReverse_ self
    fun getScale self = (GtkPrintSettingsClass.FFI.withPtr ---> GDouble.FFI.fromVal) getScale_ self
    fun getUseColor self = (GtkPrintSettingsClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseColor_ self
    fun hasKey self key = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasKey_ (self & key)
    fun loadFile self fileName =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        GtkPrintSettingsClass.FFI.withPtr
         &&&> GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
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
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
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
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setBool_
        (
          self
           & key
           & value
        )
    fun setCollate self collate = (GtkPrintSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCollate_ (self & collate)
    fun setDefaultSource self defaultSource = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDefaultSource_ (self & defaultSource)
    fun setDither self dither = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDither_ (self & dither)
    fun setDouble self (key, value) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> I
      )
        setDouble_
        (
          self
           & key
           & value
        )
    fun setDuplex self duplex = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkPrintDuplex.FFI.withVal ---> I) setDuplex_ (self & duplex)
    fun setFinishings self finishings = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFinishings_ (self & finishings)
    fun setInt self (key, value) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
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
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun setMediaType self mediaType = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMediaType_ (self & mediaType)
    fun setNCopies self numCopies = (GtkPrintSettingsClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setNCopies_ (self & numCopies)
    fun setNumberUp self numberUp = (GtkPrintSettingsClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setNumberUp_ (self & numberUp)
    fun setNumberUpLayout self numberUpLayout = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkNumberUpLayout.FFI.withVal ---> I) setNumberUpLayout_ (self & numberUpLayout)
    fun setOrientation self orientation = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkPageOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    fun setOutputBin self outputBin = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setOutputBin_ (self & outputBin)
    fun setPageRanges self pageRanges =
      let
        val numRanges = LargeInt.fromInt (GtkPageRangeRecordCVectorN.length pageRanges)
        val () =
          (
            GtkPrintSettingsClass.FFI.withPtr
             &&&> GtkPageRangeRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
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
    fun setPageSet self pageSet = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkPageSet.FFI.withVal ---> I) setPageSet_ (self & pageSet)
    fun setPaperHeight self (height, unit) =
      (
        GtkPrintSettingsClass.FFI.withPtr
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
    fun setPaperSize self paperSize = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkPaperSizeRecord.FFI.withPtr ---> I) setPaperSize_ (self & paperSize)
    fun setPaperWidth self (width, unit) =
      (
        GtkPrintSettingsClass.FFI.withPtr
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
    fun setPrintPages self pages = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkPrintPages.FFI.withVal ---> I) setPrintPages_ (self & pages)
    fun setPrinter self printer = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPrinter_ (self & printer)
    fun setPrinterLpi self lpi = (GtkPrintSettingsClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setPrinterLpi_ (self & lpi)
    fun setQuality self quality = (GtkPrintSettingsClass.FFI.withPtr &&&> GtkPrintQuality.FFI.withVal ---> I) setQuality_ (self & quality)
    fun setResolution self resolution = (GtkPrintSettingsClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setResolution_ (self & resolution)
    fun setResolutionXy self (resolutionX, resolutionY) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setResolutionXy_
        (
          self
           & resolutionX
           & resolutionY
        )
    fun setReverse self reverse = (GtkPrintSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReverse_ (self & reverse)
    fun setScale self scale = (GtkPrintSettingsClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setScale_ (self & scale)
    fun setUseColor self useColor = (GtkPrintSettingsClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseColor_ (self & useColor)
    fun toFile self fileName =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        toFile_
        (
          self
           & fileName
           & []
        )
    fun toKeyFile self (keyFile, groupName) =
      (
        GtkPrintSettingsClass.FFI.withPtr
         &&&> GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun unset self key = (GtkPrintSettingsClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) unset_ (self & key)
  end
