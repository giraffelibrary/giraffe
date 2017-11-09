signature GTK_SOURCE_BUFFER_CLASS =
  sig
    type 'a buffer
    include
      CLASS
        where type 'a class = 'a buffer Gtk.TextBufferClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
