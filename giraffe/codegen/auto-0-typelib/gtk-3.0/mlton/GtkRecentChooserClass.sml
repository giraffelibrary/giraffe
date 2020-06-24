structure GtkRecentChooserClass :>
  GTK_RECENT_CHOOSER_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a recent_chooser = unit
    type 'a class = 'a recent_chooser class
  end
