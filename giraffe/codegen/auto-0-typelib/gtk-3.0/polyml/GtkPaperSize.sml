structure GtkPaperSize :>
  GTK_PAPER_SIZE
    where type record_t = GtkPaperSizeRecord.t
    where type unit_t = GtkUnit.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_paper_size_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_paper_size_new") (FFI.String.PolyML.INOPTPTR --> GtkPaperSizeRecord.PolyML.PTR)
      val newCustom_ =
        call (load_sym libgtk "gtk_paper_size_new_custom")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> GtkUnit.PolyML.VAL
             --> GtkPaperSizeRecord.PolyML.PTR
          )
      val newFromKeyFile_ =
        call (load_sym libgtk "gtk_paper_size_new_from_key_file")
          (
            GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GtkPaperSizeRecord.PolyML.PTR
          )
      val newFromPpd_ =
        call (load_sym libgtk "gtk_paper_size_new_from_ppd")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> GtkPaperSizeRecord.PolyML.PTR
          )
      val copy_ = call (load_sym libgtk "gtk_paper_size_copy") (GtkPaperSizeRecord.PolyML.PTR --> GtkPaperSizeRecord.PolyML.PTR)
      val getDefaultBottomMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_bottom_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getDefaultLeftMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_left_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getDefaultRightMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_right_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getDefaultTopMargin_ = call (load_sym libgtk "gtk_paper_size_get_default_top_margin") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getDisplayName_ = call (load_sym libgtk "gtk_paper_size_get_display_name") (GtkPaperSizeRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getHeight_ = call (load_sym libgtk "gtk_paper_size_get_height") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val getName_ = call (load_sym libgtk "gtk_paper_size_get_name") (GtkPaperSizeRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPpdName_ = call (load_sym libgtk "gtk_paper_size_get_ppd_name") (GtkPaperSizeRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getWidth_ = call (load_sym libgtk "gtk_paper_size_get_width") (GtkPaperSizeRecord.PolyML.PTR &&> GtkUnit.PolyML.VAL --> FFI.Double.PolyML.VAL)
      val isCustom_ = call (load_sym libgtk "gtk_paper_size_is_custom") (GtkPaperSizeRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isEqual_ = call (load_sym libgtk "gtk_paper_size_is_equal") (GtkPaperSizeRecord.PolyML.PTR &&> GtkPaperSizeRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setSize_ =
        call (load_sym libgtk "gtk_paper_size_set_size")
          (
            GtkPaperSizeRecord.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> GtkUnit.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val toKeyFile_ =
        call (load_sym libgtk "gtk_paper_size_to_key_file")
          (
            GtkPaperSizeRecord.PolyML.PTR
             &&> GLibKeyFileRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val getDefault_ = call (load_sym libgtk "gtk_paper_size_get_default") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
    end
    type record_t = GtkPaperSizeRecord.t
    type unit_t = GtkUnit.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name = (FFI.String.C.withConstOptPtr ---> GtkPaperSizeRecord.C.fromPtr true) new_ name
    fun newCustom name displayName width height unit =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
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
    fun getDisplayName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.C.fromPtr false) getDisplayName_ self
    fun getHeight self unit = (GtkPaperSizeRecord.C.withPtr &&&> GtkUnit.C.withVal ---> FFI.Double.C.fromVal) getHeight_ (self & unit)
    fun getName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getPpdName self = (GtkPaperSizeRecord.C.withPtr ---> FFI.String.C.fromPtr false) getPpdName_ self
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
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        toKeyFile_
        (
          self
           & keyFile
           & groupName
        )
    fun getDefault () = (I ---> FFI.String.C.fromPtr false) getDefault_ ()
  end
