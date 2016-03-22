signature GDK_VISUAL_CLASS =
  sig
    type 'a visual
    include
      CLASS
        where type 'a class = 'a visual GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
