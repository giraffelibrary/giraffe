structure GtkComboBoxTextClass :>
  GTK_COMBO_BOX_TEXT_CLASS
    where type 'a combo_box_class = 'a GtkComboBoxClass.class
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a combo_box_text = unit
    type 'a combo_box_class = 'a GtkComboBoxClass.class
    type 'a class = 'a combo_box_text combo_box_class
    type t = base class
    fun toBase obj = obj
    val t = GtkComboBoxClass.t
    val tOpt = GtkComboBoxClass.tOpt
    structure C = GtkComboBoxClass.C
  end
