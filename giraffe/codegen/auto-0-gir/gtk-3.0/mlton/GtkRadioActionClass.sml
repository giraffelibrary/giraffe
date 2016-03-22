structure GtkRadioActionClass :>
  GTK_RADIO_ACTION_CLASS
    where type 'a toggle_action_class = 'a GtkToggleActionClass.class
    where type C.notnull = GtkToggleActionClass.C.notnull
    where type 'a C.p = 'a GtkToggleActionClass.C.p =
  struct
    type 'a toggle_action_class = 'a GtkToggleActionClass.class
    open GtkToggleActionClass
    type 'a radio_action = unit
    type 'a class = 'a radio_action class
  end
