signature GTK_RADIO_ACTION_CLASS =
  sig
    type 'a radio_action
    type 'a toggle_action_class
    include
      CLASS
        where type 'a class = 'a radio_action toggle_action_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
