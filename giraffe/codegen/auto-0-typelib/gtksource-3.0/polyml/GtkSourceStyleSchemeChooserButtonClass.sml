structure GtkSourceStyleSchemeChooserButtonClass :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_BUTTON_CLASS
    where type C.notnull = GtkButtonClass.C.notnull
    where type 'a C.p = 'a GtkButtonClass.C.p =
  struct
    open GtkButtonClass
    type 'a style_scheme_chooser_button = unit
    type 'a class = 'a style_scheme_chooser_button class
  end
