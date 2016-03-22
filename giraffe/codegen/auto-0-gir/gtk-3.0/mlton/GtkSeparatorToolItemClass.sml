structure GtkSeparatorToolItemClass :>
  GTK_SEPARATOR_TOOL_ITEM_CLASS
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a tool_item_class = 'a GtkToolItemClass.class
    open GtkToolItemClass
    type 'a separator_tool_item = unit
    type 'a class = 'a separator_tool_item class
  end
