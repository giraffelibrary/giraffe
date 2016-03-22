structure GtkIconFactoryClass :>
  GTK_ICON_FACTORY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a icon_factory = unit
    type 'a class = 'a icon_factory class
  end
