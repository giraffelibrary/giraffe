structure GdkPixbufPixbufSimpleAnimClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_CLASS
    where type 'a pixbufanimationclass_t = 'a GdkPixbufPixbufAnimationClass.t
    where type C.notnull = GdkPixbufPixbufAnimationClass.C.notnull
    where type 'a C.p = 'a GdkPixbufPixbufAnimationClass.C.p =
  struct
    type 'a pixbufsimpleanim = unit
    type 'a pixbufanimationclass_t = 'a GdkPixbufPixbufAnimationClass.t
    type 'a t = 'a pixbufsimpleanim pixbufanimationclass_t
    fun toBase obj = obj
    val t = GdkPixbufPixbufAnimationClass.t
    val tOpt = GdkPixbufPixbufAnimationClass.tOpt
    structure C = GdkPixbufPixbufAnimationClass.C
  end
