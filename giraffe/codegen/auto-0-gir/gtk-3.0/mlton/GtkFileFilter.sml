structure GtkFileFilter :>
  GTK_FILE_FILTER
    where type 'a class_t = 'a GtkFileFilterClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type file_filter_info_record_t = GtkFileFilterInfoRecord.t
    where type file_filter_flags_t = GtkFileFilterFlags.t =
  struct
    val getType_ = _import "gtk_file_filter_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_file_filter_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addMimeType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_filter_add_mime_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
            _import "mlton_gtk_file_filter_add_pattern" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPixbufFormats_ = _import "gtk_file_filter_add_pixbuf_formats" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val filter_ = fn x1 & x2 => (_import "gtk_file_filter_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkFileFilterInfoRecord.C.notnull GtkFileFilterInfoRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getName_ = _import "gtk_file_filter_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNeeded_ = _import "gtk_file_filter_get_needed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkFileFilterFlags.C.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_filter_set_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkFileFilterClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type file_filter_info_record_t = GtkFileFilterInfoRecord.t
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class_t
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
