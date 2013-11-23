structure GdkPixbufPixbufSimpleAnimIterClass :>
  GDK_PIXBUF_PIXBUF_SIMPLE_ANIM_ITER_CLASS
    where type 'a pixbufanimationiterclass_t = 'a GdkPixbufPixbufAnimationIterClass.t
    where type C.notnull = GdkPixbufPixbufAnimationIterClass.C.notnull
    where type 'a C.p = 'a GdkPixbufPixbufAnimationIterClass.C.p =
  struct
    type 'a pixbufsimpleanimiter = unit
    type 'a pixbufanimationiterclass_t = 'a GdkPixbufPixbufAnimationIterClass.t
    type 'a t = 'a pixbufsimpleanimiter pixbufanimationiterclass_t
    fun toBase obj = obj
    val t = GdkPixbufPixbufAnimationIterClass.t
    val tOpt = GdkPixbufPixbufAnimationIterClass.tOpt
    structure C = GdkPixbufPixbufAnimationIterClass.C
  end
