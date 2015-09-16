structure GtkImageClass :>
  GTK_IMAGE_CLASS
    where type 'a misc_class_t = 'a GtkMiscClass.t
    where type C.notnull = GtkMiscClass.C.notnull
    where type 'a C.p = 'a GtkMiscClass.C.p =
  struct
    type 'a image = unit
    type 'a misc_class_t = 'a GtkMiscClass.t
    type 'a t = 'a image misc_class_t
    fun toBase obj = obj
    val t = GtkMiscClass.t
    val tOpt = GtkMiscClass.tOpt
    structure C = GtkMiscClass.C
  end
