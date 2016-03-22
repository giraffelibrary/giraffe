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
      val new_ = call (load_sym libgtk "gtk_file_filter_new") (FFI.PolyML.cVoid --> GtkFileFilterClass.PolyML.cPtr)
      val addMimeType_ = call (load_sym libgtk "gtk_file_filter_add_mime_type") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val addPattern_ = call (load_sym libgtk "gtk_file_filter_add_pattern") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val addPixbufFormats_ = call (load_sym libgtk "gtk_file_filter_add_pixbuf_formats") (GtkFileFilterClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val filter_ = call (load_sym libgtk "gtk_file_filter_filter") (GtkFileFilterClass.PolyML.cPtr &&> GtkFileFilterInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_file_filter_get_name") (GtkFileFilterClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNeeded_ = call (load_sym libgtk "gtk_file_filter_get_needed") (GtkFileFilterClass.PolyML.cPtr --> GtkFileFilterFlags.PolyML.cVal)
      val setName_ = call (load_sym libgtk "gtk_file_filter_set_name") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkFileFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type file_filter_info_t = GtkFileFilterInfoRecord.t
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.C.fromPtr false) new_ ()
    fun addMimeType self mimeType = (GtkFileFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkFileFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkFileFilterClass.C.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GtkFileFilterClass.C.withPtr &&&> GtkFileFilterInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) filter_ (self & filterInfo)
    fun getName self = (GtkFileFilterClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNeeded self = (GtkFileFilterClass.C.withPtr ---> GtkFileFilterFlags.C.fromVal) getNeeded_ self
    fun setName self name = (GtkFileFilterClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setName_ (self & name)
  end
