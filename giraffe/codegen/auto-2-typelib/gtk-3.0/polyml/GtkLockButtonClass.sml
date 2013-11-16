structure GtkLockButtonClass :>
  GTK_LOCK_BUTTON_CLASS
    where type 'a buttonclass_t = 'a GtkButtonClass.t
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a lockbutton = unit
    type 'a buttonclass_t = 'a GtkButtonClass.t
    type 'a t = 'a lockbutton buttonclass_t
    fun toBase obj = obj
    val t = GtkButtonClass.t
    val tOpt = GtkButtonClass.tOpt
    structure C = GtkButtonClass.C
  end
