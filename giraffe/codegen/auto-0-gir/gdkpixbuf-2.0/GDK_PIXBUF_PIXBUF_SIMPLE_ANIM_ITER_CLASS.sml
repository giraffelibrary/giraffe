signature GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS =
  sig
    type 'a pixbuf_simple_anim_iter
    type 'a pixbuf_animation_iter_class
    type 'a class = 'a pixbuf_simple_anim_iter pixbuf_animation_iter_class
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
