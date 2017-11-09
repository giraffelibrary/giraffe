signature PANGO_FONTSET_CLASS =
  sig
    type 'a fontset
    include
      CLASS
        where type 'a class = 'a fontset GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
