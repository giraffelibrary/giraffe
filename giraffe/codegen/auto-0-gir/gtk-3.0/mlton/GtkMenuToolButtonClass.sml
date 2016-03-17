structure GtkMenuToolButtonClass :>
  GTK_MENU_TOOL_BUTTON_CLASS
    where type 'a tool_button_class = 'a GtkToolButtonClass.class
    where type C.notnull = GtkToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToolButtonClass.C.p =
  struct
    type 'a menu_tool_button = unit
    type 'a tool_button_class = 'a GtkToolButtonClass.class
    type 'a class = 'a menu_tool_button tool_button_class
    type t = base class
    fun toBase obj = obj
    val t = GtkToolButtonClass.t
    val tOpt = GtkToolButtonClass.tOpt
    structure C = GtkToolButtonClass.C
  end
