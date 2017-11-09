signature GTK_TOOL_ITEM_GROUP_CLASS =
  sig
    type 'a tool_item_group
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a tool_item_group container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
