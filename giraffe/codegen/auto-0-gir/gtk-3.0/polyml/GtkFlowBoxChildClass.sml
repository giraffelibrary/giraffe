structure GtkFlowBoxChildClass :>
  GTK_FLOW_BOX_CHILD_CLASS
    where type 'a bin_class = 'a GtkBinClass.class
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a bin_class = 'a GtkBinClass.class
    open GtkBinClass
    type 'a flow_box_child = unit
    type 'a class = 'a flow_box_child class
  end
