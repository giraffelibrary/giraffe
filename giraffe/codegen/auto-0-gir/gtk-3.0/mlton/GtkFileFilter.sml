structure GtkFileFilter :>
  GTK_FILE_FILTER
    where type 'a class_t = 'a GtkFileFilterClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type filefilterinforecord_t = GtkFileFilterInfoRecord.t
    where type filefilterflags_t = GtkFileFilterFlags.t =
  struct
    val getType_ = _import "gtk_file_filter_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_file_filter_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addMimeType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_filter_add_mime_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPixbufFormats_ = _import "gtk_file_filter_add_pixbuf_formats" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val filter_ = fn x1 & x2 => (_import "gtk_file_filter_filter" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkFileFilterInfoRecord.C.notnull GtkFileFilterInfoRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getName_ = _import "gtk_file_filter_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getNeeded_ = _import "gtk_file_filter_get_needed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkFileFilterFlags.C.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_filter_set_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkFileFilterClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type filefilterinforecord_t = GtkFileFilterInfoRecord.t
    type filefilterflags_t = GtkFileFilterFlags.t
    type t = base class_t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.C.fromPtr false) new_ ()
    fun addMimeType self mimeType = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GObjectObjectClass.C.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GObjectObjectClass.C.withPtr &&&> GtkFileFilterInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) filter_ (self & filterInfo)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getNeeded self = (GObjectObjectClass.C.withPtr ---> GtkFileFilterFlags.C.fromVal) getNeeded_ self
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setName_ (self & name)
  end
