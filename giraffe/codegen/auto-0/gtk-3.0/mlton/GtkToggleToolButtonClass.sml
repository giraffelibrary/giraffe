structure GtkToggleToolButtonClass :>
  GTK_TOGGLE_TOOL_BUTTON_CLASS
    where type 'a toolbuttonclass_t = 'a GtkToolButtonClass.t
    where type C.notnull = GtkToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToolButtonClass.C.p =
  struct
    type 'a toggletoolbutton = unit
    type 'a toolbuttonclass_t = 'a GtkToolButtonClass.t
    type 'a t = 'a toggletoolbutton toolbuttonclass_t
    fun toBase obj = obj
    val t = GtkToolButtonClass.t
    val tOpt = GtkToolButtonClass.tOpt
    structure C = GtkToolButtonClass.C
  end
