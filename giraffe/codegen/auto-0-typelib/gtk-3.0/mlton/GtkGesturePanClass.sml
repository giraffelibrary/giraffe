structure GtkGesturePanClass :>
  GTK_GESTURE_PAN_CLASS
    where type 'a gesture_drag_class = 'a GtkGestureDragClass.class
    where type C.notnull = GtkGestureDragClass.C.notnull
    where type 'a C.p = 'a GtkGestureDragClass.C.p =
  struct
    type 'a gesture_drag_class = 'a GtkGestureDragClass.class
    open GtkGestureDragClass
    type 'a gesture_pan = unit
    type 'a class = 'a gesture_pan class
  end
