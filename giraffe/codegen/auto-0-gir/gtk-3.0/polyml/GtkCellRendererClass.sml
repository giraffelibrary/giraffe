structure GtkCellRendererClass :>
  GTK_CELL_RENDERER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    type 'a cell_renderer = unit
    type 'a class = 'a cell_renderer GObjectInitiallyUnownedClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectInitiallyUnownedClass.t
    val tOpt = GObjectInitiallyUnownedClass.tOpt
    structure C = GObjectInitiallyUnownedClass.C
  end
