structure GtkSourceGutterRendererClass :>
  GTK_SOURCE_GUTTER_RENDERER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a gutter_renderer = unit
    type 'a class = 'a gutter_renderer class
  end
