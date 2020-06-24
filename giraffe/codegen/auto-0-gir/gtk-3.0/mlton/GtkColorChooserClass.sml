structure GtkColorChooserClass :>
  GTK_COLOR_CHOOSER_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a color_chooser = unit
    type 'a class = 'a color_chooser class
  end
