structure GtkRadioToolButtonClass :>
  GTK_RADIO_TOOL_BUTTON_CLASS
    where type 'a toggletoolbuttonclass_t = 'a GtkToggleToolButtonClass.t
    where type C.notnull = GtkToggleToolButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleToolButtonClass.C.p =
  struct
    type 'a radiotoolbutton = unit
    type 'a toggletoolbuttonclass_t = 'a GtkToggleToolButtonClass.t
    type 'a t = 'a radiotoolbutton toggletoolbuttonclass_t
    fun toBase obj = obj
    val t = GtkToggleToolButtonClass.t
    val tOpt = GtkToggleToolButtonClass.tOpt
    structure C = GtkToggleToolButtonClass.C
  end
