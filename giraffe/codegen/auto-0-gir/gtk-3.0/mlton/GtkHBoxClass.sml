structure GtkHBoxClass :>
  GTK_H_BOX_CLASS
    where type 'a box_class_t = 'a GtkBoxClass.t
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a h_box = unit
    type 'a box_class_t = 'a GtkBoxClass.t
    type 'a t = 'a h_box box_class_t
    fun toBase obj = obj
    val t = GtkBoxClass.t
    val tOpt = GtkBoxClass.tOpt
    structure C = GtkBoxClass.C
  end
