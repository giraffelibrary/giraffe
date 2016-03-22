structure GtkCellAreaContextClass :>
  GTK_CELL_AREA_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a cell_area_context = unit
    type 'a class = 'a cell_area_context class
  end
