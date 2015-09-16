structure GdkPixbufPixbufSimpleAnimIterClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS
    where type 'a pixbuf_animation_iter_class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type C.notnull = GdkPixbufPixbufAnimationIterClass.C.notnull
    where type 'a C.p = 'a GdkPixbufPixbufAnimationIterClass.C.p =
  struct
    type 'a pixbuf_simple_anim_iter = unit
    type 'a pixbuf_animation_iter_class_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a t = 'a pixbuf_simple_anim_iter pixbuf_animation_iter_class_t
    fun toBase obj = obj
    val t = GdkPixbufPixbufAnimationIterClass.t
    val tOpt = GdkPixbufPixbufAnimationIterClass.tOpt
    structure C = GdkPixbufPixbufAnimationIterClass.C
  end
