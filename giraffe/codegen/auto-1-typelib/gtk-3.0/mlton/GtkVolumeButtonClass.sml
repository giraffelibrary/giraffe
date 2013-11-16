structure GtkVolumeButtonClass :>
  GTK_VOLUME_BUTTON_CLASS
    where type 'a scalebuttonclass_t = 'a GtkScaleButtonClass.t
    where type C.notnull = GtkScaleButtonClass.C.notnull
    where type 'a C.p = 'a GtkScaleButtonClass.C.p =
  struct
    type 'a volumebutton = unit
    type 'a scalebuttonclass_t = 'a GtkScaleButtonClass.t
    type 'a t = 'a volumebutton scalebuttonclass_t
    fun toBase obj = obj
    val t = GtkScaleButtonClass.t
    val tOpt = GtkScaleButtonClass.tOpt
    structure C = GtkScaleButtonClass.C
  end
