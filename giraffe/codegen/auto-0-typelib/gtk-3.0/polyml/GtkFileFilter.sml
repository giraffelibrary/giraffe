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
      val getType_ = call (getSymbol "gtk_file_filter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_file_filter_new") (PolyMLFFI.cVoid --> GtkFileFilterClass.PolyML.cPtr)
      val addMimeType_ = call (getSymbol "gtk_file_filter_add_mime_type") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addPattern_ = call (getSymbol "gtk_file_filter_add_pattern") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addPixbufFormats_ = call (getSymbol "gtk_file_filter_add_pixbuf_formats") (GtkFileFilterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val filter_ = call (getSymbol "gtk_file_filter_filter") (GtkFileFilterClass.PolyML.cPtr &&> GtkFileFilterInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getName_ = call (getSymbol "gtk_file_filter_get_name") (GtkFileFilterClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNeeded_ = call (getSymbol "gtk_file_filter_get_needed") (GtkFileFilterClass.PolyML.cPtr --> GtkFileFilterFlags.PolyML.cVal)
      val setName_ = call (getSymbol "gtk_file_filter_set_name") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkFileFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type file_filter_info_t = GtkFileFilterInfoRecord.t
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.FFI.fromPtr false) new_ ()
    fun addMimeType self mimeType = (GtkFileFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkFileFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkFileFilterClass.FFI.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GtkFileFilterClass.FFI.withPtr &&&> GtkFileFilterInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) filter_ (self & filterInfo)
    fun getName self = (GtkFileFilterClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNeeded self = (GtkFileFilterClass.FFI.withPtr ---> GtkFileFilterFlags.FFI.fromVal) getNeeded_ self
    fun setName self name = (GtkFileFilterClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setName_ (self & name)
  end
