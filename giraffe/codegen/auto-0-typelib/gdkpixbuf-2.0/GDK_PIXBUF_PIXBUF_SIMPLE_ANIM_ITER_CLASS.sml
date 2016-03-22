signature GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS =
  sig
    type 'a pixbuf_simple_anim_iter
    type 'a pixbuf_animation_iter_class
    include
      CLASS
        where type 'a class = 'a pixbuf_simple_anim_iter pixbuf_animation_iter_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
