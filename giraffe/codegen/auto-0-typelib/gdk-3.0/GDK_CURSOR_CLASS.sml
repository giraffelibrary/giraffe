signature GDK_CURSOR_CLASS =
  sig
    type 'a cursor
    include
      CLASS
        where type 'a class = 'a cursor GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
