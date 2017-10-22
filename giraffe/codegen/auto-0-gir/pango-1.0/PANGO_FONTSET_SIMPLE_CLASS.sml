signature PANGO_FONTSET_SIMPLE_CLASS =
  sig
    type 'a fontset_simple
    type 'a fontset_class
    include
      CLASS
        where type 'a class = 'a fontset_simple fontset_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
