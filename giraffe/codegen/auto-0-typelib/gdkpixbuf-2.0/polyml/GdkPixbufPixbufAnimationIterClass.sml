structure GdkPixbufPixbufAnimationIterClass :>
  GDK_PIXBUF_PIXBUF_ANIMATION_ITER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a pixbuf_animation_iter = unit
    type 'a class = 'a pixbuf_animation_iter GObjectObjectClass.class
    type t = base class
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
