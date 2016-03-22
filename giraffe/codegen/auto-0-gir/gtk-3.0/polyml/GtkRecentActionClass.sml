structure GtkRecentActionClass :>
  GTK_RECENT_ACTION_CLASS
    where type 'a action_class = 'a GtkActionClass.class
    where type C.notnull = GtkActionClass.C.notnull
    where type 'a C.p = 'a GtkActionClass.C.p =
  struct
    type 'a action_class = 'a GtkActionClass.class
    open GtkActionClass
    type 'a recent_action = unit
    type 'a class = 'a recent_action class
  end
