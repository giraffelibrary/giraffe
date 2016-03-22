signature GDK_KEYMAP_CLASS =
  sig
    type 'a keymap
    include
      CLASS
        where type 'a class = 'a keymap GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
