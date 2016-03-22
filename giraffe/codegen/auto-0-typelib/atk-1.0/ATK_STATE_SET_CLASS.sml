signature ATK_STATE_SET_CLASS =
  sig
    type 'a state_set
    include
      CLASS
        where type 'a class = 'a state_set GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
