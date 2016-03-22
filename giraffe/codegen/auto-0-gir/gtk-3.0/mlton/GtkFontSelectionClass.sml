structure GtkFontSelectionClass :>
  GTK_FONT_SELECTION_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a box_class = 'a GtkBoxClass.class
    open GtkBoxClass
    type 'a font_selection = unit
    type 'a class = 'a font_selection class
  end
