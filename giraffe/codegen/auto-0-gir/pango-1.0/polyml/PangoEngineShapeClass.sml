structure PangoEngineShapeClass :>
  PANGO_ENGINE_SHAPE_CLASS
    where type 'a engine_class = 'a PangoEngineClass.class
    where type C.notnull = PangoEngineClass.C.notnull
    where type 'a C.p = 'a PangoEngineClass.C.p =
  struct
    type 'a engine_class = 'a PangoEngineClass.class
    open PangoEngineClass
    type 'a engine_shape = unit
    type 'a class = 'a engine_shape class
  end
