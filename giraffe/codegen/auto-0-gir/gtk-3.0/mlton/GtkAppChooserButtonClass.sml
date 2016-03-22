structure GtkAppChooserButtonClass :>
  GTK_APP_CHOOSER_BUTTON_CLASS
    where type 'a combo_box_class = 'a GtkComboBoxClass.class
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a combo_box_class = 'a GtkComboBoxClass.class
    open GtkComboBoxClass
    type 'a app_chooser_button = unit
    type 'a class = 'a app_chooser_button class
  end
