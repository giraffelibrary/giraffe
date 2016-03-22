structure GtkCssProviderClass :>
  GTK_CSS_PROVIDER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a css_provider = unit
    type 'a class = 'a css_provider class
  end
