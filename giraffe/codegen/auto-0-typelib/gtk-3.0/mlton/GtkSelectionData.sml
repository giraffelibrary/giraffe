structure GtkSelectionData :>
  GTK_SELECTION_DATA
    where type t = GtkSelectionDataRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class =
  struct
    val getType_ = _import "gtk_selection_data_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gtk_selection_data_copy" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p;
    val getDataType_ = _import "gtk_selection_data_get_data_type" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
    val getDisplay_ = _import "gtk_selection_data_get_display" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFormat_ = _import "gtk_selection_data_get_format" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> FFI.Int32.C.val_;
    val getLength_ = _import "gtk_selection_data_get_length" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> FFI.Int32.C.val_;
    val getPixbuf_ = _import "gtk_selection_data_get_pixbuf" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSelection_ = _import "gtk_selection_data_get_selection" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
    val getTarget_ = _import "gtk_selection_data_get_target" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
    val getText_ = _import "gtk_selection_data_get_text" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val setPixbuf_ = fn x1 & x2 => (_import "gtk_selection_data_set_pixbuf" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setText_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_selection_data_set_text" :
              GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val targetsIncludeImage_ = fn x1 & x2 => (_import "gtk_selection_data_targets_include_image" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p * FFI.Bool.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val targetsIncludeRichText_ = fn x1 & x2 => (_import "gtk_selection_data_targets_include_rich_text" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val targetsIncludeText_ = _import "gtk_selection_data_targets_include_text" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> FFI.Bool.C.val_;
    val targetsIncludeUri_ = _import "gtk_selection_data_targets_include_uri" : GtkSelectionDataRecord.C.notnull GtkSelectionDataRecord.C.p -> FFI.Bool.C.val_;
    type t = GtkSelectionDataRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GtkSelectionDataRecord.C.withPtr ---> GtkSelectionDataRecord.C.fromPtr true) copy_ self
    fun getDataType self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getDataType_ self
    fun getDisplay self = (GtkSelectionDataRecord.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getFormat self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Int32.C.fromVal) getFormat_ self
    fun getLength self = (GtkSelectionDataRecord.C.withPtr ---> FFI.Int32.C.fromVal) getLength_ self
    fun getPixbuf self = (GtkSelectionDataRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSelection self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getSelection_ self
    fun getTarget self = (GtkSelectionDataRecord.C.withPtr ---> GdkAtomRecord.C.fromPtr false) getTarget_ self
    fun getText self = (GtkSelectionDataRecord.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun setPixbuf self pixbuf = (GtkSelectionDataRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) setPixbuf_ (self & pixbuf)
    fun setText self str len =
      (
        GtkSelectionDataRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
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
