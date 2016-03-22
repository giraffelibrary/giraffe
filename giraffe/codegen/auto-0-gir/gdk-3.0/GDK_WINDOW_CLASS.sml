signature GDK_WINDOW_CLASS =
  sig
    type 'a window
    include
      CLASS
        where type 'a class = 'a window GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
