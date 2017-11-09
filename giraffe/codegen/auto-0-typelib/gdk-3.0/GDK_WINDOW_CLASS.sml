signature GDK_WINDOW_CLASS =
  sig
    type 'a window
    include
      CLASS
        where type 'a class = 'a window GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
