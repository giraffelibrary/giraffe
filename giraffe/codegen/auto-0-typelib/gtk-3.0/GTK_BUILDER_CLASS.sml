signature GTK_BUILDER_CLASS =
  sig
    type 'a builder
    include
      CLASS
        where type 'a class = 'a builder GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
