structure GtkVButtonBoxClass :>
  GTK_V_BUTTON_BOX_CLASS
    where type 'a button_box_class = 'a GtkButtonBoxClass.class
    where type C.notnull = GtkButtonBoxClass.C.notnull
    where type 'a C.p = 'a GtkButtonBoxClass.C.p =
  struct
    type 'a button_box_class = 'a GtkButtonBoxClass.class
    open GtkButtonBoxClass
    type 'a v_button_box = unit
    type 'a class = 'a v_button_box class
  end
