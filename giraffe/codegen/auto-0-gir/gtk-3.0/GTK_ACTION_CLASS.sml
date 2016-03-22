signature GTK_ACTION_CLASS =
  sig
    type 'a action
    include
      CLASS
        where type 'a class = 'a action GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
