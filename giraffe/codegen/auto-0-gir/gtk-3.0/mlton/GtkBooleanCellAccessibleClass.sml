structure GtkBooleanCellAccessibleClass :>
  GTK_BOOLEAN_CELL_ACCESSIBLE_CLASS
    where type 'a renderer_cell_accessible_class = 'a GtkRendererCellAccessibleClass.class
    where type C.notnull = GtkRendererCellAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkRendererCellAccessibleClass.C.p =
  struct
    type 'a renderer_cell_accessible_class = 'a GtkRendererCellAccessibleClass.class
    open GtkRendererCellAccessibleClass
    type 'a boolean_cell_accessible = unit
    type 'a class = 'a boolean_cell_accessible class
  end
