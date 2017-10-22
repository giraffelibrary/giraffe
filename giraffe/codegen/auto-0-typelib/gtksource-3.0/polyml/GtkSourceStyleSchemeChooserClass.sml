structure GtkSourceStyleSchemeChooserClass :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a style_scheme_chooser = unit
    type 'a class = 'a style_scheme_chooser class
  end
