structure GtkLockButtonClass :>
  GTK_LOCK_BUTTON_CLASS
    where type 'a button_class_t = 'a GtkButtonClass.t
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    type 'a lock_button = unit
    type 'a button_class_t = 'a GtkButtonClass.t
    type 'a t = 'a lock_button button_class_t
    fun toBase obj = obj
    val t = GtkButtonClass.t
    val tOpt = GtkButtonClass.tOpt
    structure C = GtkButtonClass.C
  end
