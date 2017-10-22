structure GtkModelButtonClass :>
  GTK_MODEL_BUTTON_CLASS
    where type 'a button_class = 'a GtkButtonClass.class
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a button_class = 'a GtkButtonClass.class
    open GtkButtonClass
    type 'a model_button = unit
    type 'a class = 'a model_button class
  end
