structure GtkHandleBoxClass :>
  GTK_HANDLE_BOX_CLASS
    where type 'a bin_class = 'a GtkBinClass.class
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a bin_class = 'a GtkBinClass.class
    open GtkBinClass
    type 'a handle_box = unit
    type 'a class = 'a handle_box class
  end
