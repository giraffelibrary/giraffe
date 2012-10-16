structure GdkPixbufPixbufLoaderClass :>
  GDK_PIXBUF_PIXBUF_LOADER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a pixbufloader = unit
    type 'a t = 'a pixbufloader GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
