structure GtkSourceStyleSchemeChooserWidgetClass :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_CLASS
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    open GtkBinClass
    type 'a style_scheme_chooser_widget = unit
    type 'a class = 'a style_scheme_chooser_widget class
  end
