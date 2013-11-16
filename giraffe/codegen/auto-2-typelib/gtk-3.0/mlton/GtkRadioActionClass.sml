structure GtkRadioActionClass :>
  GTK_RADIO_ACTION_CLASS
    where type 'a toggleactionclass_t = 'a GtkToggleActionClass.t
    where type C.notnull = GtkToggleActionClass.C.notnull
    where type 'a C.p = 'a GtkToggleActionClass.C.p =
  struct
    type 'a radioaction = unit
    type 'a toggleactionclass_t = 'a GtkToggleActionClass.t
    type 'a t = 'a radioaction toggleactionclass_t
    fun toBase obj = obj
    val t = GtkToggleActionClass.t
    val tOpt = GtkToggleActionClass.tOpt
    structure C = GtkToggleActionClass.C
  end
