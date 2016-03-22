structure GtkCellAreaClass :>
  GTK_CELL_AREA_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a cell_area = unit
    type 'a class = 'a cell_area class
  end
