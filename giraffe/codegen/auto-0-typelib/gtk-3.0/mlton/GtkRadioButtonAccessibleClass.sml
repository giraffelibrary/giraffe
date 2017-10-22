structure GtkRadioButtonAccessibleClass :>
  GTK_RADIO_BUTTON_ACCESSIBLE_CLASS
    where type 'a toggle_button_accessible_class = 'a GtkToggleButtonAccessibleClass.class
    where type C.notnull = GtkToggleButtonAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkToggleButtonAccessibleClass.C.p =
  struct
    type 'a toggle_button_accessible_class = 'a GtkToggleButtonAccessibleClass.class
    open GtkToggleButtonAccessibleClass
    type 'a radio_button_accessible = unit
    type 'a class = 'a radio_button_accessible class
  end
