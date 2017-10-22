signature PANGO_ENGINE_SHAPE_CLASS =
  sig
    type 'a engine_shape
    type 'a engine_class
    include
      CLASS
        where type 'a class = 'a engine_shape engine_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
