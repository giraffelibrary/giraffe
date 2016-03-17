structure GtkArrowClass :>
  GTK_ARROW_CLASS
    where type 'a misc_class = 'a GtkMiscClass.class
    where type C.notnull = GtkMiscClass.C.notnull
    where type 'a C.p = 'a GtkMiscClass.C.p =
  struct
    type 'a arrow = unit
    type 'a misc_class = 'a GtkMiscClass.class
    type 'a class = 'a arrow misc_class
    type t = base class
    fun toBase obj = obj
    val t = GtkMiscClass.t
    val tOpt = GtkMiscClass.tOpt
    structure C = GtkMiscClass.C
  end
