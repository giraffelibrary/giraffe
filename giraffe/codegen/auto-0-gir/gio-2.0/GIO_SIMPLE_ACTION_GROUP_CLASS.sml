signature GIO_SIMPLE_ACTION_GROUP_CLASS =
  sig
    type 'a simple_action_group
    include
      CLASS
        where type 'a class = 'a simple_action_group GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
