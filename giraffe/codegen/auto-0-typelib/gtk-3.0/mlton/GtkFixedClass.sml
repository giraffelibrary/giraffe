structure GtkFixedClass :>
  GTK_FIXED_CLASS
    where type 'a container_class = 'a GtkContainerClass.class
    where type C.notnull = GtkContainerClass.C.notnull
    where type 'a C.p = 'a GtkContainerClass.C.p =
  struct
    type 'a fixed = unit
    type 'a container_class = 'a GtkContainerClass.class
    type 'a class = 'a fixed container_class
    type t = base class
    fun toBase obj = obj
    val t = GtkContainerClass.t
    val tOpt = GtkContainerClass.tOpt
    structure C = GtkContainerClass.C
  end
