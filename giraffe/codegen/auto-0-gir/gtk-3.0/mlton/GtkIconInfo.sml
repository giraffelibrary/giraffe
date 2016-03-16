structure GtkIconInfo :>
  GTK_ICON_INFO
    where type record_t = GtkIconInfoRecord.t
    where type 'a icon_theme_class_t = 'a GtkIconThemeClass.t
    where type 'a style_context_class_t = 'a GtkStyleContextClass.t =
  struct
    val getType_ = _import "gtk_icon_info_get_type" : unit -> GObjectType.C.val_;
    val newForPixbuf_ = fn x1 & x2 => (_import "gtk_icon_info_new_for_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p;) (x1, x2)
    val copy_ = _import "gtk_icon_info_copy" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p -> GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p;
    val getBaseSize_ = _import "gtk_icon_info_get_base_size" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p -> FFI.Int.C.val_;
    val getBuiltinPixbuf_ = _import "gtk_icon_info_get_builtin_pixbuf" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDisplayName_ = _import "gtk_icon_info_get_display_name" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEmbeddedRect_ = fn x1 & x2 => (_import "gtk_icon_info_get_embedded_rect" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getFilename_ = _import "gtk_icon_info_get_filename" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val loadIcon_ = fn x1 & x2 => (_import "gtk_icon_info_load_icon" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val loadSymbolic_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_icon_info_load_symbolic" :
              GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               * unit GdkRgbaRecord.C.p
               * unit GdkRgbaRecord.C.p
               * unit GdkRgbaRecord.C.p
               * FFI.Bool.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val loadSymbolicForContext_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_for_context" :
              GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setRawCoordinates_ = fn x1 & x2 => (_import "gtk_icon_info_set_raw_coordinates" : GtkIconInfoRecord.C.notnull GtkIconInfoRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type record_t = GtkIconInfoRecord.t
    type 'a icon_theme_class_t = 'a GtkIconThemeClass.t
    type 'a style_context_class_t = 'a GtkStyleContextClass.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForPixbuf iconTheme pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkIconInfoRecord.C.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun copy self = (GtkIconInfoRecord.C.withPtr ---> GtkIconInfoRecord.C.fromPtr true) copy_ self
    fun getBaseSize self = (GtkIconInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoRecord.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && FFI.Bool.C.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun loadIcon self = (GtkIconInfoRecord.C.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.C.fromPtr true) loadIcon_ (self & [])
    fun loadSymbolic self fg successColor warningColor errorColor =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.C.withPtr
             &&&> GdkRgbaRecord.C.withPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> GdkRgbaRecord.C.withOptPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Bool.C.fromVal && GdkPixbufPixbufClass.C.fromPtr true
          )
            loadSymbolic_
            (
              self
               & fg
               & successColor
               & warningColor
               & errorColor
               & FFI.Bool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun loadSymbolicForContext self context =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Bool.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Bool.C.fromVal && GdkPixbufPixbufClass.C.fromPtr true
          )
            loadSymbolicForContext_
            (
              self
               & context
               & FFI.Bool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end
