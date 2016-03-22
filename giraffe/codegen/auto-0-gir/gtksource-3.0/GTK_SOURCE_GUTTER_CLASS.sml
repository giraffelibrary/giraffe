signature GTK_SOURCE_GUTTER_CLASS =
  sig
    type 'a gutter
    include
      CLASS
        where type 'a class = 'a gutter GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
