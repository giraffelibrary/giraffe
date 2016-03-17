structure GtkCheckButtonClass :>
  GTK_CHECK_BUTTON_CLASS
    where type 'a toggle_button_class = 'a GtkToggleButtonClass.class
    where type C.notnull = GtkToggleButtonClass.C.notnull
    where type 'a C.p = 'a GtkToggleButtonClass.C.p =
  struct
    type 'a check_button = unit
    type 'a toggle_button_class = 'a GtkToggleButtonClass.class
    type 'a class = 'a check_button toggle_button_class
    type t = base class
    fun toBase obj = obj
    val t = GtkToggleButtonClass.t
    val tOpt = GtkToggleButtonClass.tOpt
    structure C = GtkToggleButtonClass.C
  end
