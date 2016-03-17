structure GtkRadioToolButtonClass :>
  GTK_RADIO_TOOL_BUTTON_CLASS
    where type 'a toggle_tool_button_class = 'a GtkToggleToolButtonClass.class
    where type C.notnull = GtkToggleToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleToolButtonClass.C.p =
  struct
    type 'a radio_tool_button = unit
    type 'a toggle_tool_button_class = 'a GtkToggleToolButtonClass.class
    type 'a class = 'a radio_tool_button toggle_tool_button_class
    type t = base class
    fun toBase obj = obj
    val t = GtkToggleToolButtonClass.t
    val tOpt = GtkToggleToolButtonClass.tOpt
    structure C = GtkToggleToolButtonClass.C
  end
