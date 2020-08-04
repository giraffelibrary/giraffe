structure GtkPageSetup :>
  GTK_PAGE_SETUP
    where type 'a class = 'a GtkPageSetupClass.class
    where type page_orientation_t = GtkPageOrientation.t
    where type paper_size_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_page_setup_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_page_setup_new") (cVoid --> GtkPageSetupClass.PolyML.cPtr)
      val newFromFile_ = call (getSymbol "gtk_page_setup_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GtkPageSetupClass.PolyML.cPtr)
      val newFromGvariant_ = call (getSymbol "gtk_page_setup_new_from_gvariant") (GLibVariantRecord.PolyML.cPtr --> GtkPageSetupClass.PolyML.cPtr)
      val newFromKeyFile_ =
        call (getSymbol "gtk_page_setup_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPageSetupClass.PolyML.cPtr
          )
      val copy_ = call (getSymbol "gtk_page_setup_copy") (GtkPageSetupClass.PolyML.cPtr --> GtkPageSetupClass.PolyML.cPtr)
      val getBottomMargin_ = call (getSymbol "gtk_page_setup_get_bottom_margin") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getLeftMargin_ = call (getSymbol "gtk_page_setup_get_left_margin") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getOrientation_ = call (getSymbol "gtk_page_setup_get_orientation") (GtkPageSetupClass.PolyML.cPtr --> GtkPageOrientation.PolyML.cVal)
      val getPageHeight_ = call (getSymbol "gtk_page_setup_get_page_height") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getPageWidth_ = call (getSymbol "gtk_page_setup_get_page_width") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getPaperHeight_ = call (getSymbol "gtk_page_setup_get_paper_height") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getPaperSize_ = call (getSymbol "gtk_page_setup_get_paper_size") (GtkPageSetupClass.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getPaperWidth_ = call (getSymbol "gtk_page_setup_get_paper_width") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getRightMargin_ = call (getSymbol "gtk_page_setup_get_right_margin") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getTopMargin_ = call (getSymbol "gtk_page_setup_get_top_margin") (GtkPageSetupClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val loadFile_ =
        call (getSymbol "gtk_page_setup_load_file")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val loadKeyFile_ =
        call (getSymbol "gtk_page_setup_load_key_file")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setBottomMargin_ =
        call (getSymbol "gtk_page_setup_set_bottom_margin")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setLeftMargin_ =
        call (getSymbol "gtk_page_setup_set_left_margin")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setOrientation_ = call (getSymbol "gtk_page_setup_set_orientation") (GtkPageSetupClass.PolyML.cPtr &&> GtkPageOrientation.PolyML.cVal --> cVoid)
      val setPaperSize_ = call (getSymbol "gtk_page_setup_set_paper_size") (GtkPageSetupClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> cVoid)
      val setPaperSizeAndDefaultMargins_ = call (getSymbol "gtk_page_setup_set_paper_size_and_default_margins") (GtkPageSetupClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> cVoid)
      val setRightMargin_ =
        call (getSymbol "gtk_page_setup_set_right_margin")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val setTopMargin_ =
        call (getSymbol "gtk_page_setup_set_top_margin")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> cVoid
          )
      val toFile_ =
        call (getSymbol "gtk_page_setup_to_file")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val toGvariant_ = call (getSymbol "gtk_page_setup_to_gvariant") (GtkPageSetupClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val toKeyFile_ =
        call (getSymbol "gtk_page_setup_to_key_file")
          (
            GtkPageSetupClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkPageSetupClass.class
    type page_orientation_t = GtkPageOrientation.t
    type paper_size_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPageSetupClass.FFI.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GtkPageSetupClass.FFI.fromPtr true) newFromFile_ (fileName & [])
    fun newFromGvariant variant = (GLibVariantRecord.FFI.withPtr false ---> GtkPageSetupClass.FFI.fromPtr true) newFromGvariant_ variant
    fun newFromKeyFile (keyFile, groupName) =
      (
        GLibKeyFileRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GtkPageSetupClass.FFI.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GtkPageSetupClass.FFI.withPtr false ---> GtkPageSetupClass.FFI.fromPtr true) copy_ self
    fun getBottomMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getBottomMargin_ (self & unit)
    fun getLeftMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getLeftMargin_ (self & unit)
    fun getOrientation self = (GtkPageSetupClass.FFI.withPtr false ---> GtkPageOrientation.FFI.fromVal) getOrientation_ self
    fun getPageHeight self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPageHeight_ (self & unit)
    fun getPageWidth self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPageWidth_ (self & unit)
    fun getPaperHeight self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GtkPageSetupClass.FFI.withPtr false ---> GtkPaperSizeRecord.FFI.fromPtr false) getPaperSize_ self
    fun getPaperWidth self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getPaperWidth_ (self & unit)
    fun getRightMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getRightMargin_ (self & unit)
    fun getTopMargin self unit = (GtkPageSetupClass.FFI.withPtr false &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getTopMargin_ (self & unit)
    fun loadFile self fileName =
      (
        GtkPageSetupClass.FFI.withPtr false
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
        GtkPageSetupClass.FFI.withPtr false
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
    fun setBottomMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setLeftMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setOrientation self orientation = (GtkPageSetupClass.FFI.withPtr false &&&> GtkPageOrientation.FFI.withVal ---> I) setOrientation_ (self & orientation)
    fun setPaperSize self size = (GtkPageSetupClass.FFI.withPtr false &&&> GtkPaperSizeRecord.FFI.withPtr false ---> I) setPaperSize_ (self & size)
    fun setPaperSizeAndDefaultMargins self size = (GtkPageSetupClass.FFI.withPtr false &&&> GtkPaperSizeRecord.FFI.withPtr false ---> I) setPaperSizeAndDefaultMargins_ (self & size)
    fun setRightMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTopMargin self (margin, unit) =
      (
        GtkPageSetupClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> I
      )
        setTopMargin_
        (
          self
           & margin
           & unit
        )
    fun toFile self fileName =
      (
        GtkPageSetupClass.FFI.withPtr false
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
    fun toGvariant self = (GtkPageSetupClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) toGvariant_ self
    fun toKeyFile self (keyFile, groupName) =
      (
        GtkPageSetupClass.FFI.withPtr false
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
  end
