structure GtkRadioActionClass :>
  GTK_RADIO_ACTION_CLASS
    where type 'a toggle_action_class_t = 'a GtkToggleActionClass.t
    where type C.notnull = GtkToggleActionClass.C.notnull
    where type 'a C.p = 'a GtkToggleActionClass.C.p =
  struct
    type 'a radio_action = unit
    type 'a toggle_action_class_t = 'a GtkToggleActionClass.t
    type 'a t = 'a radio_action toggle_action_class_t
    fun toBase obj = obj
    val t = GtkToggleActionClass.t
    val tOpt = GtkToggleActionClass.tOpt
    structure C = GtkToggleActionClass.C
  end
