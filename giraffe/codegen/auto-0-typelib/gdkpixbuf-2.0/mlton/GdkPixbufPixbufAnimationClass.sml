structure GdkPixbufPixbufAnimationClass :>
  GDK_PIXBUF_PIXBUF_ANIMATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a pixbuf_animation = unit
    type 'a t = 'a pixbuf_animation GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
