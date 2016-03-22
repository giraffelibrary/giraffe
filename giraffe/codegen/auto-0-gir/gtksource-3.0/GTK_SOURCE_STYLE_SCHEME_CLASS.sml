signature GTK_SOURCE_STYLE_SCHEME_CLASS =
  sig
    type 'a style_scheme
    include
      CLASS
        where type 'a class = 'a style_scheme GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
