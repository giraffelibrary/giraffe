structure GtkRadioToolButtonClass :>
  GTK_RADIO_TOOL_BUTTON_CLASS
    where type 'a toggle_tool_button_class = 'a GtkToggleToolButtonClass.class
    where type C.notnull = GtkToggleToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleToolButtonClass.C.p =
  struct
    type 'a toggle_tool_button_class = 'a GtkToggleToolButtonClass.class
    open GtkToggleToolButtonClass
    type 'a radio_tool_button = unit
    type 'a class = 'a radio_tool_button class
  end
