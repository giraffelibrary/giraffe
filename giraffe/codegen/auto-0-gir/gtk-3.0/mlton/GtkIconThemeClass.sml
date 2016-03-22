structure GtkIconThemeClass :>
  GTK_ICON_THEME_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a icon_theme = unit
    type 'a class = 'a icon_theme class
  end
