structure GtkVScaleClass :>
  GTK_V_SCALE_CLASS
    where type 'a scaleclass_t = 'a GtkScaleClass.t
    where type C.notnull = GtkScaleClass.C.notnull
    where type 'a C.p = 'a GtkScaleClass.C.p =
  struct
    type 'a vscale = unit
    type 'a scaleclass_t = 'a GtkScaleClass.t
    type 'a t = 'a vscale scaleclass_t
    fun toBase obj = obj
    val t = GtkScaleClass.t
    val tOpt = GtkScaleClass.tOpt
    structure C = GtkScaleClass.C
  end
