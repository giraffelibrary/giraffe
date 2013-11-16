structure GtkHScaleClass :>
  GTK_H_SCALE_CLASS
    where type 'a scaleclass_t = 'a GtkScaleClass.t
    where type C.notnull = GtkScaleClass.C.notnull
    where type 'a C.p = 'a GtkScaleClass.C.p =
  struct
    type 'a hscale = unit
    type 'a scaleclass_t = 'a GtkScaleClass.t
    type 'a t = 'a hscale scaleclass_t
    fun toBase obj = obj
    val t = GtkScaleClass.t
    val tOpt = GtkScaleClass.tOpt
    structure C = GtkScaleClass.C
  end
