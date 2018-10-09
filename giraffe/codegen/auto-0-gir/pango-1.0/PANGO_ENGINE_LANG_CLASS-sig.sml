signature PANGO_ENGINE_LANG_CLASS =
  sig
    type 'a engine_lang
    type 'a engine_class
    include
      CLASS
        where type 'a class = 'a engine_lang engine_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
