signature ATK_STATE_SET_CLASS =
  sig
    type 'a state_set
    include
      CLASS
        where type 'a class = 'a state_set GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
