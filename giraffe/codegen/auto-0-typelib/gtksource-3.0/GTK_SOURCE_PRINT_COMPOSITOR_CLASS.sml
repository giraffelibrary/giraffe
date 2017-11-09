signature GTK_SOURCE_PRINT_COMPOSITOR_CLASS =
  sig
    type 'a print_compositor
    include
      CLASS
        where type 'a class = 'a print_compositor GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
