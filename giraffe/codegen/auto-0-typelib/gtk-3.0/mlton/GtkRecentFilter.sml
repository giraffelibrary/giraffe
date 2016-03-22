structure GtkRecentFilter :>
  GTK_RECENT_FILTER
    where type 'a class = 'a GtkRecentFilterClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type recent_filter_info_t = GtkRecentFilterInfoRecord.t
    where type recent_filter_flags_t = GtkRecentFilterFlags.t =
  struct
    val getType_ = _import "gtk_recent_filter_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_filter_new" : unit -> GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p;
    val addAge_ = fn x1 & x2 => (_import "gtk_recent_filter_add_age" : GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val addApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_add_application" :
              GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addGroup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_add_group" :
              GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addMimeType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_add_mime_type" :
              GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPattern_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_add_pattern" :
              GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPixbufFormats_ = _import "gtk_recent_filter_add_pixbuf_formats" : GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p -> unit;
    val filter_ = fn x1 & x2 => (_import "gtk_recent_filter_filter" : GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p * GtkRecentFilterInfoRecord.C.notnull GtkRecentFilterInfoRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getName_ = _import "gtk_recent_filter_get_name" : GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNeeded_ = _import "gtk_recent_filter_get_needed" : GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p -> GtkRecentFilterFlags.C.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_set_name" :
              GtkRecentFilterClass.C.notnull GtkRecentFilterClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
