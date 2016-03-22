structure GtkComboBoxTextClass :>
  GTK_COMBO_BOX_TEXT_CLASS
    where type 'a combo_box_class = 'a GtkComboBoxClass.class
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a combo_box_class = 'a GtkComboBoxClass.class
    open GtkComboBoxClass
    type 'a combo_box_text = unit
    type 'a class = 'a combo_box_text class
  end
