structure GtkComboBoxTextClass :>
  GTK_COMBO_BOX_TEXT_CLASS
    where type 'a combo_box_class_t = 'a GtkComboBoxClass.t
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a combo_box_text = unit
    type 'a combo_box_class_t = 'a GtkComboBoxClass.t
    type 'a t = 'a combo_box_text combo_box_class_t
    fun toBase obj = obj
    val t = GtkComboBoxClass.t
    val tOpt = GtkComboBoxClass.tOpt
    structure C = GtkComboBoxClass.C
  end
