signature GTK_ORIENTABLE_CLASS =
  sig
    type 'a orientable
    include
      CLASS
        where type 'a class = 'a orientable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
