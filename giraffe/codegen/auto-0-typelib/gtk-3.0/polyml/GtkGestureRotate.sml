structure GtkGestureRotate :>
  GTK_GESTURE_ROTATE
    where type 'a class = 'a GtkGestureRotateClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_rotate_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_rotate_new") (GtkWidgetClass.PolyML.cPtr --> GtkGestureClass.PolyML.cPtr)
      val getAngleDelta_ = call (getSymbol "gtk_gesture_rotate_get_angle_delta") (GtkGestureRotateClass.PolyML.cPtr --> GDouble.PolyML.cVal)
    end
    type 'a class = 'a GtkGestureRotateClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr false ---> GtkGestureRotateClass.FFI.fromPtr true) new_ widget
    fun getAngleDelta self = (GtkGestureRotateClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getAngleDelta_ self
    local
      open ClosureMarshal Signal
    in
      fun angleChangedSig f = signal "angle-changed" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn angle & angleDelta => f (angle, angleDelta))
    end
  end
