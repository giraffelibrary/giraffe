structure GtkPageSetup :>
  GTK_PAGE_SETUP
    where type 'a class_t = 'a GtkPageSetupClass.t
    where type pageorientation_t = GtkPageOrientation.t
    where type papersizerecord_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_page_setup_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_page_setup_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newFromFile_ = call (load_sym libgtk "gtk_page_setup_new_from_file") (FFI.PolyML.String.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_page_setup_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val copy_ = call (load_sym libgtk "gtk_page_setup_copy") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getBottomMargin_ = call (load_sym libgtk "gtk_page_setup_get_bottom_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getLeftMargin_ = call (load_sym libgtk "gtk_page_setup_get_left_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getOrientation_ = call (load_sym libgtk "gtk_page_setup_get_orientation") (GObjectObjectClass.PolyML.PTR --> GtkPageOrientation.PolyML.VAL)
      val getPageHeight_ = call (load_sym libgtk "gtk_page_setup_get_page_height") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getPageWidth_ = call (load_sym libgtk "gtk_page_setup_get_page_width") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getPaperHeight_ = call (load_sym libgtk "gtk_page_setup_get_paper_height") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getPaperSize_ = call (load_sym libgtk "gtk_page_setup_get_paper_size") (GObjectObjectClass.PolyML.PTR --> GtkPaperSizeRecord.PolyML.PTR)
      val getPaperWidth_ = call (load_sym libgtk "gtk_page_setup_get_paper_width") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getRightMargin_ = call (load_sym libgtk "gtk_page_setup_get_right_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getTopMargin_ = call (load_sym libgtk "gtk_page_setup_get_top_margin") (GObjectObjectClass.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val loadFile_ =
        call (load_sym libgtk "gtk_page_setup_load_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val loadKeyFile_ =
        call (load_sym libgtk "gtk_page_setup_load_key_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibKeyFileRecord.PolyML.PTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setBottomMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_bottom_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setLeftMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_left_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setOrientation_ = call (load_sym libgtk "gtk_page_setup_set_orientation") (GObjectObjectClass.PolyML.PTR &&> GtkPageOrientation.PolyML.VAL --> FFI.PolyML.VOID)
      val setPaperSize_ = call (load_sym libgtk "gtk_page_setup_set_paper_size") (GObjectObjectClass.PolyML.PTR &&> GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setPaperSizeAndDefaultMargins_ = call (load_sym libgtk "gtk_page_setup_set_paper_size_and_default_margins") (GObjectObjectClass.PolyML.PTR &&> GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setRightMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_right_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setTopMargin_ =
        call (load_sym libgtk "gtk_page_setup_set_top_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val toFile_ =
        call (load_sym libgtk "gtk_page_setup_to_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_page_setup_to_key_file")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibKeyFileRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkPageSetupClass.t
    type pageorientation_t = GtkPageOrientation.t
    type papersizerecord_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkPageSetupClass.C.fromPtr true) new_ ()
    fun newFromFile fileName = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GtkPageSetupClass.C.fromPtr true) newFromFile_ (fileName & [])
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GtkPageSetupClass.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun copy self = (GObjectObjectClass.C.withPtr ---> GtkPageSetupClass.C.fromPtr true) copy_ self
    fun getBottomMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getBottomMargin_ (self & unit)
    fun getLeftMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getLeftMargin_ (self & unit)
    fun getOrientation self = (GObjectObjectClass.C.withPtr ---> GtkPageOrientation.C.fromVal) getOrientation_ self
    fun getPageHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getPageHeight_ (self & unit)
    fun getPageWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getPageWidth_ (self & unit)
    fun getPaperHeight self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getPaperHeight_ (self & unit)
    fun getPaperSize self = (GObjectObjectClass.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) getPaperSize_ self
    fun getPaperWidth self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getPaperWidth_ (self & unit)
    fun getRightMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getRightMargin_ (self & unit)
    fun getTopMargin self unit = (GObjectObjectClass.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getTopMargin_ (self & unit)
    fun loadFile self fileName =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.Double.withVal
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
         &&&> FFI.Double.withVal
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
         &&&> FFI.Double.withVal
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
         &&&> FFI.Double.withVal
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
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
  end
