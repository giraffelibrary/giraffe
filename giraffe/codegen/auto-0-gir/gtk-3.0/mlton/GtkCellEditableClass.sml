structure GtkCellEditableClass :>
  GTK_CELL_EDITABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a cell_editable = unit
    type 'a class = 'a cell_editable class
  end
