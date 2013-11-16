structure GtkToggleActionClass :>
  GTK_TOGGLE_ACTION_CLASS
    where type 'a actionclass_t = 'a GtkActionClass.t
    where type C.notnull = GtkActionClass.C.notnull
    where type 'a C.p = 'a GtkActionClass.C.p =
  struct
    type 'a toggleaction = unit
    type 'a actionclass_t = 'a GtkActionClass.t
    type 'a t = 'a toggleaction actionclass_t
    fun toBase obj = obj
    val t = GtkActionClass.t
    val tOpt = GtkActionClass.tOpt
    structure C = GtkActionClass.C
  end
