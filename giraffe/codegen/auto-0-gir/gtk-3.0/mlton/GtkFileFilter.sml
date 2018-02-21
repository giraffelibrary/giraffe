structure GtkFileFilter :>
  GTK_FILE_FILTER
    where type 'a class = 'a GtkFileFilterClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type file_filter_info_t = GtkFileFilterInfoRecord.t
    where type file_filter_flags_t = GtkFileFilterFlags.t =
  struct
    val getType_ = _import "gtk_file_filter_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_file_filter_new" : unit -> GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p;
    val newFromGvariant_ = _import "gtk_file_filter_new_from_gvariant" : GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p -> GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p;
    val addMimeType_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_filter_add_mime_type" :
              GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPixbufFormats_ = _import "gtk_file_filter_add_pixbuf_formats" : GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p -> unit;
    val filter_ = fn x1 & x2 => (_import "gtk_file_filter_filter" : GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p * GtkFileFilterInfoRecord.FFI.notnull GtkFileFilterInfoRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getName_ = _import "gtk_file_filter_get_name" : GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p -> unit Utf8.FFI.out_p;
    val getNeeded_ = _import "gtk_file_filter_get_needed" : GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p -> GtkFileFilterFlags.FFI.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_file_filter_set_name" :
              GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val toGvariant_ = _import "gtk_file_filter_to_gvariant" : GtkFileFilterClass.FFI.notnull GtkFileFilterClass.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    type 'a class = 'a GtkFileFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type file_filter_info_t = GtkFileFilterInfoRecord.t
    type file_filter_flags_t = GtkFileFilterFlags.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFileFilterClass.FFI.fromPtr false) new_ ()
    fun newFromGvariant variant = (GLibVariantRecord.FFI.withPtr ---> GtkFileFilterClass.FFI.fromPtr true) newFromGvariant_ variant
    fun addMimeType self mimeType = (GtkFileFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addMimeType_ (self & mimeType)
    fun addPattern self pattern = (GtkFileFilterClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addPattern_ (self & pattern)
    fun addPixbufFormats self = (GtkFileFilterClass.FFI.withPtr ---> I) addPixbufFormats_ self
    fun filter self filterInfo = (GtkFileFilterClass.FFI.withPtr &&&> GtkFileFilterInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) filter_ (self & filterInfo)
    fun getName self = (GtkFileFilterClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getName_ self
    fun getNeeded self = (GtkFileFilterClass.FFI.withPtr ---> GtkFileFilterFlags.FFI.fromVal) getNeeded_ self
    fun setName self name = (GtkFileFilterClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setName_ (self & name)
    fun toGvariant self = (GtkFileFilterClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) toGvariant_ self
  end
