signature PANGO_FONTSET_CLASS =
  sig
    type 'a fontset
    include
      CLASS
        where type 'a class = 'a fontset GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
