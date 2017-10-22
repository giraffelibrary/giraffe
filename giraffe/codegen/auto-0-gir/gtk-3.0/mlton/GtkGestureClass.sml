structure GtkGestureClass :>
  GTK_GESTURE_CLASS
    where type 'a event_controller_class = 'a GtkEventControllerClass.class
    where type C.notnull = GtkEventControllerClass.C.notnull
    where type 'a C.p = 'a GtkEventControllerClass.C.p =
  struct
    type 'a event_controller_class = 'a GtkEventControllerClass.class
    open GtkEventControllerClass
    type 'a gesture = unit
    type 'a class = 'a gesture class
  end
