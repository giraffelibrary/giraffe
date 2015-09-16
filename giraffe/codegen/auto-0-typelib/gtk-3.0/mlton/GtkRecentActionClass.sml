structure GtkRecentActionClass :>
  GTK_RECENT_ACTION_CLASS
    where type 'a action_class_t = 'a GtkActionClass.t
    where type C.notnull = GtkActionClass.C.notnull
    where type 'a C.p = 'a GtkActionClass.C.p =
  struct
    type 'a recent_action = unit
    type 'a action_class_t = 'a GtkActionClass.t
    type 'a t = 'a recent_action action_class_t
    fun toBase obj = obj
    val t = GtkActionClass.t
    val tOpt = GtkActionClass.tOpt
    structure C = GtkActionClass.C
  end
