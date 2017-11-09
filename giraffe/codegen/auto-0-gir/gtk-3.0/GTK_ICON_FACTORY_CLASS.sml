signature GTK_ICON_FACTORY_CLASS =
  sig
    type 'a icon_factory
    include
      CLASS
        where type 'a class = 'a icon_factory GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
