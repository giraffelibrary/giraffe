structure GtkCheckButtonClass :>
  GTK_CHECK_BUTTON_CLASS
    where type 'a toggle_button_class_t = 'a GtkToggleButtonClass.t
    where type C.notnull = GtkToggleButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleButtonClass.C.p =
  struct
    type 'a check_button = unit
    type 'a toggle_button_class_t = 'a GtkToggleButtonClass.t
    type 'a t = 'a check_button toggle_button_class_t
    fun toBase obj = obj
    val t = GtkToggleButtonClass.t
    val tOpt = GtkToggleButtonClass.tOpt
    structure C = GtkToggleButtonClass.C
  end
