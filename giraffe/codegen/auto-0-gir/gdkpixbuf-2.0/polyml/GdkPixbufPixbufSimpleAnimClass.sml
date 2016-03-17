structure GdkPixbufPixbufSimpleAnimClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS
    where type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    where type C.notnull = GdkPixbufPixbufAnimationClass.C.notnull
    where type 'a C.p = 'a GdkPixbufPixbufAnimationClass.C.p =
  struct
    type 'a pixbuf_simple_anim = unit
    type 'a pixbuf_animation_class = 'a GdkPixbufPixbufAnimationClass.class
    type 'a class = 'a pixbuf_simple_anim pixbuf_animation_class
    type t = base class
    fun toBase obj = obj
    val t = GdkPixbufPixbufAnimationClass.t
    val tOpt = GdkPixbufPixbufAnimationClass.tOpt
    structure C = GdkPixbufPixbufAnimationClass.C
  end
