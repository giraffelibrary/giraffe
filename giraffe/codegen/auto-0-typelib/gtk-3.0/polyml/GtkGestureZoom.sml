structure GtkGestureZoom :>
  GTK_GESTURE_ZOOM
    where type 'a class = 'a GtkGestureZoomClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_zoom_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_zoom_new") (GtkWidgetClass.PolyML.cPtr --> GtkGestureClass.PolyML.cPtr)
      val getScaleDelta_ = call (getSymbol "gtk_gesture_zoom_get_scale_delta") (GtkGestureZoomClass.PolyML.cPtr --> GDouble.PolyML.cVal)
    end
    type 'a class = 'a GtkGestureZoomClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr ---> GtkGestureZoomClass.FFI.fromPtr true) new_ widget
    fun getScaleDelta self = (GtkGestureZoomClass.FFI.withPtr ---> GDouble.FFI.fromVal) getScaleDelta_ self
    local
      open ClosureMarshal Signal
    in
      fun scaleChangedSig f = signal "scale-changed" (get 0w1 double ---> ret_void) f
    end
  end
