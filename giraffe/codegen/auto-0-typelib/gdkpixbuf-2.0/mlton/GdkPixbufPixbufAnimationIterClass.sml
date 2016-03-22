structure GdkPixbufPixbufAnimationIterClass :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pixbuf_animation_iter = unit
    type 'a class = 'a pixbuf_animation_iter class
  end
