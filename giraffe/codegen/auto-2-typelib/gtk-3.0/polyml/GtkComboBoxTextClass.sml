structure GtkComboBoxTextClass :>
  GTK_COMBO_BOX_TEXT_CLASS
    where type 'a comboboxclass_t = 'a GtkComboBoxClass.t
    where type C.notnull = GtkComboBoxClass.C.notnull
    where type 'a C.p = 'a GtkComboBoxClass.C.p =
  struct
    type 'a comboboxtext = unit
    type 'a comboboxclass_t = 'a GtkComboBoxClass.t
    type 'a t = 'a comboboxtext comboboxclass_t
    fun toBase obj = obj
    val t = GtkComboBoxClass.t
    val tOpt = GtkComboBoxClass.tOpt
    structure C = GtkComboBoxClass.C
  end
