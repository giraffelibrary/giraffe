structure GdkPixbufPixbufSimpleAnimIter :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER
    where type 'a class_t = 'a GdkPixbufPixbufSimpleAnimIterClass.t =
  struct
    val getType_ = _import "gdk_pixbuf_simple_anim_iter_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GdkPixbufPixbufSimpleAnimIterClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
