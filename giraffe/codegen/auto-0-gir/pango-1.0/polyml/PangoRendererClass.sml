structure PangoRendererClass :>
  PANGO_RENDERER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a renderer = unit
    type 'a class = 'a renderer class
  end
