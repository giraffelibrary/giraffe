signature GTK_SOURCE_STYLE_CLASS =
  sig
    type 'a style
    include
      CLASS
        where type 'a class = 'a style GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
