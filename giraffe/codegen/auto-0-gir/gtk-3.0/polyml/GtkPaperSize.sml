structure GtkPaperSize :>
  GTK_PAPER_SIZE
    where type t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_paper_size_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_paper_size_new") (Utf8.PolyML.cInOptPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val newCustom_ =
        call (getSymbol "gtk_paper_size_new_custom")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> GtkPaperSizeRecord.PolyML.cPtr
          )
      val newFromKeyFile_ =
        call (getSymbol "gtk_paper_size_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkPaperSizeRecord.PolyML.cPtr
          )
      val newFromPpd_ =
        call (getSymbol "gtk_paper_size_new_from_ppd")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             --> GtkPaperSizeRecord.PolyML.cPtr
          )
      val copy_ = call (getSymbol "gtk_paper_size_copy") (GtkPaperSizeRecord.PolyML.cPtr --> GtkPaperSizeRecord.PolyML.cPtr)
      val getDefaultBottomMargin_ = call (getSymbol "gtk_paper_size_get_default_bottom_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getDefaultLeftMargin_ = call (getSymbol "gtk_paper_size_get_default_left_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getDefaultRightMargin_ = call (getSymbol "gtk_paper_size_get_default_right_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getDefaultTopMargin_ = call (getSymbol "gtk_paper_size_get_default_top_margin") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getDisplayName_ = call (getSymbol "gtk_paper_size_get_display_name") (GtkPaperSizeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getHeight_ = call (getSymbol "gtk_paper_size_get_height") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val getName_ = call (getSymbol "gtk_paper_size_get_name") (GtkPaperSizeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPpdName_ = call (getSymbol "gtk_paper_size_get_ppd_name") (GtkPaperSizeRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWidth_ = call (getSymbol "gtk_paper_size_get_width") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkUnit.PolyML.cVal --> GDouble.PolyML.cVal)
      val isCustom_ = call (getSymbol "gtk_paper_size_is_custom") (GtkPaperSizeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isEqual_ = call (getSymbol "gtk_paper_size_is_equal") (GtkPaperSizeRecord.PolyML.cPtr &&> GtkPaperSizeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setSize_ =
        call (getSymbol "gtk_paper_size_set_size")
          (
            GtkPaperSizeRecord.PolyML.cPtr
             &&> GDouble.PolyML.cVal
             &&> GDouble.PolyML.cVal
             &&> GtkUnit.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val toKeyFile_ =
        call (getSymbol "gtk_paper_size_to_key_file")
          (
            GtkPaperSizeRecord.PolyML.cPtr
             &&> GLibKeyFileRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val getDefault_ = call (getSymbol "gtk_paper_size_get_default") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
    end
    type t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withOptPtr ---> GtkPaperSizeRecord.FFI.fromPtr true) new_ name
    fun newCustom name displayName width height unit =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
         ---> GtkPaperSizeRecord.FFI.fromPtr true
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
        GLibKeyFileRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkPaperSizeRecord.FFI.fromPtr true
      )
        newFromKeyFile_
        (
          keyFile
           & groupName
           & []
        )
    fun newFromPpd ppdName ppdDisplayName width height =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GtkPaperSizeRecord.FFI.fromPtr true
      )
        newFromPpd_
        (
          ppdName
           & ppdDisplayName
           & width
           & height
        )
    fun copy self = (GtkPaperSizeRecord.FFI.withPtr ---> GtkPaperSizeRecord.FFI.fromPtr true) copy_ self
    fun getDefaultBottomMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultBottomMargin_ (self & unit)
    fun getDefaultLeftMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultLeftMargin_ (self & unit)
    fun getDefaultRightMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultRightMargin_ (self & unit)
    fun getDefaultTopMargin self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getDefaultTopMargin_ (self & unit)
    fun getDisplayName self = (GtkPaperSizeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getHeight self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getHeight_ (self & unit)
    fun getName self = (GtkPaperSizeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPpdName self = (GtkPaperSizeRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPpdName_ self
    fun getWidth self unit = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkUnit.FFI.withVal ---> GDouble.FFI.fromVal) getWidth_ (self & unit)
    fun isCustom self = (GtkPaperSizeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isCustom_ self
    fun isEqual self size2 = (GtkPaperSizeRecord.FFI.withPtr &&&> GtkPaperSizeRecord.FFI.withPtr ---> GBool.FFI.fromVal) isEqual_ (self & size2)
    fun setSize self width height unit =
      (
        GtkPaperSizeRecord.FFI.withPtr
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GtkUnit.FFI.withVal
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
        GtkPaperSizeRecord.FFI.withPtr
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
    fun getDefault () = (I ---> Utf8.FFI.fromPtr 0) getDefault_ ()
  end
