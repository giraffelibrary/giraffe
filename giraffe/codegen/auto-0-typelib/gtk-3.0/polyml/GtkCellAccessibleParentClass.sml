structure GtkCellAccessibleParentClass :>
  GTK_CELL_ACCESSIBLE_PARENT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a cell_accessible_parent = unit
    type 'a class = 'a cell_accessible_parent class
  end
