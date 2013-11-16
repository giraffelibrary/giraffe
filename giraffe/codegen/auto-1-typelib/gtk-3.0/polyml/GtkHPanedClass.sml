structure GtkHPanedClass :>
  GTK_H_PANED_CLASS
    where type 'a panedclass_t = 'a GtkPanedClass.t
    where type C.notnull = GtkPanedClass.C.notnull
    where type 'a C.p = 'a GtkPanedClass.C.p =
  struct
    type 'a hpaned = unit
    type 'a panedclass_t = 'a GtkPanedClass.t
    type 'a t = 'a hpaned panedclass_t
    fun toBase obj = obj
    val t = GtkPanedClass.t
    val tOpt = GtkPanedClass.tOpt
    structure C = GtkPanedClass.C
  end
