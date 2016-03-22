signature GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS =
  sig
    type 'a pixbuf_simple_anim
    type 'a pixbuf_animation_class
    include
      CLASS
        where type 'a class = 'a pixbuf_simple_anim pixbuf_animation_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
