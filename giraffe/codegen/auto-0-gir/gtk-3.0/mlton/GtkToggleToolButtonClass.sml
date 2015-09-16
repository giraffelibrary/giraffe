structure GtkToggleToolButtonClass :>
  GTK_TOGGLE_TOOL_BUTTON_CLASS
    where type 'a tool_button_class_t = 'a GtkToolButtonClass.t
    where type C.notnull = GtkToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToolButtonClass.C.p =
  struct
    type 'a toggle_tool_button = unit
    type 'a tool_button_class_t = 'a GtkToolButtonClass.t
    type 'a t = 'a toggle_tool_button tool_button_class_t
    fun toBase obj = obj
    val t = GtkToolButtonClass.t
    val tOpt = GtkToolButtonClass.tOpt
    structure C = GtkToolButtonClass.C
  end
