signature GIO_SIMPLE_ACTION_CLASS =
  sig
    type 'a simple_action
    include
      CLASS
        where type 'a class = 'a simple_action GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
