structure GtkAppChooserButtonClass :>
  GTK_APP_CHOOSER_BUTTON_CLASS
    where type 'a combo_box_class_t = 'a GtkComboBoxClass.t
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a app_chooser_button = unit
    type 'a combo_box_class_t = 'a GtkComboBoxClass.t
    type 'a t = 'a app_chooser_button combo_box_class_t
    fun toBase obj = obj
    val t = GtkComboBoxClass.t
    val tOpt = GtkComboBoxClass.tOpt
    structure C = GtkComboBoxClass.C
  end
