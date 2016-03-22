structure GtkCellRendererClass :>
  GTK_CELL_RENDERER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a cell_renderer = unit
    type 'a class = 'a cell_renderer class
  end
