signature GIO_PROPERTY_ACTION_CLASS =
  sig
    type 'a property_action
    include
      CLASS
        where type 'a class = 'a property_action GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
