structure GtkRendererCellAccessibleClass :>
  GTK_RENDERER_CELL_ACCESSIBLE_CLASS
    where type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    where type C.notnull = GtkCellAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkCellAccessibleClass.C.p =
  struct
    type 'a cell_accessible_class = 'a GtkCellAccessibleClass.class
    open GtkCellAccessibleClass
    type 'a renderer_cell_accessible = unit
    type 'a class = 'a renderer_cell_accessible class
  end
