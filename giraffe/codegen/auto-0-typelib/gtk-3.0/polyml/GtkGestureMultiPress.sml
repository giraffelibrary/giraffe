structure GtkGestureMultiPress :>
  GTK_GESTURE_MULTI_PRESS
    where type 'a class = 'a GtkGestureMultiPressClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_gesture_multi_press_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_gesture_multi_press_new") (GtkWidgetClass.PolyML.cPtr --> GtkGestureClass.PolyML.cPtr)
      val getArea_ = call (getSymbol "gtk_gesture_multi_press_get_area") (GtkGestureMultiPressClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setArea_ = call (getSymbol "gtk_gesture_multi_press_set_area") (GtkGestureMultiPressClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cOptPtr --> cVoid)
    end
    type 'a class = 'a GtkGestureMultiPressClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr false ---> GtkGestureMultiPressClass.FFI.fromPtr true) new_ widget
    fun getArea self =
      let
        val rect & retVal = (GtkGestureMultiPressClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun setArea self rect = (GtkGestureMultiPressClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withOptPtr false ---> I) setArea_ (self & rect)
    local
      open ClosureMarshal Signal
    in
      fun pressedSig f =
        signal "pressed"
          (
            get 0w1 int
             &&&> get 0w2 double
             &&&> get 0w3 double
             ---> ret_void
          )
          (
            fn
              nPress
               & x
               & y =>
                f
                  (
                    nPress,
                    x,
                    y
                  )
          )
      fun releasedSig f =
        signal "released"
          (
            get 0w1 int
             &&&> get 0w2 double
             &&&> get 0w3 double
             ---> ret_void
          )
          (
            fn
              nPress
               & x
               & y =>
                f
                  (
                    nPress,
                    x,
                    y
                  )
          )
      fun stoppedSig f = signal "stopped" (void ---> ret_void) f
    end
  end
