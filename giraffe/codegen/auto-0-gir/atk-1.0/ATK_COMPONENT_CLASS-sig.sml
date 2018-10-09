signature ATK_COMPONENT_CLASS =
  sig
    type 'a component
    include
      CLASS
        where type 'a class = 'a component GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
