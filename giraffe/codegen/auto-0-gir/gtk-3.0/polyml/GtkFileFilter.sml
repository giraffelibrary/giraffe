structure GtkFileFilter :>
  GTK_FILE_FILTER
    where type 'a class = 'a GtkFileFilterClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type file_filter_info_t = GtkFileFilterInfoRecord.t
    where type file_filter_flags_t = GtkFileFilterFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_file_filter_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_file_filter_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addMimeType_ = call (load_sym libgtk "gtk_file_filter_add_mime_type") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val addPattern_ = call (load_sym libgtk "gtk_file_filter_add_pattern") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val addPixbufFormats_ = call (load_sym libgtk "gtk_file_filter_add_pixbuf_formats") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val filter_ = call (load_sym libgtk "gtk_file_filter_filter") (GObjectObjectClass.PolyML.cPtr &&> GtkFileFilterInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_file_filter_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNeeded_ = call (load_sym libgtk "gtk_file_filter_get_needed") (GObjectObjectClass.PolyML.cPtr --> GtkFileFilterFlags.PolyML.cVal)
      val setName_ = call (load_sym libgtk "gtk_file_filter_set_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkFileFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type file_filter_info_t = GtkFileFilterInfoRecord.t
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.C.fromPtr false) new_ ()
    fun addMimeType self mimeType = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GObjectObjectClass.C.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GObjectObjectClass.C.withPtr &&&> GtkFileFilterInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) filter_ (self & filterInfo)
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNeeded self = (GObjectObjectClass.C.withPtr ---> GtkFileFilterFlags.C.fromVal) getNeeded_ self
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setName_ (self & name)
  end
