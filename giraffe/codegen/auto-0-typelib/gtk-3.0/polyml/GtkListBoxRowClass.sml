structure GtkListBoxRowClass :>
  GTK_LIST_BOX_ROW_CLASS
    where type 'a bin_class = 'a GtkBinClass.class
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a bin_class = 'a GtkBinClass.class
    open GtkBinClass
    type 'a list_box_row = unit
    type 'a class = 'a list_box_row class
  end
