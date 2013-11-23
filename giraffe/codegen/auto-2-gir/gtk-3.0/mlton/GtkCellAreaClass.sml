structure GtkCellAreaClass :>
  GTK_CELL_AREA_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    type 'a cellarea = unit
    type 'a t = 'a cellarea GObjectInitiallyUnownedClass.t
    fun toBase obj = obj
    val t = GObjectInitiallyUnownedClass.t
    val tOpt = GObjectInitiallyUnownedClass.tOpt
    structure C = GObjectInitiallyUnownedClass.C
  end
