signature GIO_ACTION_GROUP_CLASS =
  sig
    type 'a action_group
    include
      CLASS
        where type 'a class = 'a action_group GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
