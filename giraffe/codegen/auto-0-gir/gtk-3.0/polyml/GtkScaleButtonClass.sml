structure GtkScaleButtonClass :>
  GTK_SCALE_BUTTON_CLASS
    where type 'a button_class = 'a GtkButtonClass.class
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a button_class = 'a GtkButtonClass.class
    open GtkButtonClass
    type 'a scale_button = unit
    type 'a class = 'a scale_button class
  end
