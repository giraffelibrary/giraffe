signature GTK_ACTION_GROUP_CLASS =
  sig
    type 'a action_group
    include
      CLASS
        where type 'a class = 'a action_group GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
