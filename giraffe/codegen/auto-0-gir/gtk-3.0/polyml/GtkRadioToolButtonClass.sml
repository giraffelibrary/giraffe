structure GtkRadioToolButtonClass :>
  GTK_RADIO_TOOL_BUTTON_CLASS
    where type 'a toggle_tool_button_class_t = 'a GtkToggleToolButtonClass.t
    where type C.notnull = GtkToggleToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleToolButtonClass.C.p =
  struct
    type 'a radio_tool_button = unit
    type 'a toggle_tool_button_class_t = 'a GtkToggleToolButtonClass.t
    type 'a t = 'a radio_tool_button toggle_tool_button_class_t
    fun toBase obj = obj
    val t = GtkToggleToolButtonClass.t
    val tOpt = GtkToggleToolButtonClass.tOpt
    structure C = GtkToggleToolButtonClass.C
  end
