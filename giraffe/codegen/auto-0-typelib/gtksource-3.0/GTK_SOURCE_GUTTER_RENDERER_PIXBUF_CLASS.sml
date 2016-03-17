signature GTK_SOURCE_GUTTER_RENDERER_PIXBUF_CLASS =
  sig
    type 'a gutter_renderer_pixbuf
    type 'a gutter_renderer_class
    type 'a class = 'a gutter_renderer_pixbuf gutter_renderer_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
