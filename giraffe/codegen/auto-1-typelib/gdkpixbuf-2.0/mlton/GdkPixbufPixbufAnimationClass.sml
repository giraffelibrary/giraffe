structure GdkPixbufPixbufAnimationClass :>
  GDK_PIXBUF_PIXBUF_ANIMATION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a pixbufanimation = unit
    type 'a t = 'a pixbufanimation GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
