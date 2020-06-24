structure GtkFontChooserClass :>
  GTK_FONT_CHOOSER_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a font_chooser = unit
    type 'a class = 'a font_chooser class
  end
