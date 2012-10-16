structure GtkCellAreaBoxClass :>
  GTK_CELL_AREA_BOX_CLASS
    where type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    where type C.notnull = GtkCellAreaClass.C.notnull
    where type 'a C.p = 'a GtkCellAreaClass.C.p =
  struct
    type 'a cellareabox = unit
    type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    type 'a t = 'a cellareabox cellareaclass_t
    fun toBase obj = obj
    val t = GtkCellAreaClass.t
    val tOpt = GtkCellAreaClass.tOpt
    structure C = GtkCellAreaClass.C
  end
