structure GtkSourceGutterRendererPixbufClass :>
  GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type C.notnull = GtkSourceGutterRendererClass.C.notnull
    where type 'a C.p = 'a GtkSourceGutterRendererClass.C.p =
  struct
    type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    open GtkSourceGutterRendererClass
    type 'a gutter_renderer_pixbuf = unit
    type 'a class = 'a gutter_renderer_pixbuf class
  end
