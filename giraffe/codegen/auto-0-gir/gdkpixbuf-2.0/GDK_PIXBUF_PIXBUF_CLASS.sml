signature GDK_PIXBUF_PIXBUF_CLASS =
  sig
    type 'a pixbuf
    include
      CLASS
        where type 'a class = 'a pixbuf GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
