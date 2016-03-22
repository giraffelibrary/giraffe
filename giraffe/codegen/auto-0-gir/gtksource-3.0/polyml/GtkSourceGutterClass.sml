structure GtkSourceGutterClass :>
  GTK_SOURCE_GUTTER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a gutter = unit
    type 'a class = 'a gutter class
  end
