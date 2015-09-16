structure GtkAccelLabelClass :>
  GTK_ACCEL_LABEL_CLASS
    where type 'a label_class_t = 'a GtkLabelClass.t
    where type C.notnull = GtkLabelClass.C.notnull
    where type 'a C.p = 'a GtkLabelClass.C.p =
  struct
    type 'a accel_label = unit
    type 'a label_class_t = 'a GtkLabelClass.t
    type 'a t = 'a accel_label label_class_t
    fun toBase obj = obj
    val t = GtkLabelClass.t
    val tOpt = GtkLabelClass.tOpt
    structure C = GtkLabelClass.C
  end
