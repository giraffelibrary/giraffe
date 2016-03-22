structure GtkRadioButtonClass :>
  GTK_RADIO_BUTTON_CLASS
    where type 'a check_button_class = 'a GtkCheckButtonClass.class
    where type C.notnull = GtkCheckButtonClass.C.notnull
    where type 'a C.p = 'a GtkCheckButtonClass.C.p =
  struct
    type 'a check_button_class = 'a GtkCheckButtonClass.class
    open GtkCheckButtonClass
    type 'a radio_button = unit
    type 'a class = 'a radio_button class
  end
