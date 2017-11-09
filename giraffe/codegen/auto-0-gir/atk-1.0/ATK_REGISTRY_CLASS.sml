signature ATK_REGISTRY_CLASS =
  sig
    type 'a registry
    include
      CLASS
        where type 'a class = 'a registry GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
