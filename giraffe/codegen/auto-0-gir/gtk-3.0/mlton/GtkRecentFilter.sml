structure GtkRecentFilter :>
  GTK_RECENT_FILTER
    where type 'a class = 'a GtkRecentFilterClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type recent_filter_flags_t = GtkRecentFilterFlags.t =
  struct
    val getType_ = _import "gtk_recent_filter_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_recent_filter_new" : unit -> GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p;
    val addAge_ = fn x1 & x2 => (_import "gtk_recent_filter_add_age" : GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val addApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_add_application" :
              GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addPixbufFormats_ = _import "gtk_recent_filter_add_pixbuf_formats" : GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p -> unit;
    val getName_ = _import "gtk_recent_filter_get_name" : GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getNeeded_ = _import "gtk_recent_filter_get_needed" : GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p -> GtkRecentFilterFlags.FFI.val_;
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_filter_set_name" :
              GtkRecentFilterClass.FFI.non_opt GtkRecentFilterClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkRecentFilterClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
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
    fun getName self = (GtkRecentFilterClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getName_ self before GtkRecentFilterClass.FFI.touchPtr self
    fun getNeeded self = (GtkRecentFilterClass.FFI.withPtr false ---> GtkRecentFilterFlags.FFI.fromVal) getNeeded_ self
    fun setName self name = (GtkRecentFilterClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
  end
