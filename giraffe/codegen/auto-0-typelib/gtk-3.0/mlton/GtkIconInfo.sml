structure GtkIconInfo :>
  GTK_ICON_INFO
    where type 'a class = 'a GtkIconInfoClass.class
    where type 'a icon_theme_class = 'a GtkIconThemeClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class
    where type state_type_t = GtkStateType.t
    where type 'a style_class = 'a GtkStyleClass.class =
  struct
    structure GdkPointRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkPointRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkPointRecordCVectorN = CVectorN(GdkPointRecordCVectorNType)
    val getType_ = _import "gtk_icon_info_get_type" : unit -> GObjectType.FFI.val_;
    val newForPixbuf_ = fn x1 & x2 => (_import "gtk_icon_info_new_for_pixbuf" : GtkIconThemeClass.FFI.notnull GtkIconThemeClass.FFI.p * GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p -> GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p;) (x1, x2)
    val getAttachPoints_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_icon_info_get_attach_points" :
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
               * GdkPointRecordCVectorN.MLton.r1
               * (unit, GdkPointRecordCVectorN.FFI.notnull) GdkPointRecordCVectorN.MLton.r2
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getBaseScale_ = _import "gtk_icon_info_get_base_scale" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p -> GInt32.FFI.val_;
    val getBaseSize_ = _import "gtk_icon_info_get_base_size" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p -> GInt32.FFI.val_;
    val getBuiltinPixbuf_ = _import "gtk_icon_info_get_builtin_pixbuf" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p -> unit GdkPixbufPixbufClass.FFI.p;
    val getDisplayName_ = _import "gtk_icon_info_get_display_name" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getEmbeddedRect_ = fn x1 & x2 => (_import "gtk_icon_info_get_embedded_rect" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getFilename_ = _import "gtk_icon_info_get_filename" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p -> unit Utf8.FFI.out_p;
    val isSymbolic_ = _import "gtk_icon_info_is_symbolic" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p -> GBool.FFI.val_;
    val loadIcon_ = fn x1 & x2 => (_import "gtk_icon_info_load_icon" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val loadIconFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_info_load_icon_finish" :
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
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
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
               * unit GdkWindowClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> CairoSurfaceRecord.FFI.notnull CairoSurfaceRecord.FFI.p;
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
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
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
    val loadSymbolicFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_finish" :
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
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
    val loadSymbolicForContext_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_for_context" :
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
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
    val loadSymbolicForContextFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_info_load_symbolic_for_context_finish" :
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
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
    val loadSymbolicForStyle_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_info_load_symbolic_for_style" :
              GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p
               * GtkStyleClass.FFI.notnull GtkStyleClass.FFI.p
               * GtkStateType.FFI.val_
               * GBool.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setRawCoordinates_ = fn x1 & x2 => (_import "gtk_icon_info_set_raw_coordinates" : GtkIconInfoClass.FFI.notnull GtkIconInfoClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkIconInfoClass.class
    type 'a icon_theme_class = 'a GtkIconThemeClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type state_type_t = GtkStateType.t
    type 'a style_class = 'a GtkStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForPixbuf (iconTheme, pixbuf) = (GtkIconThemeClass.FFI.withPtr &&&> GdkPixbufPixbufClass.FFI.withPtr ---> GtkIconInfoClass.FFI.fromPtr true) newForPixbuf_ (iconTheme & pixbuf)
    fun getAttachPoints self =
      let
        val points
         & nPoints
         & retVal =
          (
            GtkIconInfoClass.FFI.withPtr
             &&&> GdkPointRecordCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GdkPointRecordCVectorN.FFI.fromPtr 1
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
    fun getBaseScale self = (GtkIconInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getBaseScale_ self
    fun getBaseSize self = (GtkIconInfoClass.FFI.withPtr ---> GInt32.FFI.fromVal) getBaseSize_ self
    fun getBuiltinPixbuf self = (GtkIconInfoClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getBuiltinPixbuf_ self
    fun getDisplayName self = (GtkIconInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getEmbeddedRect self =
      let
        val rectangle & retVal = (GtkIconInfoClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getEmbeddedRect_ (self & ())
      in
        if retVal then SOME rectangle else NONE
      end
    fun getFilename self = (GtkIconInfoClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getFilename_ self
    fun isSymbolic self = (GtkIconInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) isSymbolic_ self
    fun loadIcon self = (GtkIconInfoClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GdkPixbufPixbufClass.FFI.fromPtr true) loadIcon_ (self & [])
    fun loadIconFinish self res =
      (
        GtkIconInfoClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
        GtkIconInfoClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withOptPtr
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
            GtkIconInfoClass.FFI.withPtr
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
    fun loadSymbolicFinish self res =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
            GtkIconInfoClass.FFI.withPtr
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
    fun loadSymbolicForContextFinish self res =
      let
        val wasSymbolic & retVal =
          (
            GtkIconInfoClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
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
            GtkIconInfoClass.FFI.withPtr
             &&&> GtkStyleClass.FFI.withPtr
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
    fun setRawCoordinates self rawCoordinates = (GtkIconInfoClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRawCoordinates_ (self & rawCoordinates)
  end
