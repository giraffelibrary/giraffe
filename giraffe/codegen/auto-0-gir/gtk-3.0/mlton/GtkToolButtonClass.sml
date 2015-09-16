structure GtkToolButtonClass :>
  GTK_TOOL_BUTTON_CLASS
    where type 'a tool_item_class_t = 'a GtkToolItemClass.t
    where type C.notnull = GtkToolItemClass.C.notnull
    where type 'a C.p = 'a GtkToolItemClass.C.p =
  struct
    type 'a tool_button = unit
    type 'a tool_item_class_t = 'a GtkToolItemClass.t
    type 'a t = 'a tool_button tool_item_class_t
    fun toBase obj = obj
    val t = GtkToolItemClass.t
    val tOpt = GtkToolItemClass.tOpt
    structure C = GtkToolItemClass.C
  end
