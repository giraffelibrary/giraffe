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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newForPixbuf_ = call (getSymbol "gtk_icon_info_new_for_pixbuf") (GtkIconThemeClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> GtkIconInfoClass.PolyML.cPtr)
      val getAttachPoints_ =
        call (getSymbol "gtk_icon_info_get_attach_points")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GdkPointRecordCVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getBaseScale_ = call (getSymbol "gtk_icon_info_get_base_scale") (GtkIconInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getBaseSize_ = call (getSymbol "gtk_icon_info_get_base_size") (GtkIconInfoClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getBuiltinPixbuf_ = call (getSymbol "gtk_icon_info_get_builtin_pixbuf") (GtkIconInfoClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getDisplayName_ = call (getSymbol "gtk_icon_info_get_display_name") (GtkIconInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEmbeddedRect_ = call (getSymbol "gtk_icon_info_get_embedded_rect") (GtkIconInfoClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFilename_ = call (getSymbol "gtk_icon_info_get_filename") (GtkIconInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val isSymbolic_ = call (getSymbol "gtk_icon_info_is_symbolic") (GtkIconInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val loadIcon_ = call (getSymbol "gtk_icon_info_load_icon") (GtkIconInfoClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GdkPixbufPixbufClass.PolyML.cPtr)
      val loadIconFinish_ =
        call (getSymbol "gtk_icon_info_load_icon_finish")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val loadSurface_ =
        call (getSymbol "gtk_icon_info_load_surface")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> CairoSurfaceRecord.PolyML.cPtr
          )
      val loadSymbolic_ =
        call (getSymbol "gtk_icon_info_load_symbolic")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val loadSymbolicFinish_ =
        call (getSymbol "gtk_icon_info_load_symbolic_finish")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val loadSymbolicForContext_ =
        call (getSymbol "gtk_icon_info_load_symbolic_for_context")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val loadSymbolicForContextFinish_ =
        call (getSymbol "gtk_icon_info_load_symbolic_for_context_finish")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val loadSymbolicForStyle_ =
        call (getSymbol "gtk_icon_info_load_symbolic_for_style")
          (
            GtkIconInfoClass.PolyML.cPtr
             &&> GtkStyleClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GBool.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val setRawCoordinates_ = call (getSymbol "gtk_icon_info_set_raw_coordinates") (GtkIconInfoClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
