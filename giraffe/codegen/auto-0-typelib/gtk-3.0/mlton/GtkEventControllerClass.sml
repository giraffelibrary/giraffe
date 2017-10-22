structure GtkEventControllerClass :>
  GTK_EVENT_CONTROLLER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a event_controller = unit
    type 'a class = 'a event_controller class
  end
