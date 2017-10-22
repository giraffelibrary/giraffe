structure PangoEngineLangClass :>
  PANGO_ENGINE_LANG_CLASS
    where type 'a engine_class = 'a PangoEngineClass.class
    where type C.notnull = PangoEngineClass.C.notnull
    where type 'a C.p = 'a PangoEngineClass.C.p =
  struct
    type 'a engine_class = 'a PangoEngineClass.class
    open PangoEngineClass
    type 'a engine_lang = unit
    type 'a class = 'a engine_lang class
  end
