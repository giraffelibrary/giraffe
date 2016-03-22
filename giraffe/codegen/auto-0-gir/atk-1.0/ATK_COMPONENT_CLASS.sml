signature ATK_COMPONENT_CLASS =
  sig
    type 'a component
    include
      CLASS
        where type 'a class = 'a component GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
