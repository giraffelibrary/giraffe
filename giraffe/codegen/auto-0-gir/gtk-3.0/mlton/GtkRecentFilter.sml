structure GtkRecentFilter :>
  GTK_RECENT_FILTER
    where type 'a class_t = 'a GtkRecentFilterClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type recent_filter_info_record_t = GtkRecentFilterInfoRecord.t
    where type recent_filter_flags_t = GtkRecentFilterFlags.t =
  struct
    val getType_ = _import "gtk_recent_filter_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_filter_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addAge_ = fn x1 & x2 => (_import "gtk_recent_filter_add_age" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val addApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_add_application" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPixbufFormats_ = _import "gtk_recent_filter_add_pixbuf_formats" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val filter_ = fn x1 & x2 => (_import "gtk_recent_filter_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkRecentFilterInfoRecord.C.notnull GtkRecentFilterInfoRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getName_ = _import "gtk_recent_filter_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getNeeded_ = _import "gtk_recent_filter_get_needed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkRecentFilterFlags.C.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_set_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
