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
      val addAge_ = call (load_sym libgtk "gtk_recent_filter_add_age") (GtkRecentFilterClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val addApplication_ = call (load_sym libgtk "gtk_recent_filter_add_application") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addGroup_ = call (load_sym libgtk "gtk_recent_filter_add_group") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addMimeType_ = call (load_sym libgtk "gtk_recent_filter_add_mime_type") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addPattern_ = call (load_sym libgtk "gtk_recent_filter_add_pattern") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addPixbufFormats_ = call (load_sym libgtk "gtk_recent_filter_add_pixbuf_formats") (GtkRecentFilterClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val filter_ = call (load_sym libgtk "gtk_recent_filter_filter") (GtkRecentFilterClass.PolyML.cPtr &&> GtkRecentFilterInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_recent_filter_get_name") (GtkRecentFilterClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNeeded_ = call (load_sym libgtk "gtk_recent_filter_get_needed") (GtkRecentFilterClass.PolyML.cPtr --> GtkRecentFilterFlags.PolyML.cVal)
      val setName_ = call (load_sym libgtk "gtk_recent_filter_set_name") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkRecentFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type recent_filter_info_t = GtkRecentFilterInfoRecord.t
    type recent_filter_flags_t = GtkRecentFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentFilterClass.C.fromPtr false) new_ ()
    fun addAge self days = (GtkRecentFilterClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) addAge_ (self & days)
    fun addApplication self application = (GtkRecentFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addApplication_ (self & application)
    fun addGroup self group = (GtkRecentFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addGroup_ (self & group)
    fun addMimeType self mimeType = (GtkRecentFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkRecentFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkRecentFilterClass.C.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GtkRecentFilterClass.C.withPtr &&&> GtkRecentFilterInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) filter_ (self & filterInfo)
    fun getName self = (GtkRecentFilterClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNeeded self = (GtkRecentFilterClass.C.withPtr ---> GtkRecentFilterFlags.C.fromVal) getNeeded_ self
    fun setName self name = (GtkRecentFilterClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
  end
