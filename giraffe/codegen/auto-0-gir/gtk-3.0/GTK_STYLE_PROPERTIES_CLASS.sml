signature GTK_STYLE_PROPERTIES_CLASS =
  sig
    type 'a style_properties
    include
      CLASS
        where type 'a class = 'a style_properties GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
