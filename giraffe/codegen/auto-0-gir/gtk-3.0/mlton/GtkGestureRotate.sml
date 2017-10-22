structure GtkGestureRotate :>
  GTK_GESTURE_ROTATE
    where type 'a class = 'a GtkGestureRotateClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_gesture_rotate_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_gesture_rotate_new" : GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p;
    val getAngleDelta_ = _import "gtk_gesture_rotate_get_angle_delta" : GtkGestureRotateClass.FFI.notnull GtkGestureRotateClass.FFI.p -> GDouble.FFI.val_;
    type 'a class = 'a GtkGestureRotateClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr ---> GtkGestureRotateClass.FFI.fromPtr true) new_ widget
    fun getAngleDelta self = (GtkGestureRotateClass.FFI.withPtr ---> GDouble.FFI.fromVal) getAngleDelta_ self
    local
      open ClosureMarshal Signal
    in
      fun angleChangedSig f = signal "angle-changed" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn angle & angleDelta => f (angle, angleDelta))
    end
  end
