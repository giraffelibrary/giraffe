structure GtkCheckButtonClass :>
  GTK_CHECK_BUTTON_CLASS
    where type 'a toggle_button_class = 'a GtkToggleButtonClass.class
    where type C.notnull = GtkToggleButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleButtonClass.C.p =
  struct
    type 'a toggle_button_class = 'a GtkToggleButtonClass.class
    open GtkToggleButtonClass
    type 'a check_button = unit
    type 'a class = 'a check_button class
  end
