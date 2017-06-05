structure GdkPixbufPixbufSimpleAnimIter :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER
    where type 'a class = 'a GdkPixbufPixbufSimpleAnimIterClass.class =
  struct
    val getType_ = _import "gdk_pixbuf_simple_anim_iter_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GdkPixbufPixbufSimpleAnimIterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
