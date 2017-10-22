structure GtkShortcutsSectionClass :>
  GTK_SHORTCUTS_SECTION_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a box_class = 'a GtkBoxClass.class
    open GtkBoxClass
    type 'a shortcuts_section = unit
    type 'a class = 'a shortcuts_section class
  end
