signature GTK_SEPARATOR_TOOL_ITEM_CLASS =
  sig
    type 'a separator_tool_item
    type 'a tool_item_class
    include
      CLASS
        where type 'a class = 'a separator_tool_item tool_item_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
