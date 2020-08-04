structure GtkGestureLongPress :>
  GTK_GESTURE_LONG_PRESS
    where type 'a class = 'a GtkGestureLongPressClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_long_press_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_long_press_new") (GtkWidgetClass.PolyML.cPtr --> GtkGestureClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkGestureLongPressClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr false ---> GtkGestureLongPressClass.FFI.fromPtr true) new_ widget
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
      fun pressedSig f = signal "pressed" (get 0w1 double &&&> get 0w2 double ---> ret_void) (fn x & y => f (x, y))
    end
    local
      open Property
    in
      val delayFactorProp =
        {
          get = fn x => get "delay-factor" double x,
          set = fn x => set "delay-factor" double x,
          new = fn x => new "delay-factor" double x
        }
    end
  end
