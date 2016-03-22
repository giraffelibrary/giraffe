structure GdkPixbufPixbufAnimationClass :>
  GDK_PIXBUF_PIXBUF_ANIMATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pixbuf_animation = unit
    type 'a class = 'a pixbuf_animation class
  end
