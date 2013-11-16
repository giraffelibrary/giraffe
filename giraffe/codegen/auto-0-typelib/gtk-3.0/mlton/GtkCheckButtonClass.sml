structure GtkCheckButtonClass :>
  GTK_CHECK_BUTTON_CLASS
    where type 'a togglebuttonclass_t = 'a GtkToggleButtonClass.t
    where type C.notnull = GtkToggleButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleButtonClass.C.p =
  struct
    type 'a checkbutton = unit
    type 'a togglebuttonclass_t = 'a GtkToggleButtonClass.t
    type 'a t = 'a checkbutton togglebuttonclass_t
    fun toBase obj = obj
    val t = GtkToggleButtonClass.t
    val tOpt = GtkToggleButtonClass.tOpt
    structure C = GtkToggleButtonClass.C
  end
