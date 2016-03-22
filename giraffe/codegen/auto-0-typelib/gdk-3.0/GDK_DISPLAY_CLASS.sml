signature GDK_DISPLAY_CLASS =
  sig
    type 'a display
    include
      CLASS
        where type 'a class = 'a display GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
