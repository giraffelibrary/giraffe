structure GtkShortcutLabelClass :>
  GTK_SHORTCUT_LABEL_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a box_class = 'a GtkBoxClass.class
    open GtkBoxClass
    type 'a shortcut_label = unit
    type 'a class = 'a shortcut_label class
  end
