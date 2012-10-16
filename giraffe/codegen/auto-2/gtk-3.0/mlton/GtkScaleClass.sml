structure GtkScaleClass :>
  GTK_SCALE_CLASS
    where type 'a rangeclass_t = 'a GtkRangeClass.t
    where type C.notnull = GtkRangeClass.C.notnull
    where type 'a C.p = 'a GtkRangeClass.C.p =
  struct
    type 'a scale = unit
    type 'a rangeclass_t = 'a GtkRangeClass.t
    type 'a t = 'a scale rangeclass_t
    fun toBase obj = obj
    val t = GtkRangeClass.t
    val tOpt = GtkRangeClass.tOpt
    structure C = GtkRangeClass.C
  end
