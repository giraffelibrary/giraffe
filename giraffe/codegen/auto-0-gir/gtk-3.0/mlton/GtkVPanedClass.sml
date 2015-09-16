structure GtkVPanedClass :>
  GTK_V_PANED_CLASS
    where type 'a paned_class_t = 'a GtkPanedClass.t
    where type C.notnull = GtkPanedClass.C.notnull
    where type 'a C.p = 'a GtkPanedClass.C.p =
  struct
    type 'a v_paned = unit
    type 'a paned_class_t = 'a GtkPanedClass.t
    type 'a t = 'a v_paned paned_class_t
    fun toBase obj = obj
    val t = GtkPanedClass.t
    val tOpt = GtkPanedClass.tOpt
    structure C = GtkPanedClass.C
  end
