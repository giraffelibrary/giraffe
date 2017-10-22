structure GtkPadControllerClass :>
  GTK_PAD_CONTROLLER_CLASS
    where type 'a event_controller_class = 'a GtkEventControllerClass.class
    where type C.notnull = GtkEventControllerClass.C.notnull
    where type 'a C.p = 'a GtkEventControllerClass.C.p =
  struct
    type 'a event_controller_class = 'a GtkEventControllerClass.class
    open GtkEventControllerClass
    type 'a pad_controller = unit
    type 'a class = 'a pad_controller class
  end
