signature GTK_SEPARATOR_TOOL_ITEM_CLASS =
  sig
    type 'a separator_tool_item
    type 'a tool_item_class
    type 'a class = 'a separator_tool_item tool_item_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
