signature GDK_PIXBUF_PIXBUF_ANIMATION =
  sig
    type 'a class
    type 'a pixbuf_animation_iter_class
    type 'a pixbuf_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newFromFile : string -> base class
    val getHeight : 'a class -> LargeInt.int
    val getIter :
      'a class
       -> GLib.TimeValRecord.t
       -> base pixbuf_animation_iter_class
    val getStaticImage : 'a class -> base pixbuf_class
    val getWidth : 'a class -> LargeInt.int
    val isStaticImage : 'a class -> bool
  end
