structure GtkVScaleClass :>
  GTK_V_SCALE_CLASS
    where type 'a scale_class = 'a GtkScaleClass.class
    where type C.notnull = GtkScaleClass.C.notnull
    where type 'a C.p = 'a GtkScaleClass.C.p =
  struct
    type 'a scale_class = 'a GtkScaleClass.class
    open GtkScaleClass
    type 'a v_scale = unit
    type 'a class = 'a v_scale class
  end
