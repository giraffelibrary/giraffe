structure GtkHScaleClass :>
  GTK_H_SCALE_CLASS
    where type 'a scale_class = 'a GtkScaleClass.class
    where type C.notnull = GtkScaleClass.C.notnull
    where type 'a C.p = 'a GtkScaleClass.C.p =
  struct
    type 'a h_scale = unit
    type 'a scale_class = 'a GtkScaleClass.class
    type 'a class = 'a h_scale scale_class
    type t = base class
    fun toBase obj = obj
    val t = GtkScaleClass.t
    val tOpt = GtkScaleClass.tOpt
    structure C = GtkScaleClass.C
  end
