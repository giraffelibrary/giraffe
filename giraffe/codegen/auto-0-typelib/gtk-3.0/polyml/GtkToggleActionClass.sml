structure GtkToggleActionClass :>
  GTK_TOGGLE_ACTION_CLASS
    where type 'a action_class = 'a GtkActionClass.class
    where type C.notnull = GtkActionClass.C.notnull
    where type 'a C.p = 'a GtkActionClass.C.p =
  struct
    type 'a action_class = 'a GtkActionClass.class
    open GtkActionClass
    type 'a toggle_action = unit
    type 'a class = 'a toggle_action class
  end
