signature GDK_SCREEN_CLASS =
  sig
    type 'a screen
    include
      CLASS
        where type 'a class = 'a screen GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
