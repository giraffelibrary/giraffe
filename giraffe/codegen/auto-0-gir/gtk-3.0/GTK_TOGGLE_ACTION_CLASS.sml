signature GTK_TOGGLE_ACTION_CLASS =
  sig
    type 'a toggle_action
    type 'a action_class
    include
      CLASS
        where type 'a class = 'a toggle_action action_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
