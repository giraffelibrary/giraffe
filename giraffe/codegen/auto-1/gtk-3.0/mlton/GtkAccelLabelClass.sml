structure GtkAccelLabelClass :>
  GTK_ACCEL_LABEL_CLASS
    where type 'a labelclass_t = 'a GtkLabelClass.t
    where type C.notnull = GtkLabelClass.C.notnull
    where type 'a C.p = 'a GtkLabelClass.C.p =
  struct
    type 'a accellabel = unit
    type 'a labelclass_t = 'a GtkLabelClass.t
    type 'a t = 'a accellabel labelclass_t
    fun toBase obj = obj
    val t = GtkLabelClass.t
    val tOpt = GtkLabelClass.tOpt
    structure C = GtkLabelClass.C
  end
