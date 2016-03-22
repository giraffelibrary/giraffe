signature GTK_ACTIVATABLE_CLASS =
  sig
    type 'a activatable
    include
      CLASS
        where type 'a class = 'a activatable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
