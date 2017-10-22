structure GtkGestureMultiPress :>
  GTK_GESTURE_MULTI_PRESS
    where type 'a class = 'a GtkGestureMultiPressClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_gesture_multi_press_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_gesture_multi_press_new" : GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GtkGestureClass.FFI.notnull GtkGestureClass.FFI.p;
    val getArea_ = fn x1 & x2 => (_import "gtk_gesture_multi_press_get_area" : GtkGestureMultiPressClass.FFI.notnull GtkGestureMultiPressClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setArea_ = fn x1 & x2 => (_import "gtk_gesture_multi_press_set_area" : GtkGestureMultiPressClass.FFI.notnull GtkGestureMultiPressClass.FFI.p * unit GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkGestureMultiPressClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new widget = (GtkWidgetClass.FFI.withPtr ---> GtkGestureMultiPressClass.FFI.fromPtr true) new_ widget
    fun getArea self =
      let
        val rect & retVal = (GtkGestureMultiPressClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getArea_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun setArea self rect = (GtkGestureMultiPressClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withOptPtr ---> I) setArea_ (self & rect)
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
