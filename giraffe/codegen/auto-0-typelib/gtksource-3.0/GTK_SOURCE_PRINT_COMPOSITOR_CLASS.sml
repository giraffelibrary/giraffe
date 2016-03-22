signature GTK_SOURCE_PRINT_COMPOSITOR_CLASS =
  sig
    type 'a print_compositor
    include
      CLASS
        where type 'a class = 'a print_compositor GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
