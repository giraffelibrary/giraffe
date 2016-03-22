structure GtkAppChooserWidgetClass :>
  GTK_APP_CHOOSER_WIDGET_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a box_class = 'a GtkBoxClass.class
    open GtkBoxClass
    type 'a app_chooser_widget = unit
    type 'a class = 'a app_chooser_widget class
  end
