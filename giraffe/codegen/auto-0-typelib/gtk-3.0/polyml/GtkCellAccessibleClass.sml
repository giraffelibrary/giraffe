structure GtkCellAccessibleClass :>
  GTK_CELL_ACCESSIBLE_CLASS
    where type 'a accessible_class = 'a GtkAccessibleClass.class
    where type C.notnull = GtkAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkAccessibleClass.C.p =
  struct
    type 'a accessible_class = 'a GtkAccessibleClass.class
    open GtkAccessibleClass
    type 'a cell_accessible = unit
    type 'a class = 'a cell_accessible class
  end
