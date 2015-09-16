structure GtkSeparatorToolItemClass :>
  GTK_SEPARATOR_TOOL_ITEM_CLASS
    where type 'a tool_item_class_t = 'a GtkToolItemClass.t
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a separator_tool_item = unit
    type 'a tool_item_class_t = 'a GtkToolItemClass.t
    type 'a t = 'a separator_tool_item tool_item_class_t
    fun toBase obj = obj
    val t = GtkToolItemClass.t
    val tOpt = GtkToolItemClass.tOpt
    structure C = GtkToolItemClass.C
  end
