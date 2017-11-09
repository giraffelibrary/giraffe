signature GIO_SIMPLE_ACTION_GROUP_CLASS =
  sig
    type 'a simple_action_group
    include
      CLASS
        where type 'a class = 'a simple_action_group GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
