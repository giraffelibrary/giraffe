structure GdkPixbufPixbufLoaderClass :>
  GDK_PIXBUF_PIXBUF_LOADER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a pixbuf_loader = unit
    type 'a class = 'a pixbuf_loader class
  end
