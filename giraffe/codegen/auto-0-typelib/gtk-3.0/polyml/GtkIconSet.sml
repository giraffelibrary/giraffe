structure GtkIconSet :>
  GTK_ICON_SET
    where type t = GtkIconSetRecord.t
    where type icon_source_t = GtkIconSourceRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type state_type_t = GtkStateType.t
    where type text_direction_t = GtkTextDirection.t
    where type 'a style_class = 'a GtkStyleClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32.C.ValueType
        structure ElemSequence = CValueVectorSequence(GInt32.C.ValueType)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_set_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_icon_set_new") (cVoid --> GtkIconSetRecord.PolyML.cPtr)
      val newFromPixbuf_ = call (getSymbol "gtk_icon_set_new_from_pixbuf") (GdkPixbufPixbufClass.PolyML.cPtr --> GtkIconSetRecord.PolyML.cPtr)
      val addSource_ = call (getSymbol "gtk_icon_set_add_source") (GtkIconSetRecord.PolyML.cPtr &&> GtkIconSourceRecord.PolyML.cPtr --> cVoid)
      val copy_ = call (getSymbol "gtk_icon_set_copy") (GtkIconSetRecord.PolyML.cPtr --> GtkIconSetRecord.PolyML.cPtr)
      val getSizes_ =
        call (getSymbol "gtk_icon_set_get_sizes")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GInt32CVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val renderIcon_ =
        call (getSymbol "gtk_icon_set_render_icon")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleClass.PolyML.cOptPtr
             &&> GtkTextDirection.PolyML.cVal
             &&> GtkStateType.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val renderIconPixbuf_ =
        call (getSymbol "gtk_icon_set_render_icon_pixbuf")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val renderIconSurface_ =
        call (getSymbol "gtk_icon_set_render_icon_surface")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GdkWindowClass.PolyML.cOptPtr
             --> CairoSurfaceRecord.PolyML.cPtr
          )
    end
    type t = GtkIconSetRecord.t
    type icon_source_t = GtkIconSourceRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type state_type_t = GtkStateType.t
    type text_direction_t = GtkTextDirection.t
    type 'a style_class = 'a GtkStyleClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconSetRecord.FFI.fromPtr true) new_ ()
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr true) newFromPixbuf_ pixbuf
    fun addSource self source = (GtkIconSetRecord.FFI.withPtr &&&> GtkIconSourceRecord.FFI.withPtr ---> I) addSource_ (self & source)
    fun copy self = (GtkIconSetRecord.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr true) copy_ self
    fun getSizes self =
      let
        val sizes
         & nSizes
         & () =
          (
            GtkIconSetRecord.FFI.withPtr
             &&&> GInt32CVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GInt32CVectorN.FFI.fromPtr 1
                   && GInt32.FFI.fromVal
                   && I
          )
            getSizes_
            (
              self
               & NONE
               & GInt32.null
            )
      in
        sizes (LargeInt.toInt nSizes)
      end
    fun renderIcon
      self
      (
        style,
        direction,
        state,
        size,
        widget,
        detail
      ) =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleClass.FFI.withOptPtr
         &&&> GtkTextDirection.FFI.withVal
         &&&> GtkStateType.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIcon_
        (
          self
           & style
           & direction
           & state
           & size
           & widget
           & detail
        )
    fun renderIconPixbuf self (context, size) =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleContextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & context
           & size
        )
    fun renderIconSurface
      self
      (
        context,
        size,
        scale,
        forWindow
      ) =
      (
        GtkIconSetRecord.FFI.withPtr
         &&&> GtkStyleContextClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GdkWindowClass.FFI.withOptPtr
         ---> CairoSurfaceRecord.FFI.fromPtr true
      )
        renderIconSurface_
        (
          self
           & context
           & size
           & scale
           & forWindow
        )
  end
