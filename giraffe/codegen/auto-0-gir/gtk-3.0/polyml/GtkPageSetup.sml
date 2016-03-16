structure GtkPageSetup :>
  GTK_PAGE_SETUP
    where type 'a class_t = 'a GtkPageSetupClass.t
    where type page_orientation_t = GtkPageOrientation.t
    where type paper_size_record_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_page_setup_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_page_setup_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newFromFile_ = call (load_sym libgtk "gtk_page_setup_new_from_file") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_page_setup_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val copy_ = call (load_sym libgtk "gtk_page_setup_copy") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBottomMargin_ = call (load_sym libgtk "gtk_page_setup_get_bottom_margin") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getLeftMargin_ = call (load_sym libgtk "gtk_page_setup_get_left_margin") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getOrientation_ = call (load_sym libgtk "gtk_page_setup_get_orientation") (GObjectObjectClass.PolyML.cPtr --> GtkPageOrientation.PolyML.cVal)
      val getPageHeight_ = call (load_sym libgtk "gtk_page_setup_get_page_height") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPageWidth_ = call (load_sym libgtk "gtk_page_setup_get_page_width") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPaperHeight_ = call (load_sym libgtk "gtk_page_setup_get_paper_height") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getPaperSize_ = call (load_sym libgtk "gtk_page_setup_get_paper_size") (GObjectObjectClass.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getPaperWidth_ = call (load_sym libgtk "gtk_page_setup_get_paper_width") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getRightMargin_ = call (load_sym libgtk "gtk_page_setup_get_right_margin") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getTopMargin_ = call (load_sym libgtk "gtk_page_setup_get_top_margin") (GObjectObjectClass.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val loadFile_ =
        call (load_sym libgtk "gtk_page_setup_load_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val loadKeyFile_ =
        call (load_sym libgtk "gtk_page_setup_load_key_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setBottomMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_bottom_margin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setLeftMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_left_margin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setOrientation_ = call (load_sym libgtk "gtk_page_setup_set_orientation") (GObjectObjectClass.PolyML.cPtr &&> GtkPageOrientation.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPaperSize_ = call (load_sym libgtk "gtk_page_setup_set_paper_size") (GObjectObjectClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setPaperSizeAndDefaultMargins_ = call (load_sym libgtk "gtk_page_setup_set_paper_size_and_default_margins") (GObjectObjectClass.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setRightMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_right_margin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setTopMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_top_margin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val toFile_ =
        call (load_sym libgtk "gtk_page_setup_to_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_page_setup_to_key_file")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class_t = 'a GtkPageSetupClass.t
    type page_orientation_t = GtkPageOrientation.t
    type paper_size_record_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPageSetupClass.C.fromPtr true) new_ ()
    fun newFromFile fileName = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GtkPageSetupClass.C.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPageSetupClass.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr true) copy_ self
    fun getBottomMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getBottomMargin_ (self & unit)
    fun getLeftMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getLeftMargin_ (self & unit)
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getPageHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPageHeight_ (self & unit)
    fun getPageWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPageWidth_ (self & unit)
    fun getPaperHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GObjectObjectClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getPaperWidth_ (self & unit)
    fun getRightMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getRightMargin_ (self & unit)
    fun getTopMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getTopMargin_ (self & unit)
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
    fun setBottomMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setBottomMargin_
        (
          self
           & margin
           & unit
        )
    fun setLeftMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setLeftMargin_
        (
          self
           & margin
           & unit
        )
    fun setOrientation self orientation = (GObjectObjectClass.C.withPtr &&&> GtkPageOrientation.C.withVal ---> I) setOrientation_ (self & orientation)
    fun setPaperSize self size = (GObjectObjectClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSize_ (self & size)
    fun setPaperSizeAndDefaultMargins self size = (GObjectObjectClass.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> I) setPaperSizeAndDefaultMargins_ (self & size)
    fun setRightMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setRightMargin_
        (
          self
           & margin
           & unit
        )
    fun setTopMargin self margin unit =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
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
  end
