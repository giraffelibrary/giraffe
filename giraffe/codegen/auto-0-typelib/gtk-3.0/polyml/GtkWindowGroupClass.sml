structure GtkWindowGroupClass :>
  GTK_WINDOW_GROUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a window_group = unit
    type 'a class = 'a window_group class
  end
