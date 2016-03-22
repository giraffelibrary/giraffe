signature GTK_ICON_FACTORY_CLASS =
  sig
    type 'a icon_factory
    include
      CLASS
        where type 'a class = 'a icon_factory GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
