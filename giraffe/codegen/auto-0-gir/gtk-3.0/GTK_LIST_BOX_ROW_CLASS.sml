signature GTK_LIST_BOX_ROW_CLASS =
  sig
    type 'a list_box_row
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a list_box_row bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
