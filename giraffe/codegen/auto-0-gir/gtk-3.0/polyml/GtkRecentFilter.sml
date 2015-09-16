structure GtkRecentFilter :>
  GTK_RECENT_FILTER
    where type 'a class_t = 'a GtkRecentFilterClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type recent_filter_info_record_t = GtkRecentFilterInfoRecord.t
    where type recent_filter_flags_t = GtkRecentFilterFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_filter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_recent_filter_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addAge_ = call (load_sym libgtk "gtk_recent_filter_add_age") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val addApplication_ = call (load_sym libgtk "gtk_recent_filter_add_application") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val addGroup_ = call (load_sym libgtk "gtk_recent_filter_add_group") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val addMimeType_ = call (load_sym libgtk "gtk_recent_filter_add_mime_type") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val addPattern_ = call (load_sym libgtk "gtk_recent_filter_add_pattern") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val addPixbufFormats_ = call (load_sym libgtk "gtk_recent_filter_add_pixbuf_formats") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val filter_ = call (load_sym libgtk "gtk_recent_filter_filter") (GObjectObjectClass.PolyML.PTR &&> GtkRecentFilterInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getName_ = call (load_sym libgtk "gtk_recent_filter_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getNeeded_ = call (load_sym libgtk "gtk_recent_filter_get_needed") (GObjectObjectClass.PolyML.PTR --> GtkRecentFilterFlags.PolyML.VAL)
      val setName_ = call (load_sym libgtk "gtk_recent_filter_set_name") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkRecentFilterClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type recent_filter_info_record_t = GtkRecentFilterInfoRecord.t
    type recent_filter_flags_t = GtkRecentFilterFlags.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentFilterClass.C.fromPtr false) new_ ()
    fun addAge self days = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) addAge_ (self & days)
    fun addApplication self application = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) addApplication_ (self & application)
    fun addGroup self group = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) addGroup_ (self & group)
    fun addMimeType self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GObjectObjectClass.C.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GObjectObjectClass.C.withPtr &&&> GtkRecentFilterInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) filter_ (self & filterInfo)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getNeeded self = (GObjectObjectClass.C.withPtr ---> GtkRecentFilterFlags.C.fromVal) getNeeded_ self
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setName_ (self & name)
  end
