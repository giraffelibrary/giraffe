structure GdkPixbufPixbufSimpleAnimIter :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER
    where type 'a class = 'a GdkPixbufPixbufSimpleAnimIterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdkpixbuf "gdk_pixbuf_simple_anim_iter_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GdkPixbufPixbufSimpleAnimIterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
