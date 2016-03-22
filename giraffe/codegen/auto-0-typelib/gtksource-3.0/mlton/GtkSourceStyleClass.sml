structure GtkSourceStyleClass :>
  GTK_SOURCE_STYLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a style = unit
    type 'a class = 'a style class
  end
