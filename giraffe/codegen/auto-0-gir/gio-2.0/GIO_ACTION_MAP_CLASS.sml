signature GIO_ACTION_MAP_CLASS =
  sig
    type 'a action_map
    include
      CLASS
        where type 'a class = 'a action_map GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
