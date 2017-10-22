structure GtkPopoverMenuClass :>
  GTK_POPOVER_MENU_CLASS
    where type 'a popover_class = 'a GtkPopoverClass.class
    where type C.notnull = GtkPopoverClass.C.notnull
    where type 'a C.p = 'a GtkPopoverClass.C.p =
  struct
    type 'a popover_class = 'a GtkPopoverClass.class
    open GtkPopoverClass
    type 'a popover_menu = unit
    type 'a class = 'a popover_menu class
  end
