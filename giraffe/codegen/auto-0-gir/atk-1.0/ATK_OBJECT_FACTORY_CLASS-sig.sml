signature ATK_OBJECT_FACTORY_CLASS =
  sig
    type 'a object_factory
    include
      CLASS
        where type 'a class = 'a object_factory GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
