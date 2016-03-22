signature GTK_TOOL_ITEM_CLASS =
  sig
    type 'a tool_item
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a tool_item bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
