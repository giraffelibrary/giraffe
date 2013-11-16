structure GtkLabelClass :>
  GTK_LABEL_CLASS
    where type 'a miscclass_t = 'a GtkMiscClass.t
    where type C.notnull = GtkMiscClass.C.notnull
    where type 'a C.p = 'a GtkMiscClass.C.p =
  struct
    type 'a label = unit
    type 'a miscclass_t = 'a GtkMiscClass.t
    type 'a t = 'a label miscclass_t
    fun toBase obj = obj
    val t = GtkMiscClass.t
    val tOpt = GtkMiscClass.tOpt
    structure C = GtkMiscClass.C
  end
