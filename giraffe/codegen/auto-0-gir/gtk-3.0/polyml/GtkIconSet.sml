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
             &&> GIntCArrayN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val renderIcon_ =
        call (getSymbol "gtk_icon_set_render_icon")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleClass.PolyML.cOptPtr
             &&> GtkTextDirection.PolyML.cVal
             &&> GtkStateType.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val renderIconPixbuf_ =
        call (getSymbol "gtk_icon_set_render_icon_pixbuf")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cPtr
          )
      val renderIconSurface_ =
        call (getSymbol "gtk_icon_set_render_icon_surface")
          (
            GtkIconSetRecord.PolyML.cPtr
             &&> GtkStyleContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
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
    fun newFromPixbuf pixbuf = (GdkPixbufPixbufClass.FFI.withPtr false ---> GtkIconSetRecord.FFI.fromPtr true) newFromPixbuf_ pixbuf
    fun addSource self source = (GtkIconSetRecord.FFI.withPtr false &&&> GtkIconSourceRecord.FFI.withPtr false ---> I) addSource_ (self & source)
    fun copy self = (GtkIconSetRecord.FFI.withPtr false ---> GtkIconSetRecord.FFI.fromPtr true) copy_ self
    fun getSizes self =
      let
        val sizes
         & nSizes
         & () =
          (
            GtkIconSetRecord.FFI.withPtr false
             &&&> GIntCArrayN.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> GIntCArrayN.FFI.fromPtr ~1
                   && GInt.FFI.fromVal
                   && I
          )
            getSizes_
            (
              self
               & NONE
               & GInt.null
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
        GtkIconSetRecord.FFI.withPtr false
         &&&> GtkStyleClass.FFI.withOptPtr false
         &&&> GtkTextDirection.FFI.withVal
         &&&> GtkStateType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GtkWidgetClass.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
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
        GtkIconSetRecord.FFI.withPtr false
         &&&> GtkStyleContextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
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
        GtkIconSetRecord.FFI.withPtr false
         &&&> GtkStyleContextClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkWindowClass.FFI.withOptPtr false
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
