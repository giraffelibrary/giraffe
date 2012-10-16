structure GtkSelectionData :>
  GTK_SELECTION_DATA
    where type record_t = GtkSelectionDataRecord.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_selection_data_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libgtk "gtk_selection_data_copy") (GtkSelectionDataRecord.PolyML.PTR --> GtkSelectionDataRecord.PolyML.PTR)
      val getDataType_ = call (load_sym libgtk "gtk_selection_data_get_data_type") (GtkSelectionDataRecord.PolyML.PTR --> GdkAtomRecord.PolyML.PTR)
      val getDisplay_ = call (load_sym libgtk "gtk_selection_data_get_display") (GtkSelectionDataRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFormat_ = call (load_sym libgtk "gtk_selection_data_get_format") (GtkSelectionDataRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getLength_ = call (load_sym libgtk "gtk_selection_data_get_length") (GtkSelectionDataRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getPixbuf_ = call (load_sym libgtk "gtk_selection_data_get_pixbuf") (GtkSelectionDataRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSelection_ = call (load_sym libgtk "gtk_selection_data_get_selection") (GtkSelectionDataRecord.PolyML.PTR --> GdkAtomRecord.PolyML.PTR)
      val getTarget_ = call (load_sym libgtk "gtk_selection_data_get_target") (GtkSelectionDataRecord.PolyML.PTR --> GdkAtomRecord.PolyML.PTR)
      val getText_ = call (load_sym libgtk "gtk_selection_data_get_text") (GtkSelectionDataRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val setPixbuf_ = call (load_sym libgtk "gtk_selection_data_set_pixbuf") (GtkSelectionDataRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setText_ =
        call (load_sym libgtk "gtk_selection_data_set_text")
          (
            GtkSelectionDataRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val targetsIncludeImage_ = call (load_sym libgtk "gtk_selection_data_targets_include_image") (GtkSelectionDataRecord.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.Bool.VAL)
      val targetsIncludeRichText_ = call (load_sym libgtk "gtk_selection_data_targets_include_rich_text") (GtkSelectionDataRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val targetsIncludeText_ = call (load_sym libgtk "gtk_selection_data_targets_include_text") (GtkSelectionDataRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val targetsIncludeUri_ = call (load_sym libgtk "gtk_selection_data_targets_include_uri") (GtkSelectionDataRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type record_t = GtkSelectionDataRecord.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GtkSelectionDataRecord.C.withPtr ---> GtkSelectionDataRecord.C.fromPtr true) copy_ self
    fun getDataType self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getDataType_ self
    fun getDisplay self = (GtkSelectionDataRecord.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getFormat self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Int32.fromVal) getFormat_ self
    fun getLength self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Int32.fromVal) getLength_ self
    fun getPixbuf self = (GtkSelectionDataRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSelection self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getSelection_ self
    fun getTarget self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getTarget_ self
    fun getText self = (GtkSelectionDataRecord.C.withPtr ---> FFI.String.fromPtr false) getText_ self
    fun setPixbuf self pixbuf = (GtkSelectionDataRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) setPixbuf_ (self & pixbuf)
    fun setText self str len =
      (
        GtkSelectionDataRecord.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> FFI.Bool.fromVal
      )
        setText_
        (
          self
           & str
           & len
        )
    fun targetsIncludeImage self writable = (GtkSelectionDataRecord.C.withPtr &&&> FFI.Bool.withVal ---> FFI.Bool.fromVal) targetsIncludeImage_ (self & writable)
    fun targetsIncludeRichText self buffer = (GtkSelectionDataRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) targetsIncludeRichText_ (self & buffer)
    fun targetsIncludeText self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Bool.fromVal) targetsIncludeText_ self
    fun targetsIncludeUri self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Bool.fromVal) targetsIncludeUri_ self
  end
