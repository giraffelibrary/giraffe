structure GtkAppChooserClass :>
  GTK_APP_CHOOSER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a app_chooser = unit
    type 'a class = 'a app_chooser class
  end
