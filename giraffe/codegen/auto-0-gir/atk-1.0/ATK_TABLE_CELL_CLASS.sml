signature ATK_TABLE_CELL_CLASS =
  sig
    type 'a table_cell
    include
      CLASS
        where type 'a class = 'a table_cell GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
