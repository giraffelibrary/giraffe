signature GIO_D_BUS_ACTION_GROUP_CLASS =
  sig
    type 'a d_bus_action_group
    include
      CLASS
        where type 'a class = 'a d_bus_action_group GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
