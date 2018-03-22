signature PANGO_FONT_CLASS =
  sig
    type 'a font
    include
      CLASS
        where type 'a class = 'a font GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
