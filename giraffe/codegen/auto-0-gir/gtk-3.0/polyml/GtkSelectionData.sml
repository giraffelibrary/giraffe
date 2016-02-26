structure GtkSelectionData :>
  GTK_SELECTION_DATA
    where type record_t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class_t = 'a GtkTextBufferClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_selection_data_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libgtk "gtk_selection_data_copy") (GtkSelectionDataRecord.PolyML.cPtr --> GtkSelectionDataRecord.PolyML.cPtr)
      val getDataType_ = call (load_sym libgtk "gtk_selection_data_get_data_type") (GtkSelectionDataRecord.PolyML.cPtr --> GdkAtomRecord.PolyML.cPtr)
      val getDisplay_ = call (load_sym libgtk "gtk_selection_data_get_display") (GtkSelectionDataRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getFormat_ = call (load_sym libgtk "gtk_selection_data_get_format") (GtkSelectionDataRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getLength_ = call (load_sym libgtk "gtk_selection_data_get_length") (GtkSelectionDataRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getPixbuf_ = call (load_sym libgtk "gtk_selection_data_get_pixbuf") (GtkSelectionDataRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSelection_ = call (load_sym libgtk "gtk_selection_data_get_selection") (GtkSelectionDataRecord.PolyML.cPtr --> GdkAtomRecord.PolyML.cPtr)
      val getTarget_ = call (load_sym libgtk "gtk_selection_data_get_target") (GtkSelectionDataRecord.PolyML.cPtr --> GdkAtomRecord.PolyML.cPtr)
      val getText_ = call (load_sym libgtk "gtk_selection_data_get_text") (GtkSelectionDataRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val setPixbuf_ = call (load_sym libgtk "gtk_selection_data_set_pixbuf") (GtkSelectionDataRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setText_ =
        call (load_sym libgtk "gtk_selection_data_set_text")
          (
            GtkSelectionDataRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val targetsIncludeImage_ = call (load_sym libgtk "gtk_selection_data_targets_include_image") (GtkSelectionDataRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val targetsIncludeRichText_ = call (load_sym libgtk "gtk_selection_data_targets_include_rich_text") (GtkSelectionDataRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val targetsIncludeText_ = call (load_sym libgtk "gtk_selection_data_targets_include_text") (GtkSelectionDataRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val targetsIncludeUri_ = call (load_sym libgtk "gtk_selection_data_targets_include_uri") (GtkSelectionDataRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type record_t = GtkSelectionDataRecord.t
    type 'a text_buffer_class_t = 'a GtkTextBufferClass.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GtkSelectionDataRecord.C.withPtr ---> GtkSelectionDataRecord.C.fromPtr true) copy_ self
    fun getDataType self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getDataType_ self
    fun getDisplay self = (GtkSelectionDataRecord.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getFormat self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Int.C.fromVal) getFormat_ self
    fun getLength self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Int.C.fromVal) getLength_ self
    fun getPixbuf self = (GtkSelectionDataRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSelection self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getSelection_ self
    fun getTarget self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getTarget_ self
    fun getText self = (GtkSelectionDataRecord.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun setPixbuf self pixbuf = (GtkSelectionDataRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) setPixbuf_ (self & pixbuf)
    fun setText self str len =
      (
        GtkSelectionDataRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        setText_
        (
          self
           & str
           & len
        )
    fun targetsIncludeImage self writable = (GtkSelectionDataRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) targetsIncludeImage_ (self & writable)
    fun targetsIncludeRichText self buffer = (GtkSelectionDataRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) targetsIncludeRichText_ (self & buffer)
    fun targetsIncludeText self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Bool.C.fromVal) targetsIncludeText_ self
    fun targetsIncludeUri self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Bool.C.fromVal) targetsIncludeUri_ self
  end
