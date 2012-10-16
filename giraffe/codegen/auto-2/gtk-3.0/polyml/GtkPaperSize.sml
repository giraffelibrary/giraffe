structure GtkPaperSize :>
  GTK_PAPER_SIZE
    where type record_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_paper_size_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_paper_size_new") (FFI.PolyML.String.INOPTPTR --> GtkPaperSizeRecord.PolyML.PTR)
      val newCustom_ =
        call (load_sym libgtk "gtk_paper_size_new_custom")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> GtkPaperSizeRecord.PolyML.PTR
          )
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_paper_size_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GtkPaperSizeRecord.PolyML.PTR
          )
      val newFromPpd_ =
        call (load_sym libgtk "gtk_paper_size_new_from_ppd")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             --> GtkPaperSizeRecord.PolyML.PTR
          )
      val copy_ = call (load_sym libgtk "gtk_paper_size_copy") (GtkPaperSizeRecord.PolyML.PTR --> GtkPaperSizeRecord.PolyML.PTR)
      val getDefaultBottomMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_bottom_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getDefaultLeftMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_left_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getDefaultRightMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_right_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getDefaultTopMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_top_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getDisplayName_ = call (load_sym libgtk "gtk_paper_size_get_display_name") (GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getHeight_ = call (load_sym libgtk "gtk_paper_size_get_height") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val getName_ = call (load_sym libgtk "gtk_paper_size_get_name") (GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getPpdName_ = call (load_sym libgtk "gtk_paper_size_get_ppd_name") (GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getWidth_ = call (load_sym libgtk "gtk_paper_size_get_width") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.PolyML.Double.VAL)
      val isCustom_ = call (load_sym libgtk "gtk_paper_size_is_custom") (GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isEqual_ = call (load_sym libgtk "gtk_paper_size_is_equal") (GtkPaperSizeRecord.PolyML.PTR &&> GtkPaperSizeRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setSize_ =
        call (load_sym libgtk "gtk_paper_size_set_size")
          (
            GtkPaperSizeRecord.PolyML.PTR
             &&> FFI.PolyML.Double.VAL
             &&> FFI.PolyML.Double.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_paper_size_to_key_file")
          (
            GtkPaperSizeRecord.PolyML.PTR
             &&> GLibKeyFileRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val getDefault_ = call (load_sym libgtk "gtk_paper_size_get_default") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
    end
    type record_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (FFI.String.withConstOptPtr ---> GtkPaperSizeRecord.C.fromPtr true) new_ name
    fun newCustom name displayName width height unit =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
    fun getDefaultBottomMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getDefaultBottomMargin_ (self & unit)
    fun getDefaultLeftMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getDefaultLeftMargin_ (self & unit)
    fun getDefaultRightMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getDefaultRightMargin_ (self & unit)
    fun getDefaultTopMargin self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getDefaultTopMargin_ (self & unit)
    fun getDisplayName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.fromPtr false) getDisplayName_ self
    fun getHeight self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getHeight_ (self & unit)
    fun getName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getPpdName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.fromPtr false) getPpdName_ self
    fun getWidth self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.fromVal) getWidth_ (self & unit)
    fun isCustom self = (GtkPaperSizeRecord.C.withPtr ---> FFI.Bool.fromVal) isCustom_ self
    fun isEqual self size2 = (GtkPaperSizeRecord.C.withPtr &&&> GtkPaperSizeRecord.C.withPtr ---> FFI.Bool.fromVal) isEqual_ (self & size2)
    fun setSize self width height unit =
      (
        GtkPaperSizeRecord.C.withPtr
         &&&> FFI.Double.withVal
         &&&> FFI.Double.withVal
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
         &&&> FFI.String.withConstPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun getDefault () = (I ---> FFI.String.fromPtr false) getDefault_ ()
  end
