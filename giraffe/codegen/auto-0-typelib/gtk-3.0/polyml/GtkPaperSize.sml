structure GtkPaperSize :>
  GTK_PAPER_SIZE
    where type t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_paper_size_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_paper_size_new") (Utf8.PolyML.cInOptPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val newCustom_ =
        call (load_sym libgtk "gtk_paper_size_new_custom")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> GtkPaperSizeRecord.PolyML.cPtr
          )
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_paper_size_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPaperSizeRecord.PolyML.cPtr
          )
      val newFromPpd_ =
        call (load_sym libgtk "gtk_paper_size_new_from_ppd")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             --> GtkPaperSizeRecord.PolyML.cPtr
          )
      val copy_ = call (load_sym libgtk "gtk_paper_size_copy") (GtkPaperSizeRecord.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getDefaultBottomMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_bottom_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getDefaultLeftMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_left_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getDefaultRightMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_right_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getDefaultTopMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_top_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getDisplayName_ = call (load_sym libgtk "gtk_paper_size_get_display_name") (GtkPaperSizeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHeight_ = call (load_sym libgtk "gtk_paper_size_get_height") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_paper_size_get_name") (GtkPaperSizeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPpdName_ = call (load_sym libgtk "gtk_paper_size_get_ppd_name") (GtkPaperSizeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidth_ = call (load_sym libgtk "gtk_paper_size_get_width") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> FFI.Double.PolyML.cVal)
      val isCustom_ = call (load_sym libgtk "gtk_paper_size_is_custom") (GtkPaperSizeRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isEqual_ = call (load_sym libgtk "gtk_paper_size_is_equal") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setSize_ =
        call (load_sym libgtk "gtk_paper_size_set_size")
          (
            GtkPaperSizeRecord.PolyML.cPtr
             &&> FFI.Double.PolyML.cVal
             &&> FFI.Double.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_paper_size_to_key_file")
          (
            GtkPaperSizeRecord.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val getDefault_ = call (load_sym libgtk "gtk_paper_size_get_default") (FFI.PolyML.cVoid --> Utf8.PolyML.cOutPtr)
    end
    type t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (Utf8.C.withOptPtr ---> GtkPaperSizeRecord.C.fromPtr true) new_ name
    fun newCustom name displayName width height unit =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> GtkPaperSizeRecord.C.fromPtr true
      )
        newCustom_
        (
          name
           & displayName
           & width
           & height
           & unit
        )
    fun newFromKeyFile keyFile groupName =
      (
        GLibKeyFileRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPaperSizeRecord.C.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun newFromPpd ppdName ppdDisplayName width height =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> GtkPaperSizeRecord.C.fromPtr true
      )
        newFromPpd_
        (
          ppdName
           & ppdDisplayName
           & width
           & height
        )
    fun copy self = (GtkPaperSizeRecord.C.withPtr ---> GtkPaperSizeRecord.C.fromPtr true) copy_ self
    fun getDefaultBottomMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultBottomMargin_ (self & unit)
    fun getDefaultLeftMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultLeftMargin_ (self & unit)
    fun getDefaultRightMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultRightMargin_ (self & unit)
    fun getDefaultTopMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getDefaultTopMargin_ (self & unit)
    fun getDisplayName self = (GtkPaperSizeRecord.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getHeight self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getHeight_ (self & unit)
    fun getName self = (GtkPaperSizeRecord.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getPpdName self = (GtkPaperSizeRecord.C.withPtr ---> Utf8.C.fromPtr false) getPpdName_ self
    fun getWidth self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getWidth_ (self & unit)
    fun isCustom self = (GtkPaperSizeRecord.C.withPtr ---> FFI.Bool.C.fromVal) isCustom_ self
    fun isEqual self size2 = (GtkPaperSizeRecord.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> FFI.Bool.C.fromVal) isEqual_ (self & size2)
    fun setSize self width height unit =
      (
        GtkPaperSizeRecord.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> GtkUnit.C.withVal
         ---> I
      )
        setSize_
        (
          self
           & width
           & height
           & unit
        )
    fun toKeyFile self keyFile groupName =
      (
        GtkPaperSizeRecord.C.withPtr
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
    fun getDefault () = (I ---> Utf8.C.fromPtr false) getDefault_ ()
  end
