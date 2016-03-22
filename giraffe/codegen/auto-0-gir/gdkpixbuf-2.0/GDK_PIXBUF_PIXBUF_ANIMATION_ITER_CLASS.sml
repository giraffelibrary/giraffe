signature GDK_PIXBUF_PIXBUF_ANIMATION_ITER_CLASS =
  sig
    type 'a pixbuf_animation_iter
    include
      CLASS
        where type 'a class = 'a pixbuf_animation_iter GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
