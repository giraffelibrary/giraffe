structure GtkToolButtonClass :>
  GTK_TOOL_BUTTON_CLASS
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a tool_item_class = 'a GtkToolItemClass.class
    open GtkToolItemClass
    type 'a tool_button = unit
    type 'a class = 'a tool_button class
  end
