structure GtkRecentFilter :>
  GTK_RECENT_FILTER
    where type 'a class = 'a GtkRecentFilterClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type recent_filter_info_t = GtkRecentFilterInfoRecord.t
    where type recent_filter_flags_t = GtkRecentFilterFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_filter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_recent_filter_new") (PolyMLFFI.cVoid --> GtkRecentFilterClass.PolyML.cPtr)
      val addAge_ = call (load_sym libgtk "gtk_recent_filter_add_age") (GtkRecentFilterClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val addApplication_ = call (load_sym libgtk "gtk_recent_filter_add_application") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addGroup_ = call (load_sym libgtk "gtk_recent_filter_add_group") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addMimeType_ = call (load_sym libgtk "gtk_recent_filter_add_mime_type") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addPattern_ = call (load_sym libgtk "gtk_recent_filter_add_pattern") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addPixbufFormats_ = call (load_sym libgtk "gtk_recent_filter_add_pixbuf_formats") (GtkRecentFilterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val filter_ = call (load_sym libgtk "gtk_recent_filter_filter") (GtkRecentFilterClass.PolyML.cPtr &&> GtkRecentFilterInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_recent_filter_get_name") (GtkRecentFilterClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNeeded_ = call (load_sym libgtk "gtk_recent_filter_get_needed") (GtkRecentFilterClass.PolyML.cPtr --> GtkRecentFilterFlags.PolyML.cVal)
      val setName_ = call (load_sym libgtk "gtk_recent_filter_set_name") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkRecentFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type recent_filter_info_t = GtkRecentFilterInfoRecord.t
    type recent_filter_flags_t = GtkRecentFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRecentFilterClass.FFI.fromPtr false) new_ ()
    fun addAge self days = (GtkRecentFilterClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) addAge_ (self & days)
    fun addApplication self application = (GtkRecentFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addApplication_ (self & application)
    fun addGroup self group = (GtkRecentFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addGroup_ (self & group)
    fun addMimeType self mimeType = (GtkRecentFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkRecentFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkRecentFilterClass.FFI.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GtkRecentFilterClass.FFI.withPtr &&&> GtkRecentFilterInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) filter_ (self & filterInfo)
    fun getName self = (GtkRecentFilterClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getNeeded self = (GtkRecentFilterClass.FFI.withPtr ---> GtkRecentFilterFlags.FFI.fromVal) getNeeded_ self
    fun setName self name = (GtkRecentFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
  end
