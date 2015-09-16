structure GtkVScaleClass :>
  GTK_V_SCALE_CLASS
    where type 'a scale_class_t = 'a GtkScaleClass.t
    where type C.notnull = GtkScaleClass.C.notnull
    where type 'a C.p = 'a GtkScaleClass.C.p =
  struct
    type 'a v_scale = unit
    type 'a scale_class_t = 'a GtkScaleClass.t
    type 'a t = 'a v_scale scale_class_t
    fun toBase obj = obj
    val t = GtkScaleClass.t
    val tOpt = GtkScaleClass.tOpt
    structure C = GtkScaleClass.C
  end
