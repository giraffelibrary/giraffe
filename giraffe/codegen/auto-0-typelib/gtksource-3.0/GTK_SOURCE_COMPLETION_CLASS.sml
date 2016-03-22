signature GTK_SOURCE_COMPLETION_CLASS =
  sig
    type 'a completion
    include
      CLASS
        where type 'a class = 'a completion GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
