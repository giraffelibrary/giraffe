signature GTK_LIST_BOX_ROW_ACCESSIBLE_CLASS =
  sig
    type 'a list_box_row_accessible
    type 'a container_accessible_class
    include
      CLASS
        where type 'a class = 'a list_box_row_accessible container_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
