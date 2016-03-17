structure GtkAppChooserButtonClass :>
  GTK_APP_CHOOSER_BUTTON_CLASS
    where type 'a combo_box_class = 'a GtkComboBoxClass.class
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a app_chooser_button = unit
    type 'a combo_box_class = 'a GtkComboBoxClass.class
    type 'a class = 'a app_chooser_button combo_box_class
    type t = base class
    fun toBase obj = obj
    val t = GtkComboBoxClass.t
    val tOpt = GtkComboBoxClass.tOpt
    structure C = GtkComboBoxClass.C
  end
