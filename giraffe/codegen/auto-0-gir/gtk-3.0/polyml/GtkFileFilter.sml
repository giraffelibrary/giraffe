structure GtkFileFilter :>
  GTK_FILE_FILTER
    where type 'a class = 'a GtkFileFilterClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type file_filter_flags_t = GtkFileFilterFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_filter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_file_filter_new") (cVoid --> GtkFileFilterClass.PolyML.cPtr)
      val newFromGvariant_ = call (getSymbol "gtk_file_filter_new_from_gvariant") (GLibVariantRecord.PolyML.cPtr --> GtkFileFilterClass.PolyML.cPtr)
      val addMimeType_ = call (getSymbol "gtk_file_filter_add_mime_type") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addPattern_ = call (getSymbol "gtk_file_filter_add_pattern") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addPixbufFormats_ = call (getSymbol "gtk_file_filter_add_pixbuf_formats") (GtkFileFilterClass.PolyML.cPtr --> cVoid)
      val getName_ = call (getSymbol "gtk_file_filter_get_name") (GtkFileFilterClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getNeeded_ = call (getSymbol "gtk_file_filter_get_needed") (GtkFileFilterClass.PolyML.cPtr --> GtkFileFilterFlags.PolyML.cVal)
      val setName_ = call (getSymbol "gtk_file_filter_set_name") (GtkFileFilterClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val toGvariant_ = call (getSymbol "gtk_file_filter_to_gvariant") (GtkFileFilterClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
    end
    type 'a class = 'a GtkFileFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.FFI.fromPtr false) new_ ()
    fun newFromGvariant variant = (GLibVariantRecord.FFI.withPtr false ---> GtkFileFilterClass.FFI.fromPtr true) newFromGvariant_ variant
    fun addMimeType self mimeType = (GtkFileFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkFileFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkFileFilterClass.FFI.withPtr false ---> I) addPixbufFormats_ self
    fun getName self = (GtkFileFilterClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getName_ self before GtkFileFilterClass.FFI.touchPtr self
    fun getNeeded self = (GtkFileFilterClass.FFI.withPtr false ---> GtkFileFilterFlags.FFI.fromVal) getNeeded_ self
    fun setName self name = (GtkFileFilterClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setName_ (self & name)
    fun toGvariant self = (GtkFileFilterClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) toGvariant_ self before GtkFileFilterClass.FFI.touchPtr self
  end
