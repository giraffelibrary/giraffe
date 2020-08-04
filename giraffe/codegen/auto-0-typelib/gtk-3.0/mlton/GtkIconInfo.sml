structure GtkIconInfo :>
  GTK_ICON_INFO
    where type 'a class = 'a GtkIconInfoClass.class
    where type 'a icon_theme_class = 'a GtkIconThemeClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class
    where type state_type_t = GtkStateType.t
    where type 'a style_class = 'a GtkStyleClass.class =
  struct
    val getType_ = _import "gtk_icon_info_get_type" : unit -> GObjectType.FFI.val_;
    val newForPixbuf_ = fn x1 & x2 => (_import "gtk_icon_info_new_for_pixbuf" : GtkIconThemeClass.FFI.non_opt GtkIconThemeClass.FFI.p * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p;) (x1, x2)
    val getAttachPoints_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_info_get_attach_points" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GdkPointRecordCArrayN.MLton.r1
               * (GdkPointRecordCArrayN.FFI.opt, GdkPointRecordCArrayN.FFI.non_opt) GdkPointRecordCArrayN.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getBaseScale_ = _import "gtk_icon_info_get_base_scale" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p -> GInt32.FFI.val_;
    val getBaseSize_ = _import "gtk_icon_info_get_base_size" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p -> GInt32.FFI.val_;
    val getBuiltinPixbuf_ = _import "gtk_icon_info_get_builtin_pixbuf" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val getDisplayName_ = _import "gtk_icon_info_get_display_name" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEmbeddedRect_ = fn x1 & x2 => (_import "gtk_icon_info_get_embedded_rect" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getFilename_ = _import "gtk_icon_info_get_filename" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val isSymbolic_ = _import "gtk_icon_info_is_symbolic" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p -> GBool.FFI.val_;
    val loadIcon_ = fn x1 & x2 => (_import "gtk_icon_info_load_icon" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val loadIconFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_info_load_icon_finish" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val loadSurface_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_info_load_surface" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GdkWindowClass.FFI.opt GdkWindowClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> CairoSurfaceRecord.FFI.non_opt CairoSurfaceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
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
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
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
    val loadSymbolicFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_finish" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadSymbolicForContext_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_for_context" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadSymbolicForContextFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_for_context_finish" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val loadSymbolicForStyle_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_info_load_symbolic_for_style" :
              GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p
               * GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p
               * GtkStateType.FFI.val_
               * GBool.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setRawCoordinates_ = fn x1 & x2 => (_import "gtk_icon_info_set_raw_coordinates" : GtkIconInfoClass.FFI.non_opt GtkIconInfoClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkIconInfoClass.class
    type 'a icon_theme_class = 'a GtkIconThemeClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type state_type_t = GtkStateType.t
    type 'a style_class = 'a GtkStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForPixbuf (iconTheme, pixbuf) = (GtkIconThemeClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> GtkIconInfoClass.FFI.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun getAttachPoints self =
      let
        val points
         & nPoints
         & retVal =
          (
            GtkIconInfoClass.FFI.withPtr false
             &&&> GdkPointRecordCArrayN.FFI.withRefOptPtr 0
             &&&> GInt32.FFI.withRefVal
             ---> GdkPointRecordCArrayN.FFI.fromPtr ~1
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getAttachPoints_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        if retVal then SOME (points (LargeInt.toInt nPoints)) else NONE
      end
    fun getBaseScale self = (GtkIconInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getBaseScale_ self
    fun getBaseSize self = (GtkIconInfoClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoClass.FFI.withPtr false ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getFilename_ self
    fun isSymbolic self = (GtkIconInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSymbolic_ self
    fun loadIcon self = (GtkIconInfoClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) loadIcon_ (self & [])
    fun loadIconFinish self res =
      (
        GtkIconInfoClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        loadIconFinish_
        (
          self
           & res
           & []
        )
    fun loadSurface self forWindow =
      (
        GtkIconInfoClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        loadSurface_
        (
          self
           & forWindow
           & []
        )
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
            GtkIconInfoClass.FFI.withPtr false
             &&&> GdkRgbaRecord.FFI.withPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
             &&&> GdkRgbaRecord.FFI.withOptPtr false
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
    fun loadSymbolicFinish self res =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolicFinish_
            (
              self
               & res
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
            GtkIconInfoClass.FFI.withPtr false
             &&&> GtkStyleContextClass.FFI.withPtr false
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
    fun loadSymbolicForContextFinish self res =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolicForContextFinish_
            (
              self
               & res
               & GBool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun loadSymbolicForStyle self (style, state) =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoClass.FFI.withPtr false
             &&&> GtkStyleClass.FFI.withPtr false
             &&&> GtkStateType.FFI.withVal
             &&&> GBool.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GBool.FFI.fromVal && GdkPixbufPixbufClass.FFI.fromPtr true
          )
            loadSymbolicForStyle_
            (
              self
               & style
               & state
               & GBool.null
               & []
            )
      in
        (retVal, wasSymbolic)
      end
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end
