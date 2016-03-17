structure GtkCellAreaBoxClass :>
  GTK_CELL_AREA_BOX_CLASS
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type C.notnull = GtkCellAreaClass.C.notnull
    where type 'a C.p = 'a GtkCellAreaClass.C.p =
  struct
    type 'a cell_area_box = unit
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a class = 'a cell_area_box cell_area_class
    type t = base class
    fun toBase obj = obj
    val t = GtkCellAreaClass.t
    val tOpt = GtkCellAreaClass.tOpt
    structure C = GtkCellAreaClass.C
  end
