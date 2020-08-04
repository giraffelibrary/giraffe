structure GtkGestureZoom :>
  GTK_GESTURE_ZOOM
    where type 'a class = 'a GtkGestureZoomClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_gesture_zoom_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_gesture_zoom_new" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkGestureClass.FFI.non_opt GtkGestureClass.FFI.p;
    val getScaleDelta_ = _import "gtk_gesture_zoom_get_scale_delta" : GtkGestureZoomClass.FFI.non_opt GtkGestureZoomClass.FFI.p -> GDouble.FFI.val_;
    type 'a class = 'a GtkGestureZoomClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr false ---> GtkGestureZoomClass.FFI.fromPtr true) new_ widget
    fun getScaleDelta self = (GtkGestureZoomClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getScaleDelta_ self
    local
      open ClosureMarshal Signal
    in
      fun scaleChangedSig f = signal "scale-changed" (get 0w1 double ---> ret_void) f
    end
  end
