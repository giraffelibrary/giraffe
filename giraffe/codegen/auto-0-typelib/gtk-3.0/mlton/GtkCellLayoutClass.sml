structure GtkCellLayoutClass :>
  GTK_CELL_LAYOUT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a cell_layout = unit
    type 'a class = 'a cell_layout class
  end
