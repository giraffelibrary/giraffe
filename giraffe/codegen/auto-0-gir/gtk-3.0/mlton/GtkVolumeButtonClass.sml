structure GtkVolumeButtonClass :>
  GTK_VOLUME_BUTTON_CLASS
    where type 'a scale_button_class = 'a GtkScaleButtonClass.class
    where type C.notnull = GtkScaleButtonClass.C.notnull
    where type 'a C.p = 'a GtkScaleButtonClass.C.p =
  struct
    type 'a volume_button = unit
    type 'a scale_button_class = 'a GtkScaleButtonClass.class
    type 'a class = 'a volume_button scale_button_class
    type t = base class
    fun toBase obj = obj
    val t = GtkScaleButtonClass.t
    val tOpt = GtkScaleButtonClass.tOpt
    structure C = GtkScaleButtonClass.C
  end
