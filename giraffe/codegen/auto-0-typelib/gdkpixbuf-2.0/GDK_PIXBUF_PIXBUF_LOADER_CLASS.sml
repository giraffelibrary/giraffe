signature GDK_PIXBUF_PIXBUF_LOADER_CLASS =
  sig
    type 'a pixbuf_loader
    include
      CLASS
        where type 'a class = 'a pixbuf_loader GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
