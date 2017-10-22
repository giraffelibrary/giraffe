structure GtkShortcutsGroupClass :>
  GTK_SHORTCUTS_GROUP_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a box_class = 'a GtkBoxClass.class
    open GtkBoxClass
    type 'a shortcuts_group = unit
    type 'a class = 'a shortcuts_group class
  end
