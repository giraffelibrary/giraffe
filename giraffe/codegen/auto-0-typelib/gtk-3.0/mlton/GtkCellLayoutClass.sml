structure GtkCellLayoutClass :>
  GTK_CELL_LAYOUT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a cell_layout = unit
    type 'a class = 'a cell_layout class
  end
