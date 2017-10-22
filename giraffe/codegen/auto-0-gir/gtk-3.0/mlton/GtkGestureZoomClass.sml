structure GtkGestureZoomClass :>
  GTK_GESTURE_ZOOM_CLASS
    where type 'a gesture_class = 'a GtkGestureClass.class
    where type C.notnull = GtkGestureClass.C.notnull
    where type 'a C.p = 'a GtkGestureClass.C.p =
  struct
    type 'a gesture_class = 'a GtkGestureClass.class
    open GtkGestureClass
    type 'a gesture_zoom = unit
    type 'a class = 'a gesture_zoom class
  end
