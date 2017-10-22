structure PangoEngineShape :>
  PANGO_ENGINE_SHAPE
    where type 'a class = 'a PangoEngineShapeClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_engine_shape_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a PangoEngineShapeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
