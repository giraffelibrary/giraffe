structure GdkPixbufPixbufSimpleAnimIter :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER
    where type 'a class_t = 'a GdkPixbufPixbufSimpleAnimIterClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_iter_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a GdkPixbufPixbufSimpleAnimIterClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
