signature ATK_REGISTRY_CLASS =
  sig
    type 'a registry
    include
      CLASS
        where type 'a class = 'a registry GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
