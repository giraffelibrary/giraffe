structure GtkVolumeButtonClass :>
  GTK_VOLUME_BUTTON_CLASS
    where type 'a scale_button_class_t = 'a GtkScaleButtonClass.t
    where type C.notnull = GtkScaleButtonClass.C.notnull
    where type 'a C.p = 'a GtkScaleButtonClass.C.p =
  struct
    type 'a volume_button = unit
    type 'a scale_button_class_t = 'a GtkScaleButtonClass.t
    type 'a t = 'a volume_button scale_button_class_t
    fun toBase obj = obj
    val t = GtkScaleButtonClass.t
    val tOpt = GtkScaleButtonClass.tOpt
    structure C = GtkScaleButtonClass.C
  end
