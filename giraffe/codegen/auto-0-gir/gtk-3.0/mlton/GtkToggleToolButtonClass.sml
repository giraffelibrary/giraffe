structure GtkToggleToolButtonClass :>
  GTK_TOGGLE_TOOL_BUTTON_CLASS
    where type 'a tool_button_class = 'a GtkToolButtonClass.class
    where type C.notnull = GtkToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToolButtonClass.C.p =
  struct
    type 'a tool_button_class = 'a GtkToolButtonClass.class
    open GtkToolButtonClass
    type 'a toggle_tool_button = unit
    type 'a class = 'a toggle_tool_button class
  end
