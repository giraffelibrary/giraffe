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
      val getType_ = call (getSymbol "gtk_recent_filter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_recent_filter_new") (cVoid --> GtkRecentFilterClass.PolyML.cPtr)
      val addAge_ = call (getSymbol "gtk_recent_filter_add_age") (GtkRecentFilterClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val addApplication_ = call (getSymbol "gtk_recent_filter_add_application") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addGroup_ = call (getSymbol "gtk_recent_filter_add_group") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addMimeType_ = call (getSymbol "gtk_recent_filter_add_mime_type") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addPattern_ = call (getSymbol "gtk_recent_filter_add_pattern") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addPixbufFormats_ = call (getSymbol "gtk_recent_filter_add_pixbuf_formats") (GtkRecentFilterClass.PolyML.cPtr --> cVoid)
      val filter_ = call (getSymbol "gtk_recent_filter_filter") (GtkRecentFilterClass.PolyML.cPtr &&> GtkRecentFilterInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getName_ = call (getSymbol "gtk_recent_filter_get_name") (GtkRecentFilterClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getNeeded_ = call (getSymbol "gtk_recent_filter_get_needed") (GtkRecentFilterClass.PolyML.cPtr --> GtkRecentFilterFlags.PolyML.cVal)
      val setName_ = call (getSymbol "gtk_recent_filter_set_name") (GtkRecentFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkRecentFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type recent_filter_info_t = GtkRecentFilterInfoRecord.t
    type recent_filter_flags_t = GtkRecentFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRecentFilterClass.FFI.fromPtr false) new_ ()
    fun addAge self days = (GtkRecentFilterClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) addAge_ (self & days)
    fun addApplication self application = (GtkRecentFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addApplication_ (self & application)
    fun addGroup self group = (GtkRecentFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addGroup_ (self & group)
    fun addMimeType self mimeType = (GtkRecentFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkRecentFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkRecentFilterClass.FFI.withPtr false ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GtkRecentFilterClass.FFI.withPtr false &&&> GtkRecentFilterInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) filter_ (self & filterInfo)
    fun getName self = (GtkRecentFilterClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getName_ self before GtkRecentFilterClass.FFI.touchPtr self
    fun getNeeded self = (GtkRecentFilterClass.FFI.withPtr false ---> GtkRecentFilterFlags.FFI.fromVal) getNeeded_ self
    fun setName self name = (GtkRecentFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
  end
