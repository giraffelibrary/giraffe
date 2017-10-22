structure AtkTableCellClass :>
  ATK_TABLE_CELL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a table_cell = unit
    type 'a class = 'a table_cell class
  end
