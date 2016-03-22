signature GTK_ARROW_CLASS =
  sig
    type 'a arrow
    type 'a misc_class
    include
      CLASS
        where type 'a class = 'a arrow misc_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
