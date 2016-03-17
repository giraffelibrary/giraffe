structure GtkSeparatorToolItemClass :>
  GTK_SEPARATOR_TOOL_ITEM_CLASS
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a separator_tool_item = unit
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type 'a class = 'a separator_tool_item tool_item_class
    type t = base class
    fun toBase obj = obj
    val t = GtkToolItemClass.t
    val tOpt = GtkToolItemClass.tOpt
    structure C = GtkToolItemClass.C
  end
