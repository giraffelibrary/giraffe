structure GtkCellAreaBoxClass :>
  GTK_CELL_AREA_BOX_CLASS
    where type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    where type C.notnull = GtkCellAreaClass.C.notnull
    where type 'a C.p = 'a GtkCellAreaClass.C.p =
  struct
    type 'a cell_area_box = unit
    type 'a cell_area_class_t = 'a GtkCellAreaClass.t
    type 'a t = 'a cell_area_box cell_area_class_t
    fun toBase obj = obj
    val t = GtkCellAreaClass.t
    val tOpt = GtkCellAreaClass.tOpt
    structure C = GtkCellAreaClass.C
  end
