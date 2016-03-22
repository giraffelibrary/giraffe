structure GtkVolumeButtonClass :>
  GTK_VOLUME_BUTTON_CLASS
    where type 'a scale_button_class = 'a GtkScaleButtonClass.class
    where type C.notnull = GtkScaleButtonClass.C.notnull
    where type 'a C.p = 'a GtkScaleButtonClass.C.p =
  struct
    type 'a scale_button_class = 'a GtkScaleButtonClass.class
    open GtkScaleButtonClass
    type 'a volume_button = unit
    type 'a class = 'a volume_button class
  end
