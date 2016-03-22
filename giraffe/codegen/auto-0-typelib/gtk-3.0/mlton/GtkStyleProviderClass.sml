structure GtkStyleProviderClass :>
  GTK_STYLE_PROVIDER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a style_provider = unit
    type 'a class = 'a style_provider class
  end
