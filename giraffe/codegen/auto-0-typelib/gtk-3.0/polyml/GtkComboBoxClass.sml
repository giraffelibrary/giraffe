structure GtkComboBoxClass :>
  GTK_COMBO_BOX_CLASS
    where type 'a binclass_t = 'a GtkBinClass.t
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a combobox = unit
    type 'a binclass_t = 'a GtkBinClass.t
    type 'a t = 'a combobox binclass_t
    fun toBase obj = obj
    val t = GtkBinClass.t
    val tOpt = GtkBinClass.tOpt
    structure C = GtkBinClass.C
  end
