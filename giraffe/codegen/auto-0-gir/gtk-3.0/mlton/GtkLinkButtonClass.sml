structure GtkLinkButtonClass :>
  GTK_LINK_BUTTON_CLASS
    where type 'a button_class = 'a GtkButtonClass.class
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a button_class = 'a GtkButtonClass.class
    open GtkButtonClass
    type 'a link_button = unit
    type 'a class = 'a link_button class
  end
