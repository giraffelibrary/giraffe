structure GtkStylePropertiesClass :>
  GTK_STYLE_PROPERTIES_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a style_properties = unit
    type 'a class = 'a style_properties class
  end
