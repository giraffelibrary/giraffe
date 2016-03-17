structure GtkToolButtonClass :>
  GTK_TOOL_BUTTON_CLASS
    where type 'a tool_item_class = 'a GtkToolItemClass.class
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a tool_button = unit
    type 'a tool_item_class = 'a GtkToolItemClass.class
    type 'a class = 'a tool_button tool_item_class
    type t = base class
    fun toBase obj = obj
    val t = GtkToolItemClass.t
    val tOpt = GtkToolItemClass.tOpt
    structure C = GtkToolItemClass.C
  end
