signature GTK_BUILDABLE_CLASS =
  sig
    type 'a buildable
    include
      CLASS
        where type 'a class = 'a buildable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
