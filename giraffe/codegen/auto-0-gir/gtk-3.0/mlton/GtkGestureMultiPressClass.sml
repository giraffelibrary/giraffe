structure GtkGestureMultiPressClass :>
  GTK_GESTURE_MULTI_PRESS_CLASS
    where type 'a gesture_single_class = 'a GtkGestureSingleClass.class
    where type C.notnull = GtkGestureSingleClass.C.notnull
    where type 'a C.p = 'a GtkGestureSingleClass.C.p =
  struct
    type 'a gesture_single_class = 'a GtkGestureSingleClass.class
    open GtkGestureSingleClass
    type 'a gesture_multi_press = unit
    type 'a class = 'a gesture_multi_press class
  end
