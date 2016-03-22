structure GdkPixbufPixbufClass :>
  GDK_PIXBUF_PIXBUF_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pixbuf = unit
    type 'a class = 'a pixbuf class
  end
