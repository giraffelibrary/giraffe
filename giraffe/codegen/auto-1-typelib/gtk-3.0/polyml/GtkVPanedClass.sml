structure GtkVPanedClass :>
  GTK_V_PANED_CLASS
    where type 'a panedclass_t = 'a GtkPanedClass.t
    where type C.notnull = GtkPanedClass.C.notnull
    where type 'a C.p = 'a GtkPanedClass.C.p =
  struct
    type 'a vpaned = unit
    type 'a panedclass_t = 'a GtkPanedClass.t
    type 'a t = 'a vpaned panedclass_t
    fun toBase obj = obj
    val t = GtkPanedClass.t
    val tOpt = GtkPanedClass.tOpt
    structure C = GtkPanedClass.C
  end
