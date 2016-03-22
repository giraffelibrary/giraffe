structure GtkToolItemGroupClass :>
  GTK_TOOL_ITEM_GROUP_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a container_class = 'a GtkContainerClass.class
    open GtkContainerClass
    type 'a tool_item_group = unit
    type 'a class = 'a tool_item_group class
  end
