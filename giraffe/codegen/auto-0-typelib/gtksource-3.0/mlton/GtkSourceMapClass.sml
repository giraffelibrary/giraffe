structure GtkSourceMapClass :>
  GTK_SOURCE_MAP_CLASS
    where type 'a view_class = 'a GtkSourceViewClass.class
    where type C.notnull = GtkSourceViewClass.C.notnull
    where type 'a C.p = 'a GtkSourceViewClass.C.p =
  struct
    type 'a view_class = 'a GtkSourceViewClass.class
    open GtkSourceViewClass
    type 'a map = unit
    type 'a class = 'a map class
  end
