signature PANGO_FONT_FAMILY_CLASS =
  sig
    type 'a font_family
    include
      CLASS
        where type 'a class = 'a font_family GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
