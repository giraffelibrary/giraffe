structure GtkToolItemGroupClass :>
  GTK_TOOL_ITEM_GROUP_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a tool_item_group = unit
    type 'a container_class = 'a GtkContainerClass.class
    type 'a class = 'a tool_item_group container_class
    type t = base class
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end
