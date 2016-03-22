signature GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS =
  sig
    type 'a gutter_renderer_pixbuf
    type 'a gutter_renderer_class
    include
      CLASS
        where type 'a class = 'a gutter_renderer_pixbuf gutter_renderer_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
