structure GtkIconInfo :>
  GTK_ICON_INFO
    where type t = GtkIconInfoRecord.t
    where type 'a icon_theme_class = 'a GtkIconThemeClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    val getType_ = _import "gtk_icon_info_get_type" : unit -> GObjectType.FFI.val_;
    val newForPixbuf_ = fn x1 & x2 => (_import "gtk_icon_info_new_for_pixbuf" : GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p;) (x1, x2)
    val copy_ = _import "gtk_icon_info_copy" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p -> GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p;
    val getBaseSize_ = _import "gtk_icon_info_get_base_size" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p -> GInt32.FFI.val_;
    val getBuiltinPixbuf_ = _import "gtk_icon_info_get_builtin_pixbuf" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getDisplayName_ = _import "gtk_icon_info_get_display_name" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getEmbeddedRect_ = fn x1 & x2 => (_import "gtk_icon_info_get_embedded_rect" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getFilename_ = _import "gtk_icon_info_get_filename" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val loadIcon_ = fn x1 & x2 => (_import "gtk_icon_info_load_icon" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;) (x1, x2)
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
              GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p
               * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
               * unit GdkRgbaRecord.FFI.p
               * unit GdkRgbaRecord.FFI.p
               * unit GdkRgbaRecord.FFI.p
               * GBool.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p
               * GtkStyleContextClass.FFI.notnull GtkStyleContextClass.FFI.p
               * GBool.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setRawCoordinates_ = fn x1 & x2 => (_import "gtk_icon_info_set_raw_coordinates" : GtkIconInfoRecord.FFI.notnull GtkIconInfoRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type t = GtkIconInfoRecord.t
    type 'a icon_theme_class = 'a GtkIconThemeClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForPixbuf (iconTheme, pixbuf) = (GtkIconThemeClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> GtkIconInfoRecord.FFI.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun copy self = (GtkIconInfoRecord.FFI.withPtr ---> GtkIconInfoRecord.FFI.fromPtr true) copy_ self
    fun getBaseSize self = (GtkIconInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoRecord.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoRecord.FFI.withPtr &&&> CairoRectangleIntRecord.FFI.withNewPtr ---> CairoRectangleIntRecord.FFI.fromPtr true && GBool.FFI.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun loadIcon self = (GtkIconInfoRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) loadIcon_ (self & [])
    fun loadSymbolic
      self
      (
        fg,
        successColor,
        warningColor,
        errorColor
      ) =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.FFI.withPtr
             &&&> GdkRgbaRecord.FFI.withPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GdkRgbaRecord.FFI.withOptPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolic_
            (
              self
               & fg
               & successColor
               & warningColor
               & errorColor
               & GBool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun loadSymbolicForContext self context =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoRecord.FFI.withPtr
             &&&> GtkStyleContextClass.FFI.withPtr
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolicForContext_
            (
              self
               & context
               & GBool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end
