structure GtkFileFilter :>
  GTK_FILE_FILTER
    where type 'a class_t = 'a GtkFileFilterClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type file_filter_info_record_t = GtkFileFilterInfoRecord.t
    where type file_filter_flags_t = GtkFileFilterFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_filter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_file_filter_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addMimeType_ = call (load_sym libgtk "gtk_file_filter_add_mime_type") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val addPattern_ = call (load_sym libgtk "gtk_file_filter_add_pattern") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val addPixbufFormats_ = call (load_sym libgtk "gtk_file_filter_add_pixbuf_formats") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val filter_ = call (load_sym libgtk "gtk_file_filter_filter") (GObjectObjectClass.PolyML.PTR &&> GtkFileFilterInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getName_ = call (load_sym libgtk "gtk_file_filter_get_name") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getNeeded_ = call (load_sym libgtk "gtk_file_filter_get_needed") (GObjectObjectClass.PolyML.PTR --> GtkFileFilterFlags.PolyML.VAL)
      val setName_ = call (load_sym libgtk "gtk_file_filter_set_name") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INOPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkFileFilterClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type file_filter_info_record_t = GtkFileFilterInfoRecord.t
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.C.fromPtr false) new_ ()
    fun addMimeType self mimeType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GObjectObjectClass.C.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GObjectObjectClass.C.withPtr &&&> GtkFileFilterInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) filter_ (self & filterInfo)
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNeeded self = (GObjectObjectClass.C.withPtr ---> GtkFileFilterFlags.C.fromVal) getNeeded_ self
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstOptPtr ---> I) setName_ (self & name)
  end
