structure GtkHPanedClass :>
  GTK_H_PANED_CLASS
    where type 'a paned_class = 'a GtkPanedClass.class
    where type C.notnull = GtkPanedClass.C.notnull
    where type 'a C.p = 'a GtkPanedClass.C.p =
  struct
    type 'a h_paned = unit
    type 'a paned_class = 'a GtkPanedClass.class
    type 'a class = 'a h_paned paned_class
    type t = base class
    fun toBase obj = obj
    val t = GtkPanedClass.t
    val tOpt = GtkPanedClass.tOpt
    structure C = GtkPanedClass.C
  end
